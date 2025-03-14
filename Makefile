.PHONY:

redash-create-db:
	docker compose -f docker-compose-postgres.yml -f docker-compose-redis.yml -f docker-compose-redash.yml run redash-server create_db

redash-exec:
	docker compose -f docker-compose-postgres.yml -f docker-compose-redis.yml -f docker-compose-redash.yml exec -it redash-server /bin/bash