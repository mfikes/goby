#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYSegmentedControl` defines interop methods for a `UISegmentedControl`.
 */
@protocol GBYSegmentedControl<JSExport>

-(void)setValueChangedCallback:(JSValue*)callback;
@property JSValue* enabled;

@end

/**
 `GBYSegmentedControl` wraps a `UISegmentedControl` for interop.
 */
@interface GBYSegmentedControl : NSObject<GBYSegmentedControl>

/**
 Wraps a segmented control for interop.
 
 @param segmentedControl The segmented control to wrap.
 @return The wrapped segmented control.
 */
+(GBYSegmentedControl*)wrap:(UISegmentedControl*)segmentedControl;

@end
