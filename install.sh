cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
--------------------------------------------
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
-------------------------------------------------------------------
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
------------------

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
----------------
sudo apt-get update
------
sudo apt-get install -y kubelet kubeadm kubectl
----
sudo apt-mark hold kubelet kubeadm kubectl
----



 https://github.com/istio/istio/releases/download/1.9.0/istio-1.9.0-linux-amd64.tar.gz
---
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

kubectl create secret docker-registry docker-hub-secret  -n keycloak --docker-server=https://index.docker.io/v2/ --docker-username=katonic --docker-password=4049b650-86c8-4df5-b8ac-c75c6155b8ba