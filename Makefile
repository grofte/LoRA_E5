include .env

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

run:
	docker run \
	--rm \
	--volume=$(PWD):/app \
	--user `id -u`:`id -g` \
	--gpus all \
	-it $(DOCKER_IMAGE):$(DOCKER_TAG)
# --rm: remove container after running
# --volume: mounts the current directory to /app in the container
# --gpus: enables access to all GPUs, use --gpus '"device=0,1"' to specify first and second GPU etc.
# -it: starts the container in interactive mode (wandb is interactive)

# --user: gives ownership of files created by the container to user:docker
	# --user `id -u`:`getent group docker | cut -d: -f3` \
# --user: gives ownership of files created by the container to user:user
	# --user `id -u`:`id -g` \

develop:
	docker run \
	--rm \
	--volume=$(PWD):/app \
	--gpus all \
	-it $(DOCKER_IMAGE):$(DOCKER_TAG) \
	python3 --version
