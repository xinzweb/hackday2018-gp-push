#!/usr/bin/env bash

if [ $# -eq 0 ] ; then
	echo "usage: init <branch> [repo]"
	echo "branch: master, 5X_STABLE, etc."
	echo "repo: optional, default https://github.com/greenplum-db/gpdb.git"
	exit 1
fi

input_branch=$1
input_repo="https://github.com/greenplum-db/gpdb.git"

if [ ! -z ${2+x} ] ; then
	input_repo=$2
fi

eval $(minikube docker-env)
docker build --build-arg branch=${input_branch} --build-arg repo=${input_repo} init/ -t build:${input_branch}
