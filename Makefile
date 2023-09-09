.PHONY: docker_build
docker_build:
	docker build . -t file-server

.PHONY: docker_push
docker_push:
	docker login -u felixhau -p $$(cat private/dockerhub_token.txt)
	docker push file-server:latest

.PHONY: docker_build_push
 	docker_build_push: docker_build docker_push
