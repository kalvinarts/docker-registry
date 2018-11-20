#!/usr/bin/env bash

if [ ! $1 ]; then
  echo "Missing username"
  exit 1
fi

if [ ! $2 ]; then
  echo "Missing password"
  exit 1
fi

if [ ! -f .env ]; then
  echo ".env file not found"
  echo "copy .env.sample to .env and modify it to suit your environment"
  exit 1
fi

source .env

docker run \
  -v $REGISTRY_AUTH_VOL:/auth \
  registry:2 sh -c "htpasswd -Bbn $1 $2 >> /auth/htpasswd"
