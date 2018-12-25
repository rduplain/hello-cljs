## Hello ClojureScript

This project demonstrates tooling for ClojureScript with workflows appropriate
to Unix tradition with a build oriented toward general-purpose programming
(with Node.js, and not the browser).


### Dependencies

* [Clojure command line tools][clojure cli]. Tested with Clojure v1.9.0.
* [Node.js and npm][node.js]. Tested with Node.js v10.14.0 and npm v6.5.0.
* [GNU Make][make]. Available on most Unix systems. Tested with GNU Make v3.81.

[clojure cli]: https://clojure.org/guides/getting_started
[node.js]: https://nodejs.org/
[make]: https://www.gnu.org/software/make/


### Workflow

* `make bin` (default on `make`) -- Create redistributable binaries.
* `make build` -- Build ClojureScript project into a single .js file.
* `make install` -- Install packages; this is run automatically.
* `make repl` -- Run a ClojureScript REPL.
* `make outdated` -- Check for outdated packages.
* `make test` -- Run project tests.
* `make test-refresh` -- Run project tests and watch for changes.


### Integrated Development Environment

Run `M-x cider-jack-in-cljs` from Emacs with [CIDER][cider], and specify `node`
as the ClojureScript REPL type. While `cider-connect` is available, the
available tools are best run separately.

[cider]: https://docs.cider.mx/


### Using `npm` Packages

It is still an open question on how to use npm packages where the build, REPL,
and tests all have access to npm packages with a common configuration.

References:

* https://cljs.github.io/api/compiler-options/npm-deps
* https://figwheel.org/docs/npm.html
* https://gist.github.com/pbostrom/87500c8c3fa43b23cd3ccd764ef767d5


### Wishlist

* `make clj-outdated` has a [unix exit code][depot exit].
* `clj -Stree` has [a --depth option][tools deps tree cli], similar to npm ls.

[depot exit]: https://github.com/Olical/depot/blob/v1.5.1/src/depot/outdated/main.clj#L52
[tools deps tree cli]: https://github.com/clojure/tools.deps.alpha/blob/tools.deps.alpha-0.5.460/src/main/clojure/clojure/tools/deps/alpha/script/print_tree.clj#L26
