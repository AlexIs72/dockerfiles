#!/bin/sh

#
#   git@192.168.30.20:software/dockerfiles.git
#

USER_ID=$(id -u ${USER})
GROUP_ID=$(id -g ${USER})
DOCKER="docker build --build-arg user_id=${USER_ID} --build-arg group_id=${GROUP_ID}"

docker pull docker/dockerfile:1.0-experimental
DOCKER_BUILDKIT=1 ${DOCKER} -t dev_bs_test_image -f Dockerfile .
#-w ${PWD} .
