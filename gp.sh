#!/usr/bin/env bash

eval $(minikube docker-env)
# build binary
docker build build/ -t build:latest
# get regress.so
docker run build:latest
docker cp $(docker ps -qa | head -n1):/usr/local/gpdb/lib/postgresql/regress.so ../deploy/
docker rm $(docker ps -qa | head -n1)
# build deploy
new_tag=greenplum-for-kubernetes:hackday2018.$(pwgen 8 1)
docker build deploy/ -t ${new_tag}
# stop gpdb
kubectl exec -it master ssh master -- gpstop -a
# refresh image
kubectl set image pod/master gpdb=${new_tag}
kubectl set image pod/standby gpdb=${new_tag}
kubectl set image pod/segment-0a gpdb=${new_tag}
kubectl set image pod/segment-0b gpdb=${new_tag}
# wait for the kubectl to have all the pods restarted
watch kubectl get pods
# reset dns on master
kubectl exec -it master ssh -- -oStrictHostKeyChecking=no master tools/reset_container_dns.bash
# start gpdb
kubectl exec -it master ssh -- master gpstart -a
