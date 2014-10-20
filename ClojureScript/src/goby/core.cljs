(ns goby.core
  (:require [clojure.set :as set]
            [clojure.data :as data])
  (:require-macros [goby.macros :refer [reify]]))

(def env (atom {}))

(def table-view-scroll-positions {:table-view-scroll-position-none   0
                                  :table-view-scroll-position-top    1
                                  :table-view-scroll-position-middle 2
                                  :table-view-scroll-position-bottom 3})

(def table-view-scroll-positions' (set/map-invert table-view-scroll-positions))

(def table-view-row-animations {:table-view-row-animation-fade      0
                                :table-view-row-animation-right     1
                                :table-view-row-animation-left      2
                                :table-view-row-animation-top       3
                                :table-view-row-animation-bottom    4
                                :table-view-row-animation-none      5
                                :table-view-row-animation-middle    6
                                :table-view-row-animation-automatic 100})

(def table-view-row-animations' (set/map-invert table-view-row-animations))

(def table-view-cell-accessory-types {:table-view-cell-accessory-none                     0
                                      :table-view-cell-accessory-disclosure-indicator     1
                                      :table-view-cell-accessory-detail-disclosure-button 2
                                      :table-view-cell-accessory-checkmark                3
                                      :table-view-cell-accessory-detail-button            4})

(def table-view-cell-accessory-types' (set/map-invert table-view-cell-accessory-types))

(def table-view-cell-editing-styles {:table-view-cell-editing-style-none   0
                                     :table-view-cell-editing-style-delete 1
                                     :table-view-cell-editing-style-insert 2})

(def table-view-cell-editing-styles' (set/map-invert table-view-cell-editing-styles))

(def device-orientations {:device-orientation-unknown              0
                          :device-orientation-portrait             1
                          :device-orientation-portrait-upside-down 2
                          :device-orientation-landscape-left       3
                          :device-orientation-landscape-right      4
                          :device-orientation-face-up              5
                          :device-orientation-face-down            6})

(def device-orientations' (set/map-invert device-orientations))

(def interface-orientations {:interface-orientation-portrait             (:device-orientation-portrait device-orientations)
                             :interface-orientation-portrait-upside-down (:device-orientation-portrait-upside-down device-orientations)
                             :interface-orientation-landscape-left       (:device-orientation-landscape-left device-orientations)
                             :interface-orientation-landscape-right      (:device-orientation-landscape-right device-orientations)})

(def interface-orientations' (set/map-invert interface-orientations))

(def ^:private ui-control-events {:touch-down              (bit-shift-left 1 0)
                                  :touch-down-repeat       (bit-shift-left 1 1)
                                  :touch-drag-inside       (bit-shift-left 1 2)
                                  :touch-drag-outside      (bit-shift-left 1 3)
                                  :touch-drag-enter        (bit-shift-left 1 4)
                                  :touch-drag-exit         (bit-shift-left 1 5)
                                  :touch-up-inside         (bit-shift-left 1 6)
                                  :touch-up-outside        (bit-shift-left 1 7)
                                  :touch-cancel            (bit-shift-left 1 8)
                                  :value-changed           (bit-shift-left 1 12)
                                  :editing-did-begin       (bit-shift-left 1 16)
                                  :editing-changed         (bit-shift-left 1 17)
                                  :editing-did-end         (bit-shift-left 1 18)
                                  :editing-did-end-on-exit (bit-shift-left 1 19)})

(def ^:private inverted-ui-control-events (set/map-invert ui-control-events))

(def ^:private attributes {:not-applicable 0
                           :enabled        1
                           :text           2
                           :selected       3
                           :highlighted    4
                           :hidden         5})

(def ^:private inverted-attributes (set/map-invert attributes))

(defn- form-events-mask
  [ui-control-events-set]
  (reduce bit-or 0 (map ui-control-events ui-control-events-set)))

(def fetched-results-change-type {:fetched-results-change-insert 1
                                  :fetched-results-change-delete 2
                                  :fetched-results-change-move   3
                                  :fetched-results-change-update 4})

(def fetched-results-change-type' (set/map-invert fetched-results-change-type))

(defprotocol TableViewDelegate

  ;; All methods in this protocol are optional

  ;; Return list of implemented optional methods
  (^:export TableViewDelegate-implements [this])

  ;; Inherited from UIScrollViewDelegate

  (^:export TableViewDelegate-did-scroll [this])
  (^:export TableViewDelegate-did-zoom [this])
  (^:export TableViewDelegate-will-begin-dragging [this])
  (^:export TableViewDelegate-will-end-dragging-with-velocity-target-content-offset
    [this velocity-x velocity-y target-content-offset-x target-content-offset-y])
  (^:export TableViewDelegate-did-end-dragging-will-decelerate [this decelerate])
  (^:export TableViewDelegate-will-begin-decelerating [this])
  (^:export TableViewDelegate-did-end-decelerating [this])
  (^:export TableViewDelegate-did-end-scrolling-animation [this])
  (^:export TableViewDelegate-view-for-zooming-in-scroll-view [this])
  (^:export TableViewDelegate-will-begin-zooming-with-view [this view])
  (^:export TableViewDelegate-did-end-zooming-with-view-at-scale [this view scale])
  (^:export TableViewDelegate-should-scroll-to-top? [this])
  (^:export TableViewDelegate-did-scroll-to-top [this])

  ;; Defined in UITableViewDelegate

  (^:export will-display-cell-for-row-at-index-path [this cell section row])
  (^:export will-display-header-view-for-section: [this view section])
  (^:export will-display-footer-view-for-section [this view section])
  (^:export did-end-displaying-cell-for-row-at-index-path [this cell section row])
  (^:export did-end-displaying-header-view-for-section [this view section])
  (^:export did-end-displaying-footer-view-for-section [this view section])
  (^:export height-for-row-at-index-path [this indexPath])
  (^:export height-for-header-in-section [this section])
  (^:export height-for-footer-in-section [this section])
  (^:export estimated-height-for-row-at-index-path [this section row])
  (^:export estimated-height-for-header-in-section [this section])
  (^:export estimated-height-for-footer-in-section [this section])
  (^:export view-for-header-in-section [this section])
  (^:export view-for-footer-in-section [this section])
  (^:export accessory-type-for-row-with-index-path [this section row])
  (^:export accessory-button-tapped-for-row-with-index-path [this section row])
  (^:export should-highlight-row-at-index-path [this section row])
  (^:export did-highlight-row-at-index-path [this section row])
  (^:export did-unhighlight-row-at-index-path [this section row])
  (^:export will-select-row-at-index-path [this section row])
  (^:export will-deselect-row-at-index-path [this section row])
  (^:export did-select-row-at-index-path [this section row])
  (^:export did-deselect-row-at-index-path [this section row])
  (^:export editing-style-for-row-at-index-path [this section row])
  (^:export title-for-delete-confirmation-button-for-row-at-index-path [this section row])
  (^:export should-indent-while-editing-row-at-index-path? [this section row])
  (^:export will-begin-editing-row-at-index-path [this section row])
  (^:export did-end-editing-row-at-index-path [this section row])
  (^:export target-index-path-for-move-from-row-at-index-path-to-proposed-index-path
    [this source-section source-row proposed-destination-section proposed-destination-row])
  (^:export indentation-level-for-row-at-index-path [this section row])
  (^:export should-show-menu-for-row-at-index-path? [this section row])
  (^:export can-perform-action-for-row-at-index-path-with-sender? [this sel section row sender])
  (^:export perform-action-for-row-at-index-path-with-sender [this sel section row sender]))

(defprotocol TableViewDataSource

  (^:export TableViewDataSource-implements [this])

  ;; Required methods
  (^:export number-of-rows-in-section [this section])
  (^:export init-cell-for-row-at-index-path [this cell section row])

  ;; Optional methods
  (^:export number-of-sections [this])
  (^:export title-for-header-in-section [this section])
  (^:export title-for-footer-in-section [this section])
  (^:export can-edit-row-at-index-path? [this section row])
  (^:export can-move-row-at-index-path? [this section row])
  (^:export section-index-titles [this])
  (^:export section-for-section-index-title-at-index [this title index])
  (^:export commit-editing-style-for-row-at-index-path [this editing-style section row])
  (^:export move-row-at-index-path [this source-section source-row destination-section destination-row]))

(defprotocol FetchedResultsControllerDelegate

  (^:export FetchedResultsControllerDelegate-implements [this])

  ;; Optional methods
  (^:export did-change-object-at-index-path-for-change-type-new-index-path
    [this object section row change-type new-section new-row])
  (^:export did-change-section-at-index-for-change-type [this section-info section-index change-type])
  (^:export will-change-content [this])
  (^:export did-change-content [this])
  (^:export section-index-title-for-section-name [this section-name]))

(defn user-interface-idiom-ipad? []
  (= "iPad" (:user-interface-idiom @env)))

(defn reify-fetched-results-controller-delegate [table-view]
  (reify FetchedResultsControllerDelegate

    (did-change-object-at-index-path-for-change-type-new-index-path
      [_ _ section row change-type new-section new-row]
      (case (fetched-results-change-type' change-type)
        :fetched-results-change-insert (.insertRowInSectionWithRowAnimation @table-view new-row new-section (:table-view-row-animation-fade table-view-row-animations))
        :fetched-results-change-delete (.deleteRowInSectionWithRowAnimation @table-view row section (:table-view-row-animation-fade table-view-row-animations))
        :fetched-results-change-update (.reloadData @table-view)
        :fetched-results-change-move (do
                                       (.deleteRowInSectionWithRowAnimation @table-view row section (:table-view-row-animation-fade table-view-row-animations))
                                       (.insertRowInSectionWithRowAnimation @table-view new-row new-section (:table-view-row-animation-fade table-view-row-animations)))))

    (did-change-section-at-index-for-change-type [_ _ section-index change-type]
      (case (fetched-results-change-type' change-type)
        :fetched-results-change-insert (.insertSectionWithRowAnimation @table-view section-index (:table-view-row-animation-fade table-view-row-animations))
        :fetched-results-change-delete (.deleteSectionWithRowAnimation @table-view section-index (:table-view-row-animation-fade table-view-row-animations))))

    (will-change-content [_]
      (.beginUpdates @table-view))

    (did-change-content [_]
      (.endUpdates @table-view))))
