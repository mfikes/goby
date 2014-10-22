#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

/**
 `GBYLabel` defines interop methods for a `UILabel`.
 */
@protocol GBYLabel <JSExport>

@property (nonatomic) NSString* text;
@property (nonatomic) GBYColor* textColor;
@property (nonatomic) JSValue* enabled;
@property (nonatomic) JSValue* hidden;
@property CGRect frame;

@end

/**
 `GBYLabel` wraps a `UILabel` for interop.
 */
@interface GBYLabel : NSObject<GBYLabel>

/**
 Wraps a label for interop.
 
 @param label The label to wrap.
 @return The wrapped label.
 */
+(GBYLabel*)wrap:(UILabel*)label;

@end
