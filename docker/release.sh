#!/bin/bash
# Usage:
# // To build and publish the Docker image to the staging container registry.
# $ DESTINATION=staging STAGING_CONTAINER_REGISTRY=<staging_registry> DOCKER_IMAGE_VERSION_SUFFIX=-pre-1 ./release.sh
# // To publish the Docker image to the prod container registry.
# $ DESTINATION=prod STAGING_CONTAINER_REGISTRY=<staging_registry> ./release.sh
set -ex

if [[ -z "${STAGING_CONTAINER_REGISTRY}" ]]; then
  echo "Please provide a STAGING_CONTAINER_REGISTRY environment variable.";
  exit 1;
fi

DOCKER_IMAGE_NAME="stackdriver-logging-agent"
PROD_CONTAINER_REGISTRY="gcr.io/stackdriver-agents"

# The destination to push Docker image to. Options: staging, prod.
DESTINATION="${DESTINATION:-staging}"
# The suffix to add to the Docker image version. This is normally used to push
# pre-release versions. This suffix should start with "-". e.g.: "-pre-1"
DOCKER_IMAGE_VERSION_SUFFIX="${DOCKER_IMAGE_VERSION_SUFFIX:-}"

# Source $DOCKERFILE_VERSION and $GOOGLE_FLUENTD_VERSION from docker/VERSION.
source VERSION

DOCKER_IMAGE_VERSION="${DOCKERFILE_VERSION}-${GOOGLE_FLUENTD_VERSION}${DOCKER_IMAGE_VERSION_SUFFIX}";
# Add the git branch name to the Docker image version to avoid conflicts.
GIT_BRANCH=`git status | grep "On branch" | sed 's/On branch //g'`
if [ "${GIT_BRANCH}" != "master" ]; then
  DOCKER_IMAGE_VERSION="${DOCKER_IMAGE_VERSION}-${GIT_BRANCH}";
fi

case "${DESTINATION}" in
  staging)
    echo "Building ${DOCKER_IMAGE_VERSION}.";
    docker build --no-cache -t "${STAGING_CONTAINER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}" .;
    echo "Releasing ${DOCKER_IMAGE_VERSION} to the staging container registry.";
    docker push "${STAGING_CONTAINER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}";
    ;;
  prod)
    echo "Releasing ${DOCKER_IMAGE_VERSION} to the prod container registry.";
    docker pull "${STAGING_CONTAINER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}";
    docker tag "${STAGING_CONTAINER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}" "${PROD_CONTAINER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}";
    docker push "${PROD_CONTAINER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}";
    ;;
  *)
    echo "Unknown DESTINATION environment variable ${DESTINATION}.";
    exit 1;
    ;;
esac
