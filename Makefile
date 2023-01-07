.PHONY: build
build:
	docker-compose run --rm hugo -e production --minify

.PHONY: run
run:
	docker-compose run --rm --publish 1313:1313 hugo server -D

.PHONY: shell
shell:
	docker-compose run --rm hugo shell
