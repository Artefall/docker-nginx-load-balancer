# docker-nginx-load-balancer

docker-nginx-load-balancer - is alpine-based container for proxy. 

## Link to dockerhub: 

https://hub.docker.com/repository/docker/artefall/nginx-proxy

## Usage:

git clone https://github.com/Artefall/docker-nginx-load-balancer.git

cd docker-nginx-load-balancer

docker build -f Dockerfile --t nginx-proxy .

docker run -d -t -e PROXY_HOST_1=... --name my-nginx-proxy nginx-proxy:latest

Activate script:

docker exec -it [CONATAINER_NAME] sh script.sh

OR 

You can download container from dockerhub
