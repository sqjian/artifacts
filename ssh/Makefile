IMG:='registry.cn-hangzhou.aliyuncs.com/sqjian/venv:ubuntu20_04'
restart: down up
up:
	docker-compose up ssh.test
down:
	docker-compose down --remove-orphans
ps:
	docker-compose ps
venv:
	docker run \
		-it \
		--rm \
		--net=host \
		-v ${PWD}:/lab \
		-w /lab \
		${IMG} bash -c './expect.ssh.sh'
.DEFAULT_GOAL := venv
