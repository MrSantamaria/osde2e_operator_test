.PHONY: check generate build-image push-image push-latest test

PKG := github.com/MrSantamaria/osde2e_operator_test

DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

OUT_DIR := $(DIR)out
OSDTESTS := $(DIR)out/osd-tests

OSDTESTS_IMAGE_NAME := quay.io/app-sre/osd-tests
IMAGE_TAG := $(shell git rev-parse --short=7 HEAD)

CONTAINER_ENGINE ?= docker

ifndef $(GOPATH)
    GOPATH=$(shell go env GOPATH)
    export GOPATH
endif

check: vipercheck
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(shell go env GOPATH)/bin v1.23.8
	(cd "$(DIR)"; golangci-lint run -c .golang-ci.yml ./...)
	
	CGO_ENABLED=0 go test -v $(PKG)/cmd/... $(PKG)/pkg/...

vipercheck:
	@if [ "$(shell go list -f '{{.Name}} {{.Imports}}' ./... | grep -v -E "^concurrentviper" | grep 'github.com/spf13/viper'| wc -l)" -gt 0 ]; then echo "Error: Code contains direct import of github.com/spf13/viper, use github.com/openshift/osde2e/pkg/common/concurrentviper instead." && exit 1; fi

build-image:
	$(CONTAINER_ENGINE) build -f "$(DIR)Dockerfile" -t "$(OSDTESTS_IMAGE_NAME):$(IMAGE_TAG)" .

push-image:
	@$(CONTAINER_ENGINE) --config=$(DOCKER_CONF) push "$(OSDTESTS_IMAGE_NAME):$(IMAGE_TAG)"
	@$(CONTAINER_ENGINE) --config=$(DOCKER_CONF) push "$(OSDTESTSCTL_IMAGE_NAME):$(IMAGE_TAG)"

push-latest:
	$(CONTAINER_ENGINE) tag "$(OSDTESTS_IMAGE_NAME):$(IMAGE_TAG)" "$(OSDTESTS_IMAGE_NAME):latest"
	@$(CONTAINER_ENGINE) --config=$(DOCKER_CONF) push "$(OSDTESTS_IMAGE_NAME):latest"
	$(CONTAINER_ENGINE) tag "$(OSDTESTSCTL_IMAGE_NAME):$(IMAGE_TAG)" "$(OSDTESTSCTL_IMAGE_NAME):latest"
	@$(CONTAINER_ENGINE) --config=$(DOCKER_CONF) push "$(OSDTESTSCTL_IMAGE_NAME):latest"

build: pkger build-quick

build-quick:
	mkdir -p "$(OUT_DIR)"
	go build -o "$(OUT_DIR)"/osd-tests "$(DIR)cmd/..."

pkger:
	GOFLAGS='' go get github.com/markbates/pkger/cmd/pkger
	pkger --include $(DIR)assets