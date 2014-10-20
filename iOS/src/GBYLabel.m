#import "GBYLabel.h"
#import "GBYColor.h"

@interface GBYLabel ()

@property UILabel* label;

@end

@implementation GBYLabel

+(GBYLabel*)wrap:(UILabel*)label
{
    return [[GBYLabel alloc] initWithLabel:label];
}

-(id)initWithLabel:(UILabel*)label
{
    if (self = [super init]) {
        self.label = label;
    }
    
    return self;
}

-(NSString*)text
{
    return self.label.text;
}

-(void)setText:(NSString *)text
{
    self.label.text = text;
}

-(GBYColor*)textColor
{
    return [GBYColor wrap:self.label.textColor];
}

-(void)setTextColor:(GBYColor *)color
{
    self.label.textColor = color.color;
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.label.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.label.enabled = [enabled toBool];
}

-(JSValue*)hidden
{
    return [JSValue valueWithBool:self.label.hidden inContext:[JSContext currentContext]];
}

-(void)setHidden:(JSValue*)hidden
{
    self.label.hidden = [hidden toBool];
}


-(CGRect)frame
{
    return self.label.frame;
}

-(void)setFrame:(CGRect)frame
{
    self.label.frame = frame;
}

@end
