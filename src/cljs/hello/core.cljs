(ns hello.core
  (:require [cljs.nodejs :as node]
            [goog.string :refer [format]]
            [goog.string.format]))

(defn whom
  []
  "world")

(defn -main
  []
  (->> (whom)
       (format "Hello, %s!")
       (println)))

(node/enable-util-print!)
(set! *main-cli-fn* -main)
