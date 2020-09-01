#!/bin/bash

# parameters for database
dbname=$1
dbusername=$2
dbpassword=$3

# copy template files for spring config and .env for docker-compose
cp ./dockerfiles/config.template.yml ./dockerfiles/config.yml
cp ./.env.template ./.env

# replace postgres credentials in .env file
sed -i -e "s/{{POSTGRES_DB}}/$dbname/g" .env
sed -i -e "s/{{POSTGRES_USER}}/$dbusername/g" .env
sed -i -e "s/{{POSTGRES_PASSWORD}}/$dbpassword/g" .env

# replace postgres credentials in config.yml file
sed -i -e "s/{{dbname}}/$dbname/g" ./dockerfiles/config.yml
sed -i -e "s/{{dbusername}}/$dbusername/g" ./dockerfiles/config.yml
sed -i -e "s/{{dbpassword}}/$dbpassword/g" ./dockerfiles/config.yml

# start microservices
docker-compose up -d 

# remove .env file
rm .env
