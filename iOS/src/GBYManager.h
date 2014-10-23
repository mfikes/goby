#import <Foundation/Foundation.h>

@class JSValue;

/**
 The `GBYManager` provides overall management of the ClojureScript-compiled
 JavaScript.
 */
@interface GBYManager : NSObject

/**
 Initializes this `GBYManager`. Calls the supplied initialization function in the 
 specified namespace.
 
 @param initFnName The initialization function name.
 @param namespace The namespace of the initialization function.
 @return This `GBYManager` instance.
 */
- (id)initWithInitFnName:(NSString*)initFnName inNamespace:(NSString*)namespace;

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
