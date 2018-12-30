### Recipes ###

all: bin
bin: install pkg
build: install echo-building clj-build
install: echo-clj clj-install echo-npm npm-install
repl: install clj-repl
outdated: install clj-outdated npm-outdated
test: install clj-test
test-refresh: install clj-test-refresh


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

pkg: build
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
