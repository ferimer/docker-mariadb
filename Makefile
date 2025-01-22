DOCKER_NAME=ferimer/mariadb
DOCKER_VERSION=11.6.2

build:
	docker build -t ${DOCKER_NAME}:${DOCKER_VERSION} . 


publish: build
	docker push ${DOCKER_NAME}:${DOCKER_VERSION} 

