(ns goby.macros)

(defmacro reify [protocol & impls]
  `(clojure.core/reify ~protocol
     (~(symbol (str protocol "-implements")) [~(symbol "_")] (cljs.core/clj->js ~(mapv (comp str first) impls)))
     ~@impls))

(defmacro defui [& ui-elements]
  (let [my-ns (str *ns*)]
    `(do
       (def ~'view-controller (atom nil))
       ~@(map #(list 'def % '(clojure.core/atom nil)) ui-elements)
       (defn ~'handle-view-did-load! [])
       (defn ~(with-meta 'view-did-load! {:export true}) [view-controller# ~@ui-elements]
         (reset! ~(symbol my-ns "view-controller") view-controller#)
         ~@(map #(list 'reset! (symbol my-ns (str %)) %) ui-elements)
         ~'(handle-view-did-load!)))))
