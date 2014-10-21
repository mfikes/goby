Goby
====

Develop iOS apps with ClojureScript.

Overview
========

This repository contains some ClojureScript and Objective-C glue code that facilitates creating iOS apps where the view controllers are written in ClojureScript instead of Objective‑C or Swift.

This approach was taken to build [an app](http://fikesfarm.com/cc/) currently in the App Store, and this repo is derived from the reusable bits from that project.

The overall design is to provide decorators for various UIKit elements that implement the JSExport protocol, so that, in the end, interop is established between the ClojureScript and the UI. The UI is essentially treated as a bunch mutable state that can be manipulated or listened to, with atoms in the ClojureScript code simply holding references to the decorators.

Usage
=====

Check out the companion example project [Shrimp](https://github.com/mfikes/shrimp) illustrating actual use of this code.

1. In your `[AppDelegate application:didFinishLaunchingWithOptions:]` set up an instance of `GBYManager`, wich loads the ClojureScript-compiled JavaScriipt, and adds a few callback handlers.
2. Create a view using Storyboards as usual, and wire the UI elements to fields. Create a "glue" ViewController instance for this view, that extends `GBYViewController` and calls into the ClojureScript when the view is loaded, passing in wrapped references to UIKit elements.
3. Create a ClojureScript namespace that mirrors the name of your view, and make use of the `defui` macro to set up atoms for each of your UI elements.
4. Add code in your ClojureScript namesspace to set up UI events handlers, peform application logic, update UI elements, etc.


License
=======

Distributed under the Eclipse Public License, which is also used by ClojureScript.
