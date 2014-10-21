Goby
====

Develop iOS apps with ClojureScript.

Overview
========

This repository contains some lightweight ClojureScript and Objective-C glue code that facilitates creating iOS apps where the view controllers are written in ClojureScript instead of Objective‑C or Swift.

This approach was taken to build [an app](http://fikesfarm.com/cc/) currently in the App Store, and this repo is derived from the reusable bits from that project.

The overall design is to provide decorators for various UIKit elements that implement the JSExport protocol, so that, in the end, interop is established between the ClojureScript and the UI. The UI is essentially treated as a bunch mutable state that can be manipulated or listened to, with atoms in the ClojureScript code simply holding references to the decorators.

Usage
=====

Check out the companion example project [Shrimp](https://github.com/mfikes/shrimp) illustrating actual use of this code.

1. In your `[AppDelegate application:didFinishLaunchingWithOptions:]` set up an instance of `GBYManager`, wich loads the ClojureScript-compiled JavaScriipt, and adds a few callback handlers.
2. Create a view using Storyboards as usual, and wire the UI elements to fields. Create a "glue" ViewController instance for this view, that extends `GBYViewController` and calls into the ClojureScript when the view is loaded, passing in wrapped references to UIKit elements.
3. Create a ClojureScript namespace that mirrors the name of your view, and make use of the `defui` macro to set up atoms for each of your UI elements and to export a method that the Objective-C side can use to initialize these atoms.
4. Add code in your ClojureScript namespace to set up UI events handlers, peform application logic, update UI elements, etc.

Project Status
==============

Goby is under active development. I have used it to create one production app in the App Store and am using it to create additional apps, fleshing out aspects of the Goby code as needed. As such the code is subject to change.

If you'd like to use it, or would like to contribute, I'd be happy---that's the point of sharing it here!

License
=======

Distributed under the Eclipse Public License, which is also used by ClojureScript.
