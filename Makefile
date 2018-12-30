### Recipes ###

all: bin
bin: install | build pkg
build: install echo-building shadow-cljs-release-app
install: echo-clj clj-install echo-npm npm-install
repl: install shadow-cljs-repl-app
outdated: install clj-outdated npm-outdated
test: install shadow-cljs-test
test-refresh: install shadow-cljs-watch-test-autorun


### Clojure ###

clj-%: clj-command
	@clj -A$*

clj-install: clj-command .clj-install
	@true # Override wildcard recipe.

clj-repl: node-command

clj-test-refresh: clj-command
	@clj -Atest --watch src

.clj-install: deps.edn
	@clj -Stree
	@touch $@


### Node.js ###

npm-%: npm-command
	@npm $*

npm-install: npm-command .npm-install
	@true # Override wildcard recipe.

.npm-install: package.json
	@npm install
	@npm ls --depth=0
	@touch $@

shadow-cljs-%-app:
	@./node_modules/.bin/shadow-cljs --force-spawn $* app

shadow-cljs-repl-app:
	@echo "Run this in a separate terminal:"
	@echo
	@echo "    node ./target/hello.js"
	@echo
	@./node_modules/.bin/shadow-cljs --force-spawn cljs-repl app

shadow-cljs-test: shadow-cljs-compile-test
	@node ./target/test.js

shadow-cljs-%-test:
	@./node_modules/.bin/shadow-cljs --force-spawn $* test -A:test

shadow-cljs-%-test-autorun:
	@./node_modules/.bin/shadow-cljs --force-spawn $* test-autorun -A:test

pkg:
	@echo "building binaries ..."
	@./node_modules/.bin/pkg \
		-t node10-linux-x64,node10-mac-x64,node10-win-x64 \
		--out-path ./target/pkg \
		./target/hello.js
	@echo "-- ./target/pkg/ --"
	@ls -1 ./target/pkg


### Utility ###

%-command:
	@which $* >/dev/null || ( echo "Requires '$*' command."; false )

echo-%:
	@echo "$* ..."
