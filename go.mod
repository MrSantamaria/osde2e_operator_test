module github.com/MrSantamaria/osde2e_operator_test

go 1.16

require (
	github.com/markbates/pkger v0.17.1
	github.com/microcosm-cc/bluemonday v1.0.19 // indirect
	github.com/onsi/ginkgo/v2 v2.3.0
	github.com/onsi/gomega v1.22.1
	github.com/openshift/osde2e v0.0.0-20220720204540-d9e9d1d6e44c
	github.com/operator-framework/api v0.3.6
	github.com/vmware-tanzu/velero v1.5.0-beta.1.0.20200831161009-1dcaa1bf7512
	k8s.io/api v0.23.0
	k8s.io/apimachinery v0.23.0
	k8s.io/client-go v12.0.0+incompatible
)

replace (
	github.com/deislabs/oras => github.com/deislabs/oras v0.7.0
	github.com/docker/docker => github.com/moby/moby v0.7.3-0.20190826074503-38ab9da00309
	github.com/openshift/api => github.com/openshift/api v0.0.0-20200526144822-34f54f12813a
	github.com/openshift/client-go => github.com/openshift/client-go v0.0.0-20200521150516-05eb9880269c

	github.com/operator-framework/operator-sdk => github.com/operator-framework/operator-sdk v0.15.1

	helm.sh/helm/v3 => helm.sh/helm/v3 v3.1.2
	k8s.io/api => k8s.io/api v0.19.2
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.19.2
	k8s.io/apimachinery => k8s.io/apimachinery v0.19.2
	k8s.io/apiserver => k8s.io/apiserver v0.19.2
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.19.2
	k8s.io/client-go => k8s.io/client-go v0.19.2
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.19.2
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.19.2
	k8s.io/code-generator => k8s.io/code-generator v0.19.2
	k8s.io/component-base => k8s.io/component-base v0.19.2
	k8s.io/cri-api => k8s.io/cri-api v0.19.2
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.19.2
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.19.2
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.19.2
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.19.2
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.19.2
	k8s.io/kubectl => k8s.io/kubectl v0.19.2
	k8s.io/kubelet => k8s.io/kubelet v0.19.2
	k8s.io/kubernetes => k8s.io/kubernetes v1.18.0
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.19.2
	k8s.io/metrics => k8s.io/metrics v0.19.2
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.19.2
	sigs.k8s.io/cluster-api-provider-aws => sigs.k8s.io/cluster-api-provider-aws v0.6.0
	sigs.k8s.io/controller-runtime => sigs.k8s.io/controller-runtime v0.5.1-0.20200414221803-bac7e8aaf90a
	sigs.k8s.io/structured-merge-diff => sigs.k8s.io/structured-merge-diff v1.0.1-0.20191108220359-b1b620dd3f06
)
