#!/bin/bash

source environment_variables.temp > /dev/null 2>&1 || { echo -e "\nYou need to create your temporary environment_variables.temp based of environment_variables.tmpl!!!\n" && exit 1; }

cd ..
export FROM_DOCKERFILE_TAG
VARIABLES_TO_REPLACE='$FROM_DOCKERFILE_TAG'
envsubst "$VARIABLES_TO_REPLACE" < "Dockerfile.tmpl" > "Dockerfile"

docker build --rm -t="${REGISTRY}centos${IMAGE_TAG}" .
