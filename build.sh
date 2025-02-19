#!/bin/bash

export DOCKER_BUILDKIT=1

docker build --platform linux/amd64,linux/arm64 --build-arg PHP_VERSION=7.4 -t flywp/php:7.4 -f php/Dockerfile php --push
docker build --platform linux/amd64,linux/arm64 --build-arg PHP_VERSION=8.0 -t flywp/php:8.0 -f php/Dockerfile php --push
docker build --platform linux/amd64,linux/arm64 --build-arg PHP_VERSION=8.1 -t flywp/php:8.1 -f php/Dockerfile php --push
docker build --platform linux/amd64,linux/arm64 --build-arg PHP_VERSION=8.2 -t flywp/php:8.2 -f php/Dockerfile php --push
docker build --platform linux/amd64,linux/arm64 --build-arg PHP_VERSION=8.3 -t flywp/php:8.3 -f php/Dockerfile php --push
