#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYAlertUtils` defines utility methods for displaying alerts.
 */
@protocol GBYAlertUtils <JSExport>

/**
 Displays an alert with a given message.
 
 @param message The message to display.
 */
+ (void)alertWithMessage:(NSString*)message;

@end

/**
 `GBYAlertUtils` implements utility methods for displaying alerts.
 */
@interface GBYAlertUtils : NSObject<GBYAlertUtils>

@end
