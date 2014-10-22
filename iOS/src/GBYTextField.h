#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

/**
 `GBYTextField` defines interop methods for a `UITextField`.
 */
@protocol GBYTextField <JSExport>

/**
 Maps to the `enabled` property.
 */
@property JSValue* enabled;

/**
 Maps to the `hidden` property.
 */
@property JSValue* hidden;

/**
 Maps to the `text` property.
 */
@property (nonatomic) NSString* text;

/**
 Maps to the `placeholder` property.
 */
@property (nonatomic) NSString* placeholder;

/**
 Maps to the `textColor` property.
 */
@property (nonatomic) GBYColor* textColor;

/**
 Sets a callback for `UIControlEventEditingDidBegin`.
 */
-(void)setEditingDidBeginCallback:(JSValue*)callback;

/**
 Sets a callback for `UIControlEventEditingChanged`.
 */
-(void)setEditingChangedCallback:(JSValue*)callback;

/**
 Sets a callback for `UIControlEventEditingDidEnd`.
 */
-(void)setEditingDidEndCallback:(JSValue*)callback;

/**
 Sets a callback for `UIControlEventEditingDidEndOnExit`.
 */
-(void)setEditingDidEndOnExitCallback:(JSValue*)callback;

/**
 Maps to the `becomeFirstResponder` method.
 */
-(void)becomeFirstResponder;

@end

/**
 `GBYTextField` wraps a `UITextField` for interop.
 */
@interface GBYTextField : NSObject<GBYTextField>

/**
 Wraps a text field for interop.
 
 @param textField The text field to wrap.
 @return The wrapped text field.
 */
+(GBYTextField*)wrap:(UITextField*)textField;

@end
