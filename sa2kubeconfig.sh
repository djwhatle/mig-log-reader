server=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT
ca=$(cat /run/secrets/kubernetes.io/serviceaccount/ca.crt)
token=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
namespace=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)

export KUBECONFIG=/var/cache/sa2kubeconfig/kubeconfig
oc config set-cluster default-cluster --server=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT \
    --certificate-authority=/run/secrets/kubernetes.io/serviceaccount/ca.crt

oc config set-credentials default-admin \
    --certificate-authority=/run/secrets/kubernetes.io/serviceaccount/ca.crt \
    --token="$token"

oc config set-context default-system --cluster=default-cluster --user=default-admin
oc config use-context default-system
