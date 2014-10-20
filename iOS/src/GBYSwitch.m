#import "GBYSwitch.h"

@interface GBYSwitch ()

@property UISwitch* zwitch;
@property JSValue* myValueChangedCallback;

@end

@implementation GBYSwitch

+(GBYSwitch*)wrap:(UISwitch*)zwitch
{
    return [[GBYSwitch alloc] initWithSwitch:zwitch];
}

-(id)initWithSwitch:(UISwitch*)zwitch
{
    if (self = [super init]) {
        self.zwitch = zwitch;
    }
    
    return self;
}

-(void)doValueChangedCallback
{
    [self.myValueChangedCallback callWithArguments:@[@(self.zwitch.on)]];
}

-(void)setValueChangedCallback:(JSValue*)callback
{
    if (self.myValueChangedCallback) {
        [self.zwitch removeTarget:self action:@selector(doValueChangedCallback) forControlEvents:UIControlEventValueChanged];
    }
    self.myValueChangedCallback = callback;
    if (self.myValueChangedCallback) {
        [self.zwitch addTarget:self action:@selector(doValueChangedCallback) forControlEvents:UIControlEventValueChanged];
    }
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.zwitch.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.zwitch.enabled = [enabled toBool];
}

-(JSValue*)on
{
    return [JSValue valueWithBool:self.zwitch.on inContext:[JSContext currentContext]];
}

-(void)setOn:(JSValue*)on
{
    self.zwitch.on = [on toBool];
}

@end

