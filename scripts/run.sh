#!/bin/bash

# Pass TRUE to the first argument to make continous builds happen

DOCKER_NAME="resume_builder"

function build_image_once {
    # Check if the image exists and if not build it
    image=$( docker images -q $DOCKER_NAME)
    if [[ -n "$image" ]]; then
        echo "Docker image tagged as $DOCKER_NAME exists."
    else
        echo "Docker image tagged as $DOCKER_NAME does not exist. Building..."
        ./scripts/build_docker.sh $DOCKER_NAME
    fi
}

build_image_once

# Run the docker file
docker run \
    --mount type=bind,source="$(pwd)",target=/resume \
    -e CONTINOUS_BUILD="${1}" \
    $DOCKER_NAME