#import <Foundation/Foundation.h>

@class JSContext;
@class JSValue;

/**
 The `GBYManager` provides overall management of the ClojureScript-compiled
 JavaScript.
 */
@interface GBYManager : NSObject

/**
 Initializes this `GBYManager`. Calls the supplied initialization function in the 
 specified namespace. Internally creates an instance of `JSContext`, loading 
 `main.js` from the bundle.
 
 @param initFnName The initialization function name.
 @param namespace The namespace of the initialization function.
 @return This `GBYManager` instance.
 */
- (id)initWithInitFnName:(NSString*)initFnName inNamespace:(NSString*)namespace;

/**
 Initializes this `GBYManager`. Calls the supplied initialization function in the
 specified namespace, loading `main.js` from the bundle.
 
 @param initFnName The initialization function name.
 @param namespace The namespace of the initialization function.
 @param context The JavaScriptCore context to use.
 @return This `GBYManager` instance.
 */
- (id)initWithInitFnName:(NSString*)initFnName inNamespace:(NSString*)namespace withContext:(JSContext*)context;

/**
 Initializes this `GBYManager`. Calls the supplied initialization function in the
 specified namespace, Internally creates an instance of `JSContext`, optionally loading JavaScript.
 
 @param initFnName The initialization function name.
 @param namespace The namespace of the initialization function.
 @param path Path to optinal JavaScript to load. (Skipped if `nil`.)
 @return This `GBYManager` instance.
 */
- (id)initWithInitFnName:(NSString*)initFnName inNamespace:(NSString*)namespace loadingJavaScript:(NSString*)path;

/**
 Initializes this `GBYManager`. Calls the supplied initialization function in the
 specified namespace, optionally loading JavaScript.
 
 @param initFnName The initialization function name.
 @param namespace The namespace of the initialization function.
 @param context The JavaScriptCore context to use.
 @param path Path to optinal JavaScript to load. (Skipped if `nil`.)
 @return This `GBYManager` instance.
 */
- (id)initWithInitFnName:(NSString*)initFnName inNamespace:(NSString*)namespace withContext:(JSContext*)context loadingJavaScript:(NSString*)path;

/**
 Gets the value for a name in a namespace.
 
 @param name The name.
 @param namespace The namespace.
 */
- (JSValue*)getValue:(NSString*)name inNamespace:(NSString*)namespace;

/**
 Injects an exportable class into the JavaScript with a given global name.
 
 @param clazz The class to inject.
 @param name The global name.
 */
- (void)injectClass:(Class)clazz withGlobalName:(NSString*)name;

@end
