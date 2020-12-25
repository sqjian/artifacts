all: build
init:
	./init.sh
build:
	docker build \
			-t test \
			-f Dockerfile \
			.
venv:
	docker run \
			-it \
			--rm \
			-v ${PWD}:/lab \
			-w /lab/scripts \
			ubuntu:20.04 bash
