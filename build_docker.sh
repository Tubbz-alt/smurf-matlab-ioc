#!/usr/bin/env bash

# Use the git tag to tag the docker image
app_version=$(git describe --tags --always)

# Build the docker and tagged it with the application version
docker build -t jesusvasquez333/smurf-matlab-ioc .
docker tag jesusvasquez333/smurf-matlab-ioc jesusvasquez333/smurf-matlab-ioc:${app_version}
printf "Docker image created: jesusvasquez333/smurf-matlab-ioc:${app_version}\n"
