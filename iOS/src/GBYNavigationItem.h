#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYNavigationItem` defines interop methods for a `UINavigationItem`.
 */
@protocol GBYNavigationItem <JSExport>

@property NSString* title;

@end

/**
 `GBYNavigationItem` wraps a `UINavigationItem` for interop.
 */
@interface GBYNavigationItem : NSObject<GBYNavigationItem>

+(GBYNavigationItem*)wrap:(UINavigationItem*)navigationItem;

@end
