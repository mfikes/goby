#import <Foundation/Foundation.h>

@class JSValue;

@interface GBYManager : NSObject

- (id)initInAppNamespace:(NSString*)appNamespace;

- (JSValue*)getCljsSymbol:(NSString*)symbol;
- (JSValue*)getCljsSymbol:(NSString*)symbol inNamespace:(NSString *)ns;
- (JSValue*)getCljsSymbol:(NSString*)symbol inNamespace:(NSString *)ns andSubNamespace:(NSString*)sns;
- (JSValue*)getCljsSymbol:(NSString*)symbol inNamespace:(NSString *)ns andSubNamespace:(NSString*)sns andSubSubNamespace:(NSString*)ssns;

- (void)injectClass:(Class)clazz withGlobalName:(NSString*)name;

@end
