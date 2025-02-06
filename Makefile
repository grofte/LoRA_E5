include .env

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

run:
	docker run --rm --volume=$(PWD):/app --gpus all -it $(DOCKER_IMAGE):$(DOCKER_TAG)
