#!/bin/sh

USER_ID=$(id -u ${USER})
GROUP_ID=$(id -g ${USER})
DOCKER="docker buildx build --platform linux/x86 --build-arg user_id=${USER_ID} --build-arg group_id=${GROUP_ID}"

docker pull docker/dockerfile:1.0-experimental
#docker buildx build --help

DOCKER_BUILDKIT=1 ${DOCKER} -t base_debian_image_x86:latest -f Dockerfile.1_base_debian_image_x86 --secret id=ssh_id,src=$(echo ~/.ssh/id_rsa) .
DOCKER_BUILDKIT=1 ${DOCKER} -t base_dev_image_x86:latest -f Dockerfile.2_base_dev_image_x86 .
#DOCKER_BUILDKIT=1 ${DOCKER} -t base_dev_qt5_image:latest -f Dockerfile.3_base_dev_qt5_image .

#DOCKER_BUILDKIT=1 docker build -t base_debian_image:latest \
#                --build-arg user_id=${USER_ID} \
#                --build-arg group_id=${GROUP_ID} \
#                --secret id=ssh_id,src=$(echo ~/.ssh/id_rsa) \
#                -f Dockerfile.1_base_debian_image .

#DOCKER_BUILDKIT=1 docker build -t base_dev_image:latest \
#                --build-arg user_id=${USER_ID}\
#                --build-arg group_id=${GROUP_ID}\
#                -f Dockerfile.2_base_dev_image .

#DOCKER_BUILDKIT=1 docker build -t base_dev_image:latest \
#                --build-arg user_id=${USER_ID}\
#                --build-arg group_id=${GROUP_ID}\
#                -f Dockerfile.2_base_dev_image .


#                --secret id=ssh_id,src=$(echo ~/.ssh/id_rsa) \
