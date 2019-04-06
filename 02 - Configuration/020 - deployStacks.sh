#/bin/bash

TRAEFIKURL=https://raw.githubusercontent.com/ptorrezao/ComposeLib/master/Traefik/traefik.yml
TRAEFIKYAML=traefik.yml

PORTAINERURL=https://raw.githubusercontent.com/ptorrezao/ComposeLib/master/Portainer/portainer.yml
PORTAINERYAML=portainer.yml

PORTAINEREXTENDURL=https://raw.githubusercontent.com/ptorrezao/ComposeLib/master/Traefik/portainer.traefik.yml
PORTAINERYEXTENDAML=portainer.traefik.yml

docker network create --driver=overlay traefik_net

#Traefik
curl -fsSL $TRAEFIKURL -o $TRAEFIKYAML
curl -fsSL $PORTAINERURL -o $PORTAINERYAML
curl -fsSL $PORTAINEREXTENDURL -o $PORTAINERYEXTENDAML

export TARGETDOMAIN=ptorrezao.duckdns.org
export ACMEEMAIL=pedro.torrezao@gmail.com

docker stack deploy \
    -c $TRAEFIKYAML \
    -c $PORTAINERYAML \
    -c $PORTAINERYEXTENDAML \
    System