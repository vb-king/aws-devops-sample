#!/usr/bin/env bash
set -e


# Usage: ./deploy.sh <aws-region> <account-id> <repo-name> <tag>
REGION=${1:-ap-south-1}
ACCOUNT_ID=${2:?"account id required"}
REPO=${3:-my-app}
TAG=${4:-latest}


IMAGE="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO:$TAG"


echo "Logging into ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com


echo "Pulling image $IMAGE"
docker pull $IMAGE


# Stop and remove existing container if exists
if docker ps -q --filter "name=$REPO" | grep -q .; then
echo "Stopping existing container..."
docker stop $REPO || true
docker rm $REPO || true
fi


# Run new container
echo "Running container $REPO"
docker run -d --name $REPO -p 80:3000 --restart unless-stopped $IMAGE


echo "Deployed $IMAGE on port 80"
