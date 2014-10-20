#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYStepper <JSExport>

-(void)setValueChangedCallback:(JSValue*)callback;
@property JSValue* enabled;
@property double value;

@end

@interface GBYStepper : NSObject<GBYStepper>

+(GBYStepper*)wrap:(UIStepper*)stepper;

@end
