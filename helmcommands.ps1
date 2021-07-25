.\helm.exe repo add prometheus-community https://prometheus-community.github.io/helm-charts
.\helm.exe repo update
# Helm install
.\helm.exe install prometheus-monitoring  prometheus-community/kube-prometheus-stack -n prometheus-monitoring --kubeconfig .\kubeconfig
#helm unintsall
#.\helm.exe uninstall prometheus --kubeconfig .\kubeconfig