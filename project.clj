(defproject work "0.0.1"
  :description ""
  :dependencies
    [[org.clojure/clojure "1.8.0"]
     [org.clojure/core.match "0.3.0-alpha4"]
     [org.clojure/core.incubator "0.1.4"]
     [mount "0.1.11"]
     [yesql "0.5.3"]
     [mysql/mysql-connector-java "5.1.32"]
     [http-kit "2.2.0"]
     [compojure "1.5.1"]
     [hiccup "1.0.5"]
     [reinvdwoerd/sandbox "0.0.1"]
     [clj-time "0.13.0"]
     [clojurewerkz/money "1.9.0"]
     [prismatic/schema "1.1.3"]
     [prone "1.1.4"]]
  :main init
  :target-path "target/%s"
  :plugins [[lein-figwheel "0.5.8"]]
  :profiles {:uberjar {:aot :all}
             :dev {:source-paths ["test"]
                   :dependencies [[midje "1.8.3"]
                                  [proto-repl "0.3.1"]]}}
  :clean-targets [:target-path "out"]
  :cljsbuild
  { :builds [{:id "dev"
              :source-paths ["cljs"]
              :figwheel true
              :compiler
                {:main "client"
                 :asset-path "cljs/out"
                 :output-to  "public/js/main.js"
                 :output-dir "public/js/out"}}]}
  :figwheel
  { :css-dirs ["public/css"]})
