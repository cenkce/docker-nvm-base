#!/usr/bin/env bash

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

    log "docker machine env"
    eval $(docker-machine env)
    check
}

build(){
    docker build -t nullcappone/stressmonster-nvm-base .
}

push(){
    docker push nullcappone/stressmonster-nvm-base
}

$*