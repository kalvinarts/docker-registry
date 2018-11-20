# docker-registry scripts

Simple scripts to spin a registry:2 container with basic authentication and TLS encryption using [docker-compose-letsencrypt-nginx-proxy-companion](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion)

### Usage

First setup your [docker-compose-letsencrypt-nginx-proxy-companion](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion) environment.

Clone this repo:

`git clone https://github.com/kalvinarts/docker-registry.git`

Copy the `env.sample` to `.env` and modify it to suit your environment.

Create a users with:

`./add-user.sh <username> <password>`

Create the registry container with:

`./create-registry.sh`

Login to your new registry:

`docker login https://your.registry.com`


