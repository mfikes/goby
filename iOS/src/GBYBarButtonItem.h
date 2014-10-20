#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYBarButtonItem <JSExport>

-(void)setActionCallback:(JSValue*)callback;
@property JSValue* enabled;
@property NSString* title;

@end

@interface GBYBarButtonItem : NSObject<GBYBarButtonItem>

+(GBYBarButtonItem*)wrap:(UIBarButtonItem*)barButtonItem;

@end
