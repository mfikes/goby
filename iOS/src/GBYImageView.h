#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYImageView` defines interop methods for a `UIImageView`.
 */
@protocol GBYImageView <JSExport>

@property JSValue* hidden;

@end

/**
 `GBYImageView` wraps a `UIImageView` for interop.
 */
@interface GBYImageView : NSObject<GBYImageView>

+(GBYImageView*)wrap:(UIImageView*)imageView;

-(UIImageView*)wrappedImageView;

@end
