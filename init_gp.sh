#!/usr/bin/env bash

if [ $# -eq 0 ] ; then
	echo "usage: init <branch>"
	echo "branch: master, 5X_STABLE, etc."
	exit 1
fi

branch=$1

eval $(minikube docker-env)
docker build --build-arg branch=$branch init/ -t build:$branch
