#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface GBYProtocolForwarder : NSObject

-(id)initWithObject:(JSValue*)object methodMap:(NSDictionary*)methodNameToSelector cljsProtocolName:(NSString*)cljsProtocolName;
-(JSValue*)call:(NSString*)name withArguments:(NSArray*)args;

@end
