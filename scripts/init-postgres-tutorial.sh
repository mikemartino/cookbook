#!/bin/bash -e

read -r -p "Name of the new postgres docker container: " container_name
read -r -p "Name of the new postgres docker network: " network_name
read -r -s -p "New password for postgres database: " account_password
echo ""

echo "Creating container '$container_name'..."
docker run --name "$container_name" -e POSTGRES_PASSWORD="$account_password" -d postgres

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

echo "Creating empty dvdrental database..."
docker run -e PGPASSWORD="$account_password" --rm --network "$network_name" postgres psql -h "$container_name" -U postgres -c 'CREATE DATABASE dvdrental'

echo "Uploading dvdrental database from https://postgresqltutorial.com..."
docker exec -i "$container_name" pg_restore -U postgres -d dvdrental < <(wget -q https://sp.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip -O - | funzip)

echo "Database upload complete."
echo ""
echo "Running psql query to test upload. This should output a few actors from the 'actor' table."
echo ""

docker run -e PGPASSWORD="$account_password" --rm --network "$network_name" postgres psql -h "$container_name" -U postgres -d dvdrental -c 'select * from actor limit 10;'

echo "Setup complete."
echo ""
echo "To interact with the database, run:"
echo ""
echo "  docker run -e PGPASSWORD=$account_password -it --rm --network $network_name postgres psql -h $container_name -U postgres -d dvdrental"

