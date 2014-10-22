#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

/**
 `GBYColor` defines interop methods for `UIColor`.
 */
@protocol GBYColor <JSExport>

/**
 Produces a wrapped color consistent with `+[UIColor colorWithRed:green:blue:alpha:]`.
 
 @param red the red component
 @param green the green component
 @param blue the blue component
 @param alpha the alpha component
 @return the wrapped color
 */
+(GBYColor*)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 Produces a wrappec color consistent with `+[UIColor blackColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)blackColor;

/**
 Produces a wrappec color consistent with `+[UIColor darkGrayColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)darkGrayColor;

/**
 Produces a wrappec color consistent with `+[UIColor lightGrayColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)lightGrayColor;

/**
 Produces a wrappec color consistent with `+[UIColor whiteColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)whiteColor;

/**
 Produces a wrappec color consistent with `+[UIColor grayColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)grayColor;

/**
 Produces a wrappec color consistent with `+[UIColor redColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)redColor;

/**
 Produces a wrappec color consistent with `+[UIColor greenColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)greenColor;

/**
 Produces a wrappec color consistent with `+[UIColor blueColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)blueColor;

/**
 Produces a wrappec color consistent with `+[UIColor cyanColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)cyanColor;

/**
 Produces a wrappec color consistent with `+[UIColor yellowColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)yellowColor;

/**
 Produces a wrappec color consistent with `+[UIColor magentaColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)magentaColor;

/**
 Produces a wrappec color consistent with `+[UIColor orangeColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)orangeColor;

/**
 Produces a wrappec color consistent with `+[UIColor purpleColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)purpleColor;

/**
 Produces a wrappec color consistent with `+[UIColor brownColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)brownColor;

/**
 Produces a wrappec color consistent with `+[UIColor clearColor]`.
 
 @return The wrapped color.
 */
+(GBYColor*)clearColor;

@end

/**
 `GBYColor` wraps a `UIColor` for interop.
 */
@interface GBYColor : NSObject<GBYColor>

/**
 Wraps a color for interop.
 
 @param color The color to wrap.
 @return The wrapped color.
 */
+(GBYColor*)wrap:(UIColor*)color;

/**
 Gets the wrapped color.
 
 @return the wrapped color.
 */
-(UIColor*)color;

@end
