FROM quay.io/openshift/origin-must-gather:4.5.0 as oc


FROM registry.access.redhat.com/ubi8-minimal:latest

COPY --from=oc /usr/bin/oc /usr/bin/oc
COPY bin/stern_linux_amd64_1.11.0 /usr/bin/stern
COPY sa2kubeconfig.sh /usr/bin/sa2kubeconfig.sh

# Set up overrideable command in ENV
CMD sa2kubeconfig.sh && stern --kubeconfig /tmp/kubeconfig "migration-controller|migration-ui|registry|restic|velero" --exclude-container discovery --exclude "watch is too old" --tail=0 --color always
# CMD stern $STERN_CMD && sleep 5m

