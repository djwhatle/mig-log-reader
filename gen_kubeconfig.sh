server=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT
ca=$(cat /run/secrets/kubernetes.io/serviceaccount/ca.crt)
token=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
namespace=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)

echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: default
    user: default-user
current-context: default-context
users:
- name: default-user
  user:
    token: ${token}
" > sa.kubeconfig

# https://stackoverflow.com/questions/47770676/how-to-create-a-kubectl-config-file-for-serviceaccount