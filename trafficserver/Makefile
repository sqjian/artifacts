test: pull
	docker run \
		-it \
		--rm \
		--net=host \
		-v ${PWD}/example:/opt/ats/etc/trafficserver \
		-w /opt/ats \
		registry.cn-hangzhou.aliyuncs.com/sqjian/artifacts:trafficserver
pull:
	docker pull registry.cn-hangzhou.aliyuncs.com/sqjian/artifacts:trafficserver