#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYBarButtonItem` defines interop methods for a `UIBarButtonItem`.
 */
@protocol GBYBarButtonItem <JSExport>

-(void)setActionCallback:(JSValue*)callback;
@property JSValue* enabled;
@property NSString* title;

@end

/**
 `GBYBarButtonItem` wraps a `UIBarButtonItem` for interop.
 */
@interface GBYBarButtonItem : NSObject<GBYBarButtonItem>

+(GBYBarButtonItem*)wrap:(UIBarButtonItem*)barButtonItem;

@end
