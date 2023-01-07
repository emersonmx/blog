cmd := docker-compose run --rm
theme_dir := $(shell realpath themes/simple)

.PHONY: setup_theme
setup_theme: ${theme_dir}/node_modules

${theme_dir}/node_modules:
	cd ${theme_dir} ; npm install

.PHONY: build
build: setup_theme
	${cmd} hugo -e production --minify

.PHONY: server
server: setup_theme
	${cmd} -p 1313:1313 hugo server --buildDrafts

.PHONY: shell
shell: setup_theme
	${cmd} hugo shell

.PHONY: clean
clean:
	rm -rf ./public/
	rm -rf ./themes/simple/node_modules/
