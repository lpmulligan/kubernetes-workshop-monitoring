##!/usr/bin/env bash

echo "Deleting Prometheus"
helm delete prometheus
kubectl -n monitoring delete crd --all
kubectl delete namespace monitoring --cascade=true
kubectl delete validatingwebhookconfigurations prometheus-operator-admission
kubectl delete validatingwebhookconfigurations prometheus-operator-admission
kubectl delete PodSecurityPolicy prometheus-grafana prometheus-grafana-test prometheus-kube-state-metrics prometheus-operator-alertmanager prometheus-operator-grafana prometheus-operator-grafana-test prometheus-operator-kube-state-metrics prometheus-operator-operator prometheus-operator-prometheus prometheus-operator-prometheus-node-exporter prometheus-prometheus-node-exporter prometheus-prometheus-oper-alertmanager prometheus-prometheus-oper-operator prometheus-prometheus-oper-prometheus
kubectl delete ClusterRole prometheus-grafana-clusterrole prometheus-kube-state-metrics prometheus-operator-grafana-clusterrole prometheus-operator-kube-state-metrics prometheus-operator-operator prometheus-operator-operator-psp prometheus-operator-prometheus prometheus-operator-prometheus-psp prometheus-prometheus-oper-operator prometheus-prometheus-oper-operator-psp prometheus-prometheus-oper-prometheus prometheus-prometheus-oper-prometheus-psp psp-prometheus-kube-state-metrics psp-prometheus-operator-kube-state-metrics psp-prometheus-operator-prometheus-node-exporter psp-prometheus-prometheus-node-exporter

kubectl delete ClusterRoleBinding prometheus-grafana-clusterrolebinding prometheus-kube-state-metrics prometheus-operator-grafana-clusterrolebinding prometheus-operator-kube-state-metrics prometheus-operator-operator prometheus-operator-operator-psp \ prometheus-operator-prometheus prometheus-operator-prometheus-psp prometheus-prometheus-oper-operator prometheus-prometheus-oper-operator-psp prometheus-prometheus-oper-prometheus prometheus-prometheus-oper-prometheus-psp \  psp-prometheus-kube-state-metrics psp-prometheus-operator-kube-state-metrics psp-prometheus-operator-prometheus-node-exporter psp-prometheus-prometheus-node-exporter prometheus-operator-prometheus

kubectl delete svc -n kube-system prometheus-operator-coredns prometheus-operator-kube-controller-manager prometheus-operator-kube-etcd prometheus-operator-kube-proxy prometheus-operator-kube-proxy prometheus-operator-kube-scheduler prometheus-operator-kubelet prometheus-prometheus-oper-coredns prometheus-prometheus-oper-kube-controller-manager prometheus-prometheus-oper-kube-etcd prometheus-prometheus-oper-kube-proxy prometheus-prometheus-oper-kube-scheduler prometheus-prometheus-oper-kubelet
