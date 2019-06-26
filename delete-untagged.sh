#!/bin/bash

if [ ! -f .env ]; then
  echo ".env file not found"
  echo "copy .env.sample to .env and modify it to suit your environment"
  exit 1
fi

source .env

docker exec $REGISTRY_NAME registry garbage-collect /etc/docker/registry/config.yml --delete-untagged=true
