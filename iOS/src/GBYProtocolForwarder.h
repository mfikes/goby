#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface GBYProtocolForwarder : NSObject

-(id)initWithObject:(JSValue*)object methodMap:(NSDictionary*)methodNameToSelector protocolName:(NSString*)protocolName inNamespace:(NSString*)namespace;
-(JSValue*)call:(NSString*)name withArguments:(NSArray*)args;

@end
