#!/bin/bash  
#====================================================
#
#          FILE: Docker-Swarm-Stack-Deploy.sh
# 
#         USAGE: ./Docker-Swarm-Stack-Deploy.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 10/25/2018 09:04
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker stack deploy --compose-file=portainer-agent-stack.yml portainer
}	# end Main

Main

#===EXIT===
exit 0

