#import "GBYColor.h"

@interface GBYColor ()

@property UIColor* color;

@end

@implementation GBYColor

+(GBYColor*)wrap:(UIColor*)color
{
    return [[GBYColor alloc] initWithColor:color];
}

-(id)initWithColor:(UIColor*)color
{
    if (self = [super init]) {
        self.color = color;
    }
    
    return self;
}

+(GBYColor*)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [GBYColor wrap:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
}

+(GBYColor*)blackColor
{
    return [GBYColor wrap:[UIColor blackColor]];
}

+(GBYColor*)darkGrayColor
{
    return [GBYColor wrap:[UIColor darkGrayColor]];
}

+(GBYColor*)lightGrayColor
{
    return [GBYColor wrap:[UIColor lightGrayColor]];
}

+(GBYColor*)whiteColor
{
    return [GBYColor wrap:[UIColor whiteColor]];
}

+(GBYColor*)grayColor
{
    return [GBYColor wrap:[UIColor grayColor]];
}

+(GBYColor*)redColor
{
    return [GBYColor wrap:[UIColor redColor]];
}

+(GBYColor*)greenColor
{
    return [GBYColor wrap:[UIColor greenColor]];
}

+(GBYColor*)blueColor
{
    return [GBYColor wrap:[UIColor blueColor]];
}

+(GBYColor*)cyanColor
{
    return [GBYColor wrap:[UIColor cyanColor]];
}

+(GBYColor*)yellowColor
{
    return [GBYColor wrap:[UIColor yellowColor]];
}

+(GBYColor*)magentaColor
{
    return [GBYColor wrap:[UIColor magentaColor]];
}

+(GBYColor*)orangeColor
{
    return [GBYColor wrap:[UIColor orangeColor]];
}

+(GBYColor*)purpleColor
{
    return [GBYColor wrap:[UIColor purpleColor]];
}

+(GBYColor*)brownColor
{
    return [GBYColor wrap:[UIColor brownColor]];
}

+(GBYColor*)clearColor
{
    return [GBYColor wrap:[UIColor clearColor]];
}

@end
