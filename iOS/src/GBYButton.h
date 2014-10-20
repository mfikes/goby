#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYButton <JSExport>

-(void)setTouchUpInsideCallback:(JSValue*)callback;
-(void)setTouchDownCallback:(JSValue*)callback;

- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@property JSValue* enabled;
@property JSValue* hidden;

@end

@interface GBYButton : NSObject<GBYButton>

+(GBYButton*)wrap:(UIButton*)button;

@end
