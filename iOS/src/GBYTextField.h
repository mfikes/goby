#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

@protocol GBYTextField <JSExport>

@property JSValue* enabled;
@property JSValue* hidden;
@property (nonatomic) NSString* text;
@property (nonatomic) NSString* placeholder;
@property (nonatomic) GBYColor* textColor;

-(void)setEditingDidBeginCallback:(JSValue*)callback;
-(void)setEditingChangedCallback:(JSValue*)callback;
-(void)setEditingDidEndCallback:(JSValue*)callback;
-(void)setEditingDidEndOnExitCallback:(JSValue*)callback;

-(void)becomeFirstResponder;

@end

@interface GBYTextField : NSObject<GBYTextField>

+(GBYTextField*)wrap:(UITextField*)textField;

@end
