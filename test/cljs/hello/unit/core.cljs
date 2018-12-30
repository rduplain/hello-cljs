(ns hello.unit.core
  (:require
   [cljs.test :refer-macros [is deftest]]
   [hello.core :as core]))

(deftest test-default-value
  (is (= core/default ["world"])))

(deftest test-default
  (is (= (with-out-str (core/-main))
         "Hello, [34mworld[0m![0m\n")))

(deftest test-with-args
  (is (= (with-out-str (core/-main "one" "two" "three"))
         "Hello, [34mone two three[0m![0m\n")))
