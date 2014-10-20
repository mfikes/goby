#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

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

+(GBYColor*)wrap:(UIColor*)color;
-(UIColor*)color;

@end
