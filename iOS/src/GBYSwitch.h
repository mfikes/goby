#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYSwitch` defines interop methods for a `UISwitch`.
 */
@protocol GBYSwitch <JSExport>

-(void)setValueChangedCallback:(JSValue*)callback;
@property JSValue* enabled;
@property JSValue* on;

@end

/**
 `GBYSwitch` wraps a `UISwitch` for interop.
 */
@interface GBYSwitch : NSObject<GBYSwitch>

/**
 Wraps a switch for interop.
 
 @param zwitch The switch to wrap.
 @return The wrapped switch.
 */
+(GBYSwitch*)wrap:(UISwitch*)zwitch;

@end
