# docker-images-task

This repository consists of Dockerfiles required for running basic-microservices from https://github.com/kkenan/basic-microservices.

In ``` dockerfiles/ ``` folder you can find ``` Dockerfile.node ``` which creates Docker image for node application from referenced repository and ``` Dockerfile.spring ``` which creates Docker image for spring-boot application.

In order to run this simple application you have to run ``` start_microservices.sh ``` script with following parameters:

1. dbname
2. dbusername
3. dbpassword

Script sets up spring-boot config.yml file and .env file needed for configuring PostgreSQL. After all is set up, it simply runs ``` docker-compose up -d ``` which runs 3 Docker containers (node-app on port 8081, postgresql, spring-boot-app on port 8080) in detached mode.

``` ./start_microservices.sh db user pass ```