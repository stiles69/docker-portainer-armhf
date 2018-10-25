#!/bin/bash  
#====================================================
#
#          FILE: Start-Portainer-Service-Swarm-Manager.sh
# 
#         USAGE: ./Start-Portainer-Service-Swarm-Manager.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 10/25/2018 09:02
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
docker service create \
	--name portainer \
	--publish 9000:9000 \
	--replicas=1 \
	--constraint 'node.role == manager' \
	--mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
	--mount type=volume,src=portainer_data,dst=/data \
	portainer/portainer \
	-H unix:///var/run/docker.sock







}	# end Main

Main

#===EXIT===
exit 0

