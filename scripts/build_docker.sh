#!/bin/bash

DEFAULT="resume_builder"
DOCKER_NAME="${1:-$DEFAULT}"
docker build . -t $DOCKER_NAME