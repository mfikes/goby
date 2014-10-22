#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYButton` defines interop methods for a `UIButton`.
 */
@protocol GBYButton <JSExport>

-(void)setTouchUpInsideCallback:(JSValue*)callback;
-(void)setTouchDownCallback:(JSValue*)callback;

- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@property JSValue* enabled;
@property JSValue* hidden;

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
