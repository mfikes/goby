Goby
====

Develop iOS apps with ClojureScript.

Overview
========

This repository contains some lightweight ClojureScript and Objective-C glue code that facilitates creating iOS apps where the view controllers are written in ClojureScript instead of Objective‑C or Swift.

The overall design is to provide decorators for various UIKit elements that implement the `JSExport` protocol, so that, in the end, interop is established between the ClojureScript code and the UI. The UI is essentially treated as a bunch mutable state that can be manipulated or listened to, with atoms in the ClojureScript code simply holding references to the decorators.

When dealing with Objective-C protocol implementations, such as `TableViewDataSource`, Goby provides an equivalent ClojureScript protocol, and some glue code and a `reify` macro, essentially making it possible to implement an Objective-C protocol in ClojureScript, even dealing with the case where some of the Objective-C methods are optional.

This approach was taken to build [an app](http://fikesfarm.com/cc/) currently in the App Store, and this repo is derived from the reusable bits from that project.

Usage
=====

Check out the companion example project [Shrimp](https://github.com/mfikes/shrimp) illustrating actual use of this code.

1. Set up sibling iOS and ClojureScript projects and make the Goby iOS and ClojureScript code available to each. (The [Shrimp](https://github.com/mfikes/shrimp) project provides a working example of this where Goby is simply used as a Git submodule, with a few symbolic links established in the needed places.) The ClojureScript compiles down to JavaScript which is included as a reference in the iOS project bundle.
2. In your `[AppDelegate application:didFinishLaunchingWithOptions:]` set up an instance of `GBYManager`, wich loads the ClojureScript-compiled JavaScript, and adds a few callback handlers.
3. Create a view using Storyboards as usual, and wire the UI elements to your view controller header like you would normally do. Create a "glue" `ViewController` instance for this view, that extends `GBYViewController`. Make your view controller call into the ClojureScript when the view is loaded, passing in wrapped references to UIKit elements.
4. Create a ClojureScript namespace that mirrors the name of your view, and make use of the `defui` macro to set up atoms for each of your UI elements and to export a method that the Objective-C side can use to initialize these atoms.
5. Add code in your ClojureScript namespace to set up UI events handlers, peform application logic, update UI elements, etc.
6. Add more views and segues between them as you normally would. In the end, the application primarily consists of a set of ClojureScript namespaces covering the various view controllers, along with ancillary application-level ClojureScript needed to flesh out your application.

REPL
====

You can use a REPL while developing, inspecting and manipulating UI and other app state, revising function implementations, etc. I have found that I need to restart my iOS app when making Storyboard changes, or other significant changes. The [Shrimp](https://github.com/mfikes/shrimp) project discusses establishing a REPL.

Performance
===========

Launch time performance is good. On an A5 (which is used by the iPhone 4s, iPad 2, and iPod touch), the Google Closure optimized JavaScript for my production app is loaded in around 380 milliseconds.

At runtime, one area where you can often see performance issues in iOS is when implemnting scrolling table views. In my production app, I have table views being driven by ClojureScript, initializing cells using data on the ClojureScript side, etc., and I have seen no stuttering when scrolling.

Otherwise, I've been using the ClojureScript to "orchestrate" the otherwise native UI and native animations present in iOS and have had no performance issues in going this route.


Project Status
==============

Goby is under active development. I have used it to create one production app in the App Store and am using it to create additional apps, fleshing out aspects of the Goby code as needed. As such the code is subject to change.

If you'd like to use it, or would like to contribute, I'd be happy---that's the point of sharing it here!

License
=======

Distributed under the Eclipse Public License, which is also used by ClojureScript.
