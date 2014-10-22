(ns goby.macros)

(defmacro reify
  "Implements a protocol, delegating to clojure.core/reify while also adding an
  additional method named <protocol>-implements which indicates the protocol
  methods implemented. This is used to partially implement a protocol which mimics
  an Objective-C protocol where some of the methods are optional. The additional
  method <protocol>-implements is used at runtime to determine which methods
  are actually implemented."
  [protocol & impls]
  `(clojure.core/reify ~protocol
     (~(symbol (str protocol "-implements")) [~(symbol "_")] (cljs.core/clj->js ~(mapv (comp str first) impls)))
     ~@impls))

(defmacro defui [& ui-elements]
  "Given a list of ui-elements, defines an atom per ui-element, along with an implicit
  view-controller atom. Additionally exports a view-did-load! method which initializes
  the atoms with the supplied arguments. Then calls a handle-view-did-load! method to
  allow the namespace to perform further initialization when the view loads."
  (let [my-ns (str *ns*)]
    `(do
       (def ~'view-controller (atom nil))
       ~@(map #(list 'def % '(clojure.core/atom nil)) ui-elements)
       (defn ~'handle-view-did-load! [])
       (defn ~(with-meta 'view-did-load! {:export true}) [view-controller# ~@ui-elements]
         (reset! ~(symbol my-ns "view-controller") view-controller#)
         ~@(map #(list 'reset! (symbol my-ns (str %)) %) ui-elements)
         ~'(handle-view-did-load!)))))
