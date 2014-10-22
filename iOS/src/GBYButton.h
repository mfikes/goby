#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYButton` defines interop methods for a `UIButton`.
 */
@protocol GBYButton <JSExport>

/**
 Maps to the `enabled` property.
 */
@property JSValue* enabled;

/**
 Maps to the `hidden` property.
 */
@property JSValue* hidden;

/**
 Maps to `-[UIButton setTitle:forState]`.
 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state;

/**
 Sets a callback for `UIControlEventTouchUpInside`.
 
 @param callback The callback.
 */
-(void)setTouchUpInsideCallback:(JSValue*)callback;

/**
 Sets a callback for `UIControlEventTouchDown`.
 
 @param callback The callback.
 */
-(void)setTouchDownCallback:(JSValue*)callback;

@end

/**
 `GBYButton` wraps a `UIButton` for interop.
 */
@interface GBYButton : NSObject<GBYButton>

/**
 Wraps a button for interop.
 
 @param button The button to wrap.
 @return The wrapped button.
 */
+(GBYButton*)wrap:(UIButton*)button;

@end
