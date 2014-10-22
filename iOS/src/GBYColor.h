#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

/**
 `GBYColor` defines interop methods for `UIColor`.
 */
@protocol GBYColor <JSExport>

+(GBYColor*)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+(GBYColor*)blackColor;
+(GBYColor*)darkGrayColor;
+(GBYColor*)lightGrayColor;
+(GBYColor*)whiteColor;
+(GBYColor*)grayColor;
+(GBYColor*)redColor;
+(GBYColor*)greenColor;
+(GBYColor*)blueColor;
+(GBYColor*)cyanColor;
+(GBYColor*)yellowColor;
+(GBYColor*)magentaColor;
+(GBYColor*)orangeColor;
+(GBYColor*)purpleColor;
+(GBYColor*)brownColor;
+(GBYColor*)clearColor;

@end

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
