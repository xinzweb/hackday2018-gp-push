eval $(minikube docker-env)
docker build . -t build:master
