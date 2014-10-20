#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYImageView <JSExport>

-(void)clearImage;
@property JSValue* hidden;

@end

@interface GBYImageView : NSObject<GBYImageView>

+(GBYImageView*)wrap:(UIImageView*)imageView;

-(UIImageView*)wrappedImageView;

@end
