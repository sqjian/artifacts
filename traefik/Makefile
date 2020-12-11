up:
	vagrant up
ssh:
	vagrant ssh
reload:
	vagrant provision
clean:
	vagrant destroy

restart:
	docker-compose down
	docker-compose up -d
	docker-compose logs -f reverse-proxy
log:
	docker-compose logs -f reverse-proxy
.DEFAULT_GOAL := restart