#import "GBYTextField.h"
#import "GBYColor.h"

@interface GBYTextField ()

@property UITextField* textField;
@property JSValue* myEditingDidBeginCallback;
@property JSValue* myEditingChangedCallback;
@property JSValue* myEditingDidEndCallback;
@property JSValue* myEditingDidEndOnExitCallback;

@end

@implementation GBYTextField

+(GBYTextField*)wrap:(UITextField*)textField
{
    return [[GBYTextField alloc] initWithTextField:textField];
}

-(id)initWithTextField:(UITextField*)textField
{
    if (self = [super init]) {
        self.textField = textField;
    }
    
    return self;
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.textField.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.textField.enabled = [enabled toBool];
}

-(JSValue*)hidden
{
    return [JSValue valueWithBool:self.textField.hidden inContext:[JSContext currentContext]];
}

-(void)setHidden:(JSValue*)hidden
{
    self.textField.hidden = [hidden toBool];
}

-(NSString*)text
{
    return self.textField.text;
}

-(void)setText:(NSString *)text
{
    self.textField.text = text;
}

-(NSString*)placeholder
{
    return self.textField.placeholder;
}

-(void)setPlaceholder:(NSString *)placeholder
{
    self.textField.placeholder = placeholder;
}

-(GBYColor*)textColor
{
    return [GBYColor wrap:self.textField.textColor];
}

-(void)setTextColor:(GBYColor *)textColor
{
    self.textField.textColor = textColor.color;
}

-(void)doEditingDidBeginCallback
{
    [self.myEditingDidBeginCallback callWithArguments:@[self.textField.text]];
}

-(void)setEditingDidBeginCallback:(JSValue*)callback
{
    if (self.myEditingDidBeginCallback) {
        [self.textField removeTarget:self action:@selector(doEditingDidBeginCallback) forControlEvents:UIControlEventEditingDidBegin];
    }
    self.myEditingDidBeginCallback = callback;
    if (self.myEditingDidBeginCallback) {
        [self.textField addTarget:self action:@selector(doEditingDidBeginCallback) forControlEvents:UIControlEventEditingDidBegin];
    }
}

-(void)doEditingChangedCallback
{
    [self.myEditingChangedCallback callWithArguments:@[self.textField.text]];
}

-(void)setEditingChangedCallback:(JSValue*)callback
{
    if (self.myEditingChangedCallback) {
        [self.textField removeTarget:self action:@selector(doEditingChangedCallback) forControlEvents:UIControlEventEditingChanged];
    }
    self.myEditingChangedCallback = callback;
    if (self.myEditingChangedCallback) {
        [self.textField addTarget:self action:@selector(doEditingChangedCallback) forControlEvents:UIControlEventEditingChanged];
    }
}

-(void)doEditingDidEndCallback
{
    [self.myEditingDidEndCallback callWithArguments:@[self.textField.text]];
}

-(void)setEditingDidEndCallback:(JSValue*)callback
{
    if (self.myEditingDidEndCallback) {
        [self.textField removeTarget:self action:@selector(doEditingDidEndCallback) forControlEvents:UIControlEventEditingDidEnd];
    }
    self.myEditingDidEndCallback = callback;
    if (self.myEditingDidEndCallback) {
        [self.textField addTarget:self action:@selector(doEditingDidEndCallback) forControlEvents:UIControlEventEditingDidEnd];
    }
}

-(void)doEditingDidEndOnExitCallback
{
    [self.myEditingDidEndOnExitCallback callWithArguments:@[self.textField.text]];
}

-(void)setEditingDidEndOnExitCallback:(JSValue*)callback
{
    if (self.myEditingDidEndOnExitCallback) {
        [self.textField removeTarget:self action:@selector(doEditingDidEndOnExitCallback) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    self.myEditingDidEndOnExitCallback = callback;
    if (self.myEditingDidEndOnExitCallback) {
        [self.textField addTarget:self action:@selector(doEditingDidEndOnExitCallback) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
}

-(void)becomeFirstResponder
{
    [self.textField becomeFirstResponder];
}

@end
