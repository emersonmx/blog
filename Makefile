run_cmd := docker compose run --rm
theme_dir := $(shell realpath themes/simple)

.PHONY: setup_theme
setup_theme: ${theme_dir}/node_modules

${theme_dir}/node_modules:
	cd ${theme_dir} ; npm install

.PHONY: build
build: setup_theme
	${run_cmd} hugo -e production --minify

.PHONY: server
server: setup_theme
	docker compose up

.PHONY: shell
shell: setup_theme
	${run_cmd} hugo shell

.PHONY: clean
clean:
	rm -rf ./public/
	rm -rf ./themes/simple/node_modules/
