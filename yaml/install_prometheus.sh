##!/usr/bin/env bash
set -e
echo "Creating namespace"
NS='monitoring'
if kubectl get ns | grep -iq $NS;
then
    echo "Namespace $NS already exists";
else
    echo "Creating namespace $NS"
    kubectl create namespace $NS;
fi
echo "Installing/Upgrading Prometheus"

# Fix for Helm 3
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/release-0.38/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/release-0.38/example/prometheus-operator-crd/monitoring.coreos.com_podmonitors.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/release-0.38/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/release-0.38/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/release-0.38/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/release-0.38/example/prometheus-operator-crd/monitoring.coreos.com_thanosrulers.yaml

#helm upgrade prometheus-operator --install prometheus \
helm install prometheus-operator  \
stable/prometheus-operator \
--namespace monitoring \
--values ../helm/prometheus_values.yaml
# --values ../helm/alertmanager_values.yaml \
