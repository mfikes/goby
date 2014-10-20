#import "GBYImageView.h"

@interface GBYImageView ()

@property UIImageView* imageView;

@end

@implementation GBYImageView

+(GBYImageView*)wrap:(UIImageView*)imageView
{
    return [[GBYImageView alloc] initWithImageView:imageView];
}

-(id)initWithImageView:(UIImageView*)imageView
{
    if (self = [super init]) {
        self.imageView = imageView;
    }
    
    return self;
}

-(UIImageView*)wrappedImageView
{
    return self.imageView;
}

-(JSValue*)hidden
{
    return [JSValue valueWithBool:self.imageView.hidden inContext:[JSContext currentContext]];
}

-(void)setHidden:(JSValue*)hidden
{
    self.imageView.hidden = [hidden toBool];
}

@end
