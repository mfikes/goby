#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYAlertUtils <JSExport>

+ (void)alertWithMessage:(NSString*)message;

@end

@interface GBYAlertUtils : NSObject<GBYAlertUtils>

@end
