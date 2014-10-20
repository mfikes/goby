#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYSwitch <JSExport>

-(void)setValueChangedCallback:(JSValue*)callback;
@property JSValue* enabled;
@property JSValue* on;

@end

@interface GBYSwitch : NSObject<GBYSwitch>

+(GBYSwitch*)wrap:(UISwitch*)zwitch;

@end
