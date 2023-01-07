user := $(shell id -u):$(shell id -g)
cmd := docker-compose run --rm --user "${user}"

.PHONY: build
build:
	${cmd} hugo -e production --minify

.PHONY: server
server:
	${cmd} -p 1313:1313 hugo server --buildDrafts

.PHONY: shell
shell:
	${cmd} hugo shell

.PHONY: clean
clean:
	rm -rf ./themes/simple/node_modules/
