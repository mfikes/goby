(defproject goby "0.3.1"
  :description "Develop iOS apps in ClojureScript"
  :url "http://github.com/mfikes/goby"
  :license {:name "Eclipse"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
 
  :source-paths  ["src"]
 
  :dependencies [[org.clojure/clojure "1.6.0"]
                 [org.clojure/clojurescript "0.0-3058" :scope "provided"]
                 [org.clojure/core.async "0.1.346.0-17112a-alpha" :scope "provided"]]
 
  :plugins [[lein-cljsbuild "1.0.5"]])
