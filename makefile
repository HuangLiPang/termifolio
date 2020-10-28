ps:
	docker-compose -f docker-compose.yml ps -a $(c)
stop:
	docker-compose -f docker-compose.yml stop $(c)
build:
	docker-compose -f docker-compose.yml build $(c)
up:
	docker-compose -f docker-compose.yml up -d --force-recreate $(c)

refresh: stop build up