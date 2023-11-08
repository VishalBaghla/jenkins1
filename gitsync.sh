#!/bin/bash
printenv
cat akamai.yml |
sed -e 's/INGRESS_NAME/${env.INGRESS_NAME}/g' \
    -e 's/K8S_NAMESPACE/${env.K8S_NAMESPACE}/g' \
    -e 's/FINAL_SUBDOMAIN/${env.FINAL_SUBDOMAIN}/g' \
    -e 's/FINAL_DOMAIN/${env.FINAL_DOMAIN}/g' \
    -e 's/DEPLOYMENT_MODE/${env.DEPLOYMENT_MODE}/g' \
> akamai_updated.yml
kubectl apply -f akamai_updated.yml --dry-run=client