(ns hello.unit.core
  (:require
   [cljs.test :refer-macros [is deftest]]
   [hello.core]))

(deftest foo
  (is (= (hello.core/whom) "world")))
