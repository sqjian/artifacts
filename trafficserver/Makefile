IMG:='sqjian/artifacts:trafficserver'
#IMG:='registry.cn-hangzhou.aliyuncs.com/sqjian/artifacts:trafficserver'

all:
	docker run \
		-it \
		--rm \
		--net=host \
		-v ${PWD}/config:/opt/ats/etc/trafficserver \
		-v ${PWD}/data/trafficserver:/opt/ats/var/trafficserver \
		-w /opt/ats \
		${IMG}
pull:
	docker pull ${IMG}