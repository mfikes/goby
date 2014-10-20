#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYColor;

@protocol GBYLabel <JSExport>

@property (nonatomic) NSString* text;
@property (nonatomic) GBYColor* textColor;
@property (nonatomic) JSValue* enabled;
@property (nonatomic) JSValue* hidden;
@property CGRect frame;

@end

@interface GBYLabel : NSObject<GBYLabel>

+(GBYLabel*)wrap:(UILabel*)label;

@end
