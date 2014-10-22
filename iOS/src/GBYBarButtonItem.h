#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYBarButtonItem` defines interop methods for a `UIBarButtonItem`.
 */
@protocol GBYBarButtonItem <JSExport>

/**
 Maps to the `enabled` property.
 */
@property JSValue* enabled;

/**
 Maps to the `title` property.
 */
@property NSString* title;

/**
 Sets the action callback.
 
 @param callback The callback.
 */
-(void)setActionCallback:(JSValue*)callback;

@end

/**
 `GBYBarButtonItem` wraps a `UIBarButtonItem` for interop.
 */
@interface GBYBarButtonItem : NSObject<GBYBarButtonItem>

/**
 Wraps a bar button item for interop.
 
 @param barButtonItem The bar button item to wrap.
 @return The wrapped bar button item.
 */
+(GBYBarButtonItem*)wrap:(UIBarButtonItem*)barButtonItem;

@end
