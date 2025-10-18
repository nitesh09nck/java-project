#!/bin/bash

# ===============================
# Minikube Setup & Java Project Deployment
# ===============================

set -e

echo "🚨 Stopping and deleting any existing Minikube cluster..."
minikube stop || true
minikube delete || true

echo "🚀 Starting a fresh Minikube cluster with 4 CPUs and 8GB RAM..."
minikube start --cpus=4 --memory=8192 --driver=docker

echo "✅ Minikube cluster started."
minikube status

# Optional: alias kubectl to minikube's version
alias kubectl='minikube kubectl --'

echo "📦 Deploying Java project to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "🔍 Checking pod status..."
kubectl get pods

# Scale up to 5 replicas
echo "⬆️ Scaling deployment to 5 replicas..."
kubectl scale deployment java-project-deployment --replicas=5
kubectl get pods

# Wait a few seconds to let pods stabilize
sleep 10

# Scale down to 1 replica
echo "⬇️ Scaling deployment back to 1 replica..."
kubectl scale deployment java-project-deployment --replicas=1
kubectl get pods

# Get the service URL
SERVICE_URL=$(minikube service java-project-service --url)
echo "🌐 Application is running at: $SERVICE_URL"
echo "Try: curl $SERVICE_URL/health or $SERVICE_URL/greeting"

echo "🎉 Done! Minikube cluster is healthy, app deployed, pods scaled, and service URL ready."

