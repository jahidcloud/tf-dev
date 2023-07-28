#!/bin/bash

# Variables
repo_name="quickstart-docker-repo"
repo_location="us-central1"
repo_description="Docker repository"


# Check if repository already exists
existing_repo=$(gcloud artifacts repositories list --format="value(name)" --filter="name=${repo_name}")

if [ "$1" = "delete" ]; then
  if [ -n "$existing_repo" ]; then
    echo "Deleting repository: $existing_repo"
    gcloud artifacts repositories delete "$existing_repo" --quiet
    echo "Repository deleted: $existing_repo"
  else
    echo "Repository does not exist: $repo_name"
  fi
else
  if [ -n "$existing_repo" ]; then
    echo "Repository already exists: $existing_repo"
  else
    echo "Repository does not exist: $repo_name"
  fi

  echo "Creating repository: $repo_name"
  gcloud artifacts repositories create "$repo_name" \
    --repository-format=docker \
    --location="$repo_location" \
    --description="$repo_description"
  echo "Repository created: $repo_name"
fi

