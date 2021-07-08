#!/bin/bash

DOCKER_IMAGE_NAME=dev_bs_test_image
DOCKER_CONT_NAME=bs_test_build
USER_ID=$(id -u ${USER})
GROUP_ID=$(id -g ${USER})


#docker network create -d macvlan \
#  --ipam-driver=dhcp \
#  -o parent=enp2s0 \
#  --ipam-opt dhcp_interface=enp2s0 mcv0
  
xhost +local:docker
docker run \
    -it \
    --privileged \
    --cap-add SYS_ADMIN \
    --name ${DOCKER_CONT_NAME} \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev:/dev \
    -v /opt:/opt \
    -w ${PWD} \
    -u ${USER_ID}:${GROUP_ID} \
    --rm -i \
    -t ${DOCKER_IMAGE_NAME} \
    /bin/bash

#    --net mcv0 \
#    --experimental=true \

    
#docker network rm mcv0    

#    --env="DISPLAY" \

#    --volume="$HOME/.Xauthority" \
#                    -v ${PWD}:/build \

#DOCKER = docker run --name $(DOCKER_CONT_NAME) \
#                    -v $(PWD):/build \
#                    -w /build \
#                    -u $(USER_ID):$(GROUP_ID) \
#                    --rm -i \
#                    -t $(DOCKER_IMAGE_NAME)
