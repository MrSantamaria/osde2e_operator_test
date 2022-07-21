FROM registry.ci.openshift.org/openshift/release:golang-1.16

ENV GOFLAGS=
ENV PKG=/go/src/github.com/MrSantamaria/osde2e_operator_test/
WORKDIR ${PKG}

COPY . .
RUN go env
RUN make check
RUN make build

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

RUN mkdir /osd-tests
COPY --from=0 /go/src/github.com/MrSantamaria/osde2e_operator_test/bin/osd-tests /osd/osd-tests
# Restore the /osd-tests path for backwards compatibility
RUN ln -s /osd-tests/osd-tests /osd-tests
ENV PATH "/osd-tests:$PATH"

ENTRYPOINT [ "osd-tests" ]
