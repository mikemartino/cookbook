#!/bin/bash -e

remove_postgres_configuration() {
	# Deleting container.
	docker container ls -a
	echo ""
	read -r -p "Enter the container name (hit Enter to skip): " container_name

	if [ -z "$container_name" ]
	then
		echo "Container name cannot be empty. Skipping container deletion."
	else
		container_id=$(docker container ls -q -a --filter name="$container_name")
	
		if [ -z "$container_id" ]
		then
			echo "Could not find a container by that name. Skipping container deletion."
		else
			echo "Stopping and removing container ID '$container_id'..."
			docker stop "$container_id"
			docker rm "$container_id"
		fi
	fi


	# Deleting network.
	docker network ls
	read -r -p "Enter the network name (hit Enter to skip): " network_name
	if [ -z "$network_name" ]
	then
		echo "Skipping network deletion."
	else
		network_id=$(docker network ls -q --filter name="$network_name")
		echo ""
		if [ -z "$network_id" ]
		then
			echo "Could not find network by that name. Skipping network deletion."
		else
			echo "Deleting network ID '$network_id...'"
			docker network rm "$network_id"
		fi
	fi
	

	echo ""
	echo "Deletion script complete."
}

while true; do
	read -r -p "Are you sure you want to delete all postgres configuration (Y/n)? " yn
	case $yn in
		[Yy]* ) remove_postgres_configuration; break;;
	        [Nn]* ) exit;;
        	* ) echo "Please answer yes or no.";;
   	esac
done
