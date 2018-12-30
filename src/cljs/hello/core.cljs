(ns hello.core
  (:require [cljs.nodejs :as node]
            ["terminal-kit" :rename {terminal term}]))

(defn whom
  []
  "world")

(defn -main
  []
  (->> (whom)
       (term "Hello, ^b%s^:!\n")))

(node/enable-util-print!)
(set! *main-cli-fn* -main)
