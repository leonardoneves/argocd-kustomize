download:
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
create cluster:
k3d cluster create mycluster --agents 3 --servers 1 --api-port 6443 -p 8080:80@loadbalancer
fix metrics configuration to avoid warnings:
kubectl patch deployment -n kube-system metrics-server --type=json -p='[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'
check all good:
k cluster-info

alternative to fix the issue:
https://stackoverflow.com/questions/71843068/metrics-server-is-currently-unable-to-handle-the-request
wget https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml
kubectl delete -f components.yaml
sed -i '/--metric-resolution=15s/a\        - --kubelet-insecure-tls' components.yaml
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml
kubectl get nodes
k cluster-info

bash completion (optional):
echo "source <(k3d completion bash)" >> ~/.bashrc
source ~/.bashrc
