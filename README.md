## Hello ClojureScript

[![Build Status][build]](https://travis-ci.org/rduplain/hello-cljs)


### Overview

This project demonstrates tooling for ClojureScript with workflows appropriate
to Unix tradition with a build oriented toward general-purpose programming
(with Node.js, and not the browser). **Build redistributable native binaries
with ClojureScript and npm libraries.**

While Java is a dependency of Clojure, this project focuses exclusively on
building ClojureScript for Node.js. The same workflow applies to other
JavaScript targets, namely the browser, if the Clojure deps and npm packages
support the runtime. The redistributable binary only applies with a Node.js
target, but this workflow can produce a .js file suitable for other JavaScript
targets.

Of particular note, both Clojure and JavaScript have many options available to
build a project. This demonstration project arrives at many decisions aligned
with Unix expectations:

* Use [Clojure command line tools][clojure cli] directly, with deps.edn.
* Use [Node.js and npm][node.js] directly, with package.json.
* Use [shadow-cljs][shadow-cljs] to build .js from deps.edn and `node_modules`.
* Use [pkg][pkg] to build binaries from `node_modules` and the built .js file.
* Use a Makefile ([GNU Make][make]) to provide a simple developer workflow.

[clojure cli]: https://clojure.org/guides/getting_started
[node.js]: https://nodejs.org/
[shadow-cljs]: http://shadow-cljs.org/
[pkg]: https://github.com/zeit/pkg
[make]: https://www.gnu.org/software/make/


### Dependencies

Development:

* [Clojure command line tools][clojure cli]. Tested with Clojure v1.9.0.
* [Node.js and npm][node.js]. Tested with Node.js v10.14.0 and npm v6.5.0.
* [GNU Make][make]. Available on most Unix systems. Tested with GNU Make v3.81.
* A Unix system such as GNU/Linux or Mac OS X.

**Production has no dependencies. The redistributable binaries run natively on
GNU/Linux, Mac OS X, and Windows, respectively.**


### Workflow

Development:

* `make` -- Test, build binaries, and test platform binary (`make release`).
* `make bin` -- Create redistributable binaries.
* `make build` -- Build the ClojureScript project into a single .js file.
* `make install` -- Install packages; this is run automatically.
* `make outdated` -- Check for outdated packages.
* `make release` -- Test, build binaries, and test platform binary.
* `make repl` -- Run a ClojureScript REPL. (Use an IDE instead, below.)
* `make test-refresh` -- Run project tests and watch for changes.
* `make test` -- Run project tests.

Production:

* After running `make`, find redistributable binaries in `./target/bin-*/`.
* The redistributable binaries run natively without dependencies on GNU/Linux,
  Mac OS X, and Windows, respectively.
* The binaries include their own Node.js runtime and therefore are relatively
  large (tens of megabytes) compared to other system executables.
* If needed, these binaries compress by a factor of 3 with `bzip2`. A release
  step could publish compressed binaries with an install step which
  decompresses and puts the binary on the PATH.


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

[shadow-cljs npm]: https://clojureverse.org/t/guide-on-how-to-use-import-npm-modules-packages-in-clojurescript/2298/1


### Wishlist

* `make clj-outdated` has a [unix exit code][depot exit].
* `clj -Stree` has [a --depth option][tools deps tree cli], similar to npm ls.

[depot exit]: https://github.com/Olical/depot/blob/v1.5.1/src/depot/outdated/main.clj#L52
[tools deps tree cli]: https://github.com/clojure/tools.deps.alpha/blob/tools.deps.alpha-0.5.460/src/main/clojure/clojure/tools/deps/alpha/script/print_tree.clj#L26


---

[build]: https://travis-ci.org/rduplain/hello-cljs.svg?branch=master

Copyright (c) 2018-2019, Ron DuPlain. EPL-1.0 licensed.
Use freely under any license, including proprietary work.
