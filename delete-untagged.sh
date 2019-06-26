#!/bin/bash

docker exec registry registry garbage-collect /etc/docker/registry/config.yml --delete-untagged=true
