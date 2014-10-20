#import "GBYBarButtonItem.h"

@interface GBYBarButtonItem ()

@property UIBarButtonItem* barButtonItem;
@property JSValue* myActionCallback;

@end

@implementation GBYBarButtonItem

+(GBYBarButtonItem*)wrap:(UIBarButtonItem*)barButtonItem
{
    return [[GBYBarButtonItem alloc] initWithBarButtonItem:barButtonItem];
}

-(id)initWithBarButtonItem:(UIBarButtonItem*)barButtonItem
{
    if (self = [super init]) {
        self.barButtonItem = barButtonItem;
    }
    
    return self;
}

-(void)doActionCallback
{
    [self.myActionCallback callWithArguments:@[]];
}

-(void)setActionCallback:(JSValue*)callback
{
    self.myActionCallback = callback;
    if (self.myActionCallback) {
        self.barButtonItem.target = self;
        self.barButtonItem.action = @selector(doActionCallback);
    }
}

-(JSValue*)enabled
{
    return [JSValue valueWithBool:self.barButtonItem.enabled inContext:[JSContext currentContext]];
}

-(void)setEnabled:(JSValue*)enabled
{
    self.barButtonItem.enabled = [enabled toBool];
}

-(void)setTitle:(NSString*)title
{
    self.barButtonItem.title = title;
}

-(NSString*)title
{
    return self.barButtonItem.title;
}

@end

