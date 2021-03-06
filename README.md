# Kubernetes CI/CD Deployment to GCP with Travis CI

## Requirements

### Travis -- Local PC
- `docker run -it -v ${pwd}:/app ruby:2.3 sh`
- `gem install travis`
- `travis login`
- `travis encrypt-file service-account.json -r stwalez/multi-k8s`

### Secret -- GCP CLI
- `kubectl create secret generic pgpassword --from-literal PG_PASSWORD=*[enterpassword]*`

### Helm Setup -- GCP CLI
- `curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh`
- `chmod 700 get_helm.sh`
- `./get_helm.sh`

### Ingress Controller Setup via Helm -- GCP CLI
- `helm repo add stable https://kubernetes-charts.storage.googleapis.com/`
- `helm install my-nginx stable/nginx-ingress --set rbac.create=true`


### Cert Manager Setup -- GCP CLI
- `kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml`
- `kubectl create namespace cert-manager`
- `helm repo add jetstack https://charts.jetstack.io`
- `helm repo update`
- `helm install cert-manager --namespace cert-manager --version v0.11.0 jetstack/cert-manager`