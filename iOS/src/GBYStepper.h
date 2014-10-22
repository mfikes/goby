#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYStepper` defines interop methods for a `UIStepper`.
 */
@protocol GBYStepper <JSExport>

-(void)setValueChangedCallback:(JSValue*)callback;
@property JSValue* enabled;
@property double value;

@end

/**
 `GBYStepper` wraps a `UIStepper` for interop.
 */
@interface GBYStepper : NSObject<GBYStepper>

+(GBYStepper*)wrap:(UIStepper*)stepper;

@end
