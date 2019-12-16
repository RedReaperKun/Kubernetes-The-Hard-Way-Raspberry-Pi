#!/bin/bash
# Generate kubeadmin kubeconfig

kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority="../ca/ca.pem" \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=admin.kubeconfig

kubectl config set-credentials admin \
    --client-certificate="../ca/admin.pem" \
    --client-key="../ca/admin-key.pem" \
    --embed-certs=true \
    --kubeconfig=admin.kubeconfig

kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=admin \
    --kubeconfig=admin.kubeconfig

kubectl config use-context default --kubeconfig=admin.kubeconfig