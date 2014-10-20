#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYImageView <JSExport>

@property JSValue* hidden;

@end

@interface GBYImageView : NSObject<GBYImageView>

+(GBYImageView*)wrap:(UIImageView*)imageView;

-(UIImageView*)wrappedImageView;

@end
