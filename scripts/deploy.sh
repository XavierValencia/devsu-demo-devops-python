#!/usr/bin/env bash
set -euo pipefail

IMAGE="${1:?usage: deploy.sh <image:tag>}"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

cp -r "$ROOT_DIR/k8s/." "$WORK_DIR/"
sed -i -e "s|newName: .*|newName: ${IMAGE%:*}|" -e "s|newTag: .*|newTag: ${IMAGE##*:}|" "$WORK_DIR/kustomization.yaml"

kubectl apply -f "$WORK_DIR/namespace.yaml"
kubectl -n devsu-demo create secret generic devsu-demo-secrets \
  --from-literal=DJANGO_SECRET_KEY="$DJANGO_SECRET_KEY" \
  --from-literal=POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -k "$WORK_DIR"

kubectl -n devsu-demo rollout status statefulset/postgres --timeout=300s
kubectl -n devsu-demo rollout status deployment/devsu-demo-python --timeout=300s
kubectl -n devsu-demo get pods,svc,ingress,hpa
