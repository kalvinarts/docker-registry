#!/bin/bash

if [ ! -f .env ]; then
  echo ".env file not found"
  echo "copy .env.sample to .env and modify it to suit your environment"
  exit 1
fi

source .env

docker run -d \
  --restart=$REGISTRY_RESTART \
  --name $REGISTRY_NAME \
  -v $REGISTRY_AUTH_VOL:/auth \
  -v $REGISTRY_DATA_VOL:/var/lib/registry \
  -v $REGISTRY_CONF_VOL:/etc/docker/registry \
  -e "VIRTUAL_HOST=$REGISTRY_VIRTUAL_HOST" \
  -e "LETSENCRYPT_HOST=$REGISTRY_LETSENCRYPT_HOST" \
  -e "LETSENCRYPT_EMAIL=$REGISTRY_LETSENCRYPT_EMAIL" \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  -e "REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd" \
  -e "REGISTRY_STORAGE_DELETE_ENABLED=$DELETE_ENABLED" \
  --network $REGISTRY_NETWORK \
  registry:2

