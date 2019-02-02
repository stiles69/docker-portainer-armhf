![Rogue Designs Logo](https://storage.googleapis.com/stiles-images/RogueLogo-256x158.png)

## Rogue Designs ##


### docker-portainer-armhf ###

PORTAINER INSTALLATION USING DOCKER
Portainer runs as a lightweight Docker container (the Docker image weights less than 4MB) on a Docker engine or Swarm cluster. Therefore, you are one command away from running container on any machine using Docker.

DEPLOY PORTAINER
Use the following Docker commands to deploy Portainer:

$ docker volume create portainer_data
$ docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

										
You'll just need to access the port 9000 of the Docker engine where portainer is running using your browser. 

Note: the -v /var/run/docker.sock:/var/run/docker.sock option can be used in Linux environments only.
MANAGE A SWARM CLUSTER WITH PORTAINER
Deploying Portainer to manage a Swarm cluster is just as easy ! You can directly deploy Portainer as a service in your Docker cluster.

$ docker volume create portainer_data
$ docker service create \
--name portainer \
--publish 9000:9000 \
--replicas=1 \
--constraint 'node.role == manager' \
--mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
--mount type=volume,src=portainer_data,dst=/data \
portainer/portainer \
-H unix:///var/run/docker.sock

										
USING DOCKER-COMPOSE
You can use the following Compose file to start Portainer:

version: '2'

services:
  portainer:
    image: portainer/portainer
    ports:
      - "9000:9000"
    command: -H unix:///var/run/docker.sock
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data

volumes:
  portainer_data:

										
Download the Compose file
AND MORE DEPLOYMENT SCENARIOS
Have a look at our installation documentation for more deployment scenarios such as Portainer with data persistence, TLS authentication enabled engine, non-Docker setup or reverse proxy integrations.
