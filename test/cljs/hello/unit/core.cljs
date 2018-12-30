(ns hello.unit.core
  (:require
   [cljs.test :refer-macros [is deftest]]
   [hello.core]))

(deftest test-whom
  (is (= (hello.core/whom) "world")))
