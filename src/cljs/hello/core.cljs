(ns hello.core
  (:require [cljs.nodejs :as node]
            [clojure.string :refer [join]]
            ["string-kit" :refer [format]]))

(def default ["world"])

(defn -main
  [& args]
  (->> (or args default)
       (join " ")
       (format "Hello, ^b%s^:!")
       (println)))

(node/enable-util-print!)
(set! *main-cli-fn* -main)
