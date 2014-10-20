#import "GBYButton.h"

@interface GBYButton ()

@property UIButton* button;
@property JSValue* myTouchUpInsideCallback;
@property JSValue* myTouchDownCallback;

@end

@implementation GBYButton

+(GBYButton*)wrap:(UIButton*)button
{
    return [[GBYButton alloc] initWithButton:button];
}

-(id)initWithButton:(UIButton*)button
{
    if (self = [super init]) {
        self.button = button;
    }
    
    return self;
}

-(void)doTouchUpInsideCallback
{
    [self.myTouchUpInsideCallback callWithArguments:@[]];
}

-(void)setTouchUpInsideCallback:(JSValue*)callback
{
    if (self.myTouchUpInsideCallback) {
        [self.button removeTarget:self action:@selector(doTouchUpInsideCallback) forControlEvents:UIControlEventTouchUpInside];
    }
    self.myTouchUpInsideCallback = callback;
    if (self.myTouchUpInsideCallback) {
        [self.button addTarget:self action:@selector(doTouchUpInsideCallback) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)doTouchDownCallback
{
    [self.myTouchDownCallback callWithArguments:@[]];
}

-(void)setTouchDownCallback:(JSValue*)callback
{
    if (self.myTouchDownCallback) {
        [self.button removeTarget:self action:@selector(doTouchDownCallback) forControlEvents:UIControlEventTouchDown];
    }
    self.myTouchDownCallback = callback;
    if (self.myTouchDownCallback) {
        [self.button addTarget:self action:@selector(doTouchDownCallback) forControlEvents:UIControlEventTouchDown];
    }
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.button.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.button.enabled = [enabled toBool];
}

-(JSValue*)hidden
{
    return [JSValue valueWithBool:self.button.hidden inContext:[JSContext currentContext]];
}

-(void)setHidden:(JSValue*)hidden
{
    self.button.hidden = [hidden toBool];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [self.button setTitle:title forState:state];
}

@end

