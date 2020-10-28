ps:
	docker-compose -f docker-compose.yml ps -a
stop:
	docker-compose -f docker-compose.yml stop
build:
	docker-compose -f docker-compose.yml build
up:
	docker-compose -f docker-compose.yml up -d --force-recreate
refresh: stop build up