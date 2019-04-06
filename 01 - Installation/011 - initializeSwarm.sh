#/bin/bash
docker swarm init
MANAGER_TOKEN=`docker swarm join-token manager | grep token | awk '{ print $5 }'`
WORKER_TOKEN=`docker swarm join-token worker | grep token | awk '{ print $5 }'`

