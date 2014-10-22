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

+(GBYLabel*)wrap:(UILabel*)label;

@end
