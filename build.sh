#!/usr/bin/env bash

IMAGE_NAME="nullcappone/stressmonster-nvm-base"

init(){
    STATUS=$(docker-machine status)

    case $STATUS in
        Running)
            docker-machine restart
            ;;
        Stopping|Saved )
            docker-machine start
            ;;
        *)
            docker-machine create
    esac

    eval $(docker-machine env)
}

start(){
    docker run -it -v $(pwd):/srv/app $IMAGE_NAME
}

build(){
    docker build -t nullcappone/stressmonster-nvm-base .
}

push(){
    docker push nullcappone/stressmonster-nvm-base
}

$*