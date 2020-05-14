#!/bin/bash -e

read -r -p "Name of the new recipebook postgres docker container: " container_name
read -r -p "Name of the new recipebook postgres docker network: " network_name
read -r -s -p "New password for recipebook postgres database: " account_password
echo ""

echo "Creating container '$container_name'..."
docker run --name "$container_name" -p 127.0.0.1:5432:5432/tcp -e POSTGRES_PASSWORD="$account_password" -d postgres

docker container ls --filter name="$container_name"

echo "Created container '$container_name'..."
echo ""
echo "Creating network '$network_name'..."

docker network create "$network_name"
docker network connect "$network_name" "$(docker container ls -q -a --filter name="$container_name")"

echo "Created network '$network_name'..."
echo ""
echo "Waiting for database to start up..."
sleep 5

echo "Creating empty recipebook database..."
docker run -e PGPASSWORD="$account_password" --rm --network "$network_name" postgres psql -h "$container_name" -U postgres -c 'CREATE DATABASE recipebook'

echo "Setup complete."
echo ""
echo "To interact with the database, run:"
echo ""
echo "  docker run -e PGPASSWORD=$account_password -it --rm --network $network_name postgres psql -h $container_name -U postgres -d recipebook"

# To log into the terminal:
#  docker run -it --rm --network $network_name postgres bash