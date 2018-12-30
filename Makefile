### Recipes ###

all: test-release bin
bin: install | build pkg-renamed
build: install echo-building shadow-cljs-release-app
install: echo-clj clj-install echo-npm npm-install
repl: install shadow-cljs-repl-app
outdated: install clj-outdated npm-outdated
test: install echo-testing shadow-cljs-test
test-refresh: install shadow-cljs-watch-test-autorun
test-release: install | test bin test-bin


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
		-c package.json \
		-t node10-linux-x64,node10-mac-x64,node10-win-x64 \
		--out-path ./target/pkg \
		./target/hello.js

pkg-renamed: pkg
	@mkdir -p ./target/bin-linux ./target/bin-mac ./target/bin-windows
	@mv ./target/pkg/hello-linux ./target/bin-linux/hello
	@mv ./target/pkg/hello-macos ./target/bin-mac/hello
	@mv ./target/pkg/hello-win.exe ./target/bin-windows/hello.exe
	@rm -fr ./target/pkg/
	@echo "-- redistributable binaries --"
	@find ./target/bin-* -type f | sort

test-bin:
	@echo "-- testing redistributable binary --"
	@NAME=hello bash ./test/bash/test_bin


### Utility ###

%-command:
	@which $* >/dev/null || ( echo "Requires '$*' command."; false )

echo-%:
	@echo "$* ..."
