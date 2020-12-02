IMG:='registry.cn-hangzhou.aliyuncs.com/sqjian/artifacts:redis'
NAME:='redis'

all: run
init:
	./init.sh
build:
	docker build \
			-t test \
			-f Dockerfile \
			.
pull:
	docker pull ${IMG}
compose:
	cp scripts/config.json .
	docker-compose down
	docker-compose up
run:
	cp scripts/config.json .
	docker run \
			-it \
			--name=${NAME} \
			--rm \
			--net=host \
			-v ${PWD}/config.json:/etc/redis/config.json \
			-v ${PWD}/data:/data \
			registry.cn-hangzhou.aliyuncs.com/sqjian/artifacts:redis
venv: clean
	docker run \
			-it \
			--rm \
			-v ${PWD}/scripts:/lab \
			-w /lab \
			--name ${NAME} \
			${IMG} bash
ssh:
	docker exec \
			-it \
			${NAME} bash
clean:
	-docker rm -f ${NAME}