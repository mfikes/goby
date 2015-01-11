Goby
====

Develop iOS apps with ClojureScript.

[![Clojars Project](http://clojars.org/goby/latest-version.svg)](http://clojars.org/goby)

Overview
========

This repository contains some lightweight ClojureScript and Objective-C glue code that facilitates creating iOS apps where the view controllers are written in ClojureScript instead of Objective‑C or Swift. Otherwise the resulting iOS apps are native, with the JavaScript running in an embedded JavaScriptCore instance.

The overall design includes decorators for various UIKit elements, each implementing the `JSExport` protocol so that interop can be established between the ClojureScript code and the UI elements. Goby treats the UI as a bunch mutable state that can be manipulated or listened to, with atoms in the ClojureScript code simply holding references to the decorators.

When needing to provide Objective-C protocol implementations such as `UITableViewDataSource`, Goby provides an equivalent ClojureScript protocol, along with some glue code and a `reify` macro, making it possible to implement the Objective-C protocol directly in ClojureScript. The case where some of the Objective-C methods are optional is handled.

A few other things are thrown in to get things off the ground, like some infrastructural glue code to manage the loading of the JavaScript, along with simple facilities for method dispatch from the iOS to ClojureScript namespaces. ClojureScript keywords for various iOS SDK enumeration constants are defined to make life easier.

As such, Goby is fairly minimal, simply providing some structure to help establish communication between the Objective-C and ClojureScript sides of the fence. It doesn't attempt to provide a sophisticated framework such as  providing a FRP model like [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa). It at least gets you to the point where you are coding in ClojureScript. :) 

This approach was taken to build [an app](http://fikesfarm.com/cc/) currently in the App Store and this repo is derived from the reusable bits from that project.

Usage
=====

Check out the companion working example project [Shrimp](https://github.com/mfikes/shrimp) illustrating actual use of this code.

Roughly speaking, the overall steps are:

1. Set up sibling iOS and ClojureScript projects and make the Goby iOS and ClojureScript code available to each. (The [Shrimp](https://github.com/mfikes/shrimp) project provides a working example of this where Goby is simply used as a Git submodule along with a sprinkling of symbolic links. In the future this will probably be revised to allow the Goby dependencies to be managed via CocoaPods and Clojars.) 
1. The ClojureScript for your app compiles down to JavaScript which is included as a reference in the iOS project bundle.
1. In your `[AppDelegate application:didFinishLaunchingWithOptions:]` set up an instance of `GBYManager`, which loads the ClojureScript-compiled JavaScript, and adds a few callback handlers as needed for logging and timers.
1. Create a view using Storyboards in Xcode’s interface builder as usual, and wire the UI elements to your view controller header as you would normally do. Create a "glue" `UIViewController` class for this view by extending `GBYViewController`. Make your view controller call into the ClojureScript when the view is loaded, passing in decorated references to UIKit elements.
1. On the ClojureScript side, create a namespace that mirrors the name of your view controller, and make use of the `defui` macro to set up atoms for each of your UI elements and to `^:export` a method that the Objective-C side can use to initialize the UI element atoms. (Of course, all of this could be coded by hand, but this is an example where the Goby code can reduce repeated boilerplate for each view controller.)
1. Add code in your ClojureScript namespace to set up UI events handlers, perform application logic as needed, update UI elements, etc. In other words, implement your app logic in ClojureScript. :)
1. Add more views and view controllers, and segues between them, as you normally would. In the end, the application primarily consists of a set of ClojureScript namespaces covering the various view controllers, along with ancillary application-level ClojureScript needed to flesh out your application.

REPL
====

You can use a REPL while developing, inspecting and manipulating UI and other app state, revising function implementations, etc. I have found that I need to restart my iOS app when making Storyboard changes, or other significant changes. The [Shrimp](https://github.com/mfikes/shrimp) project discusses establishing a REPL.

The REPL is a “browser” REPL, but connects to the embedded JavaScriptCore instance in the iOS app. (In dev builds, Goby conditionally compiles this JavaScriptCore instance to be in a hidden web view so that sufficient “browser” functionality exists for the REPL, but in release builds, a JavaScriptCore instance is directly `alloc/init`d.

The REPL can connect with iOS simulator on your dev Mac, and also with instances of your app on your dev devices.

Performance
===========

Launch time performance is good. On an A5 (which is used by the iPhone 4s, iPad 2, and iPod touch), the Google Closure optimized JavaScript for my production app is loaded in around 380 milliseconds.

At runtime, one area where you can often see performance issues in iOS is when implementing scrolling table views. In my production app, I have table views being driven by ClojureScript, initializing cells using data on the ClojureScript side, etc., and I have seen no stuttering when scrolling.

Otherwise, I've arguably been using the ClojureScript to "orchestrate" the otherwise native iOS UI and native iOS animations, and have had no performance issues in going this route.

For tasks such as using HTTP for image fetching or REST API calls, I simply make use of the fine native AFNetworking library, driving it from ClojureScript.

Project Status
==============

Goby is under active development. I have used it to create [one production app](http://fikesfarm.com/cc/) in the App Store and am using it to develop additional apps, fleshing out aspects of the Goby code as needed. As such the code is incomplete in some areas, has some rough corners in others, and questionable—but workable—design in others. So the code is still evolving and subject to change.

Having said that, If you'd like to use it, or would like to contribute, I'd be happy---that's the point of sharing it here!

License
=======

Distributed under the Eclipse Public License, which is also used by ClojureScript.
