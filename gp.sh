#!/usr/bin/env bash

if [ $# -eq 0 ] ; then
	echo "Usage: gp.push <branch>"
	echo "branch: master, 5X_STABLE, etc."
	exit 1
fi

command -v pwgen
if [ $? -eq 1 ] ; then
	echo "missing 'pwgen', please install it."
	exit 1
fi

# echo input and abort if any failure happened
set -ex

# has to provide a branch to build from
branch=$1

eval $(minikube docker-env)
# build binary
sed -i '1s/^.*$/FROM\ build:'"$branch"'/' build/Dockerfile
docker build build/ -t build:latest
# build deploy
new_tag=greenplum-for-kubernetes:hackday2018.$(pwgen 8 1)
docker build deploy/ -t ${new_tag}
# refresh image
kubectl set image pod/master gpdb=${new_tag}
kubectl set image pod/standby gpdb=${new_tag}
kubectl set image pod/segment-0a gpdb=${new_tag}
kubectl set image pod/segment-0b gpdb=${new_tag}
# wait for the kubectl to have all the pods restarted
watch kubectl get pods
