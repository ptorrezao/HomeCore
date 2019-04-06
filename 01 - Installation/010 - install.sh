#/bin/bash

#Updates
apt-get update -qq
apt-get upgrade -qqy

#Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
