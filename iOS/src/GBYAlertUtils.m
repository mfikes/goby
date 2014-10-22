#import "GBYAlertUtils.h"

@implementation GBYAlertUtils

+ (void)alertWithMessage:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                              otherButtonTitles:nil];
        [alert show];
    });
}

@end
