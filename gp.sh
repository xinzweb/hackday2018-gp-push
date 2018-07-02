#!/usr/bin/env bash

set -ex

eval $(minikube docker-env)
# build binary
docker build build/ -t build:latest
# get regress.so
rm -fr deploy/gpdb/
docker run --name build build:latest
docker cp build:/opt/gpdb/ deploy/
docker rm build
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
# reset dns on master
kubectl exec -it master ssh -- -oStrictHostKeyChecking=no master tools/reset_container_dns.bash
