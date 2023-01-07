.PHONY: build
build:
	docker-compose run --rm --user "$UID:$GID" hugo -e production --minify

.PHONY: run
run:
	docker-compose run --rm --user "$UID:$GID" --publish 1313:1313 hugo server -D

.PHONY: shell
shell:
	docker-compose run --rm --user "$UID:$GID" hugo shell
