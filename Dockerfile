FROM quay.io/openshift/origin-must-gather:4.5.0 as oc


FROM registry.access.redhat.com/ubi8-minimal:latest

COPY --from=oc /usr/bin/oc /usr/bin/oc
COPY bin/stern_linux_amd64_1.11.0 /usr/bin/stern

# Set up overrideable command in ENV
CMD stern $STERN_CMD && sleep 5m
