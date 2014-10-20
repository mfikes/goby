#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYSegmentedControl<JSExport>

-(void)setValueChangedCallback:(JSValue*)callback;
@property JSValue* enabled;

@end

@interface GBYSegmentedControl : NSObject<GBYSegmentedControl>

+(GBYSegmentedControl*)wrap:(UISegmentedControl*)segmentedControl;

@end
