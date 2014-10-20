#import "GBYSegmentedControl.h"

@interface GBYSegmentedControl ()

@property UISegmentedControl* segmentedControl;
@property JSValue* myValueChangedCallback;

@end

@implementation GBYSegmentedControl

+(GBYSegmentedControl*)wrap:(UISegmentedControl*)segmentedControl
{
    return [[GBYSegmentedControl alloc] initWithSegmentedControl:segmentedControl];
}

-(id)initWithSegmentedControl:(UISegmentedControl*)segmentedControl
{
    if (self = [super init]) {
        self.segmentedControl = segmentedControl;
    }
    
    return self;
}

-(void)doValueChangedCallback
{
    [self.myValueChangedCallback callWithArguments:@[@(self.segmentedControl.selectedSegmentIndex)]];
}

-(void)setValueChangedCallback:(JSValue*)callback
{
    if (self.myValueChangedCallback) {
        [self.segmentedControl removeTarget:self action:@selector(doValueChangedCallback) forControlEvents:UIControlEventValueChanged];
    }
    self.myValueChangedCallback = callback;
    if (self.myValueChangedCallback) {
        [self.segmentedControl addTarget:self action:@selector(doValueChangedCallback) forControlEvents:UIControlEventValueChanged];
    }
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.segmentedControl.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.segmentedControl.enabled = [enabled toBool];
}

@end

