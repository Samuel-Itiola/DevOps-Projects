#!/bin/bash
# Script to disable deletion protection on existing GKE cluster

PROJECT_ID="arcane-icon-411403"
CLUSTER_NAME="my-first-cluster"
REGION="europe-west2"

echo "Disabling deletion protection on cluster: $CLUSTER_NAME"

gcloud container clusters update $CLUSTER_NAME \
  --project=$PROJECT_ID \
  --region=$REGION \
  --no-enable-deletion-protection

echo "Deletion protection disabled. You can now run terraform destroy or apply."
