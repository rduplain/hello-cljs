## Hello ClojureScript

This project demonstrates tooling for ClojureScript with workflows appropriate
to Unix tradition with a build oriented toward general-purpose programming
(with Node.js, and not the browser). **Build redistributable native binaries
with ClojureScript and npm libraries.**


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
* `make repl` -- Run a ClojureScript REPL. (Use an IDE instead, below.)
* `make outdated` -- Check for outdated packages.
* `make test` -- Run project tests.
* `make test-refresh` -- Run project tests and watch for changes.


### Integrated Development Environment

Run `M-x cider-jack-in` from Emacs with [CIDER][cider], using `shadow-cljs` as
the command. Once loaded, in the CIDER clj repl, start a CLJS repl with:

```clojure
(require '[shadow.cljs.devtools.api :as shadow])
(shadow/node-repl)
```

While `cider-connect` is available, the available tools are best run separately
as to allow repl interactions separately from the build process. Start this
CIDER repl before starting any other shadow-cljs process.

[cider]: https://docs.cider.mx/


### Using `npm` Packages

[shadow-cljs][shadow-cljs] loads any module found in the `node_modules`
directory. See [this guide][shadow-cljs npm] for example require forms.

[shadow-cljs]: http://shadow-cljs.org/
[shadow-cljs npm]: https://clojureverse.org/t/guide-on-how-to-use-import-npm-modules-packages-in-clojurescript/2298/1


### Wishlist

* `make clj-outdated` has a [unix exit code][depot exit].
* `clj -Stree` has [a --depth option][tools deps tree cli], similar to npm ls.

[depot exit]: https://github.com/Olical/depot/blob/v1.5.1/src/depot/outdated/main.clj#L52
[tools deps tree cli]: https://github.com/clojure/tools.deps.alpha/blob/tools.deps.alpha-0.5.460/src/main/clojure/clojure/tools/deps/alpha/script/print_tree.clj#L26
