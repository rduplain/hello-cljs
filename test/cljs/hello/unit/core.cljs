(ns hello.unit.core
  (:require [cljs.test :refer-macros [is deftest testing]]
            [hello.core :as core]))

(deftest default
  (testing "value"
    (is (= core/default ["world"]))))

(deftest -main
  (testing "without arguments"
    (is (= (with-out-str (core/-main))
           "Hello, [34mworld[0m![0m\n")))

  (testing "with arguments"
    (is (= (with-out-str (core/-main "one" "two" "three"))
           "Hello, [34mone two three[0m![0m\n"))))
