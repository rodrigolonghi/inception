#!/bin/bash
if docker ps | wc -l | grep -q 1;
	then echo "stop_containers.sh: empty";
	else docker stop $(docker ps -qa);
fi
