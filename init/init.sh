eval $(minikube docker-env)
docker build . -t build:5X_STABLE
