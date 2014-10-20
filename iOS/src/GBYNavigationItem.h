#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYNavigationItem <JSExport>

@property NSString* title;

@end


@interface GBYNavigationItem : NSObject<GBYNavigationItem>

+(GBYNavigationItem*)wrap:(UINavigationItem*)navigationItem;

@end
