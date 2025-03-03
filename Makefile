DOCKER_NAME=ferimer/mariadb
DOCKER_VERSION=11.7.2
DOCKER_VERSIONLTS=11.4.5

build:
	docker build -t ${DOCKER_NAME}:${DOCKER_VERSION} . 

publish: build
	docker push ${DOCKER_NAME}:${DOCKER_VERSION} 

buildLTS:
	docker build -f Dockerfile.LTS -t ${DOCKER_NAME}:${DOCKER_VERSIONLTS}_LTS .

publishLTS: buildLTS
	docker push ${DOCKER_NAME}:${DOCKER_VERSIONLTS}_LTS
