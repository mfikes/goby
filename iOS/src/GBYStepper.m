#import "GBYStepper.h"

@interface GBYStepper ()

@property UIStepper* stepper;
@property JSValue* myValueChangedCallback;

@end

@implementation GBYStepper

+(GBYStepper*)wrap:(UIStepper*)stepper
{
    return [[GBYStepper alloc] initWithStepper:stepper];
}

-(id)initWithStepper:(UIStepper*)stepper
{
    if (self = [super init]) {
        self.stepper = stepper;
    }
    
    return self;
}

-(void)doValueChangedCallback
{
    [self.myValueChangedCallback callWithArguments:@[@(self.stepper.value)]];
}

-(void)setValueChangedCallback:(JSValue*)callback
{
    if (self.myValueChangedCallback) {
        [self.stepper removeTarget:self action:@selector(doValueChangedCallback) forControlEvents:UIControlEventValueChanged];
    }
    self.myValueChangedCallback = callback;
    if (self.myValueChangedCallback) {
        [self.stepper addTarget:self action:@selector(doValueChangedCallback) forControlEvents:UIControlEventValueChanged];
    }
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.stepper.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.stepper.enabled = [enabled toBool];
}

-(double)value
{
    return self.stepper.value;
}

-(void)setValue:(double)value
{
    self.stepper.value = value;
}

@end

