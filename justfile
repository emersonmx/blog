build: build-theme
    hugo -e production --minify

[working-directory: 'themes/simple/']
build-theme:
    npm install
    npm run build

server:
    hugo server --buildDrafts

clean:
	rm -rf ./public/
	rm -rf ./themes/simple/node_modules/
