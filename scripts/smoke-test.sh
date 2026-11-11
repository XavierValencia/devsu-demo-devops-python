#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:?usage: smoke-test.sh <base-url>}"
DNI="$(date +%s)$((RANDOM % 900 + 100))"

for i in $(seq 1 20); do
  curl -fsS "$BASE_URL/health/ready" && break
  sleep 3
done
echo

curl -fsS -X POST "$BASE_URL/api/users/" \
  -H 'Content-Type: application/json' \
  -d "{\"dni\": \"$DNI\", \"name\": \"smoke-test\"}"
echo

curl -fsS "$BASE_URL/api/users/"
echo
