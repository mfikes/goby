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

/**
 Wraps an image view for interop.
 
 @param imageView The image view to wrap.
 @return The wrapped image view.
 */
+(GBYImageView*)wrap:(UIImageView*)imageView;

/**
 Gets the wrapped image view.
 
 @return the wrapped image view.
 */
-(UIImageView*)wrappedImageView;

@end
