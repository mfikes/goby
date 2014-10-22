#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

/**
 `GBYTextField` defines interop methods for a `UITextField`.
 */
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

/**
 `GBYTextField` wraps a `UITextField` for interop.
 */
@interface GBYTextField : NSObject<GBYTextField>

+(GBYTextField*)wrap:(UITextField*)textField;

@end
