#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYSoundUtils <JSExport>

+ (void)playSoundWithName:(NSString*)name andExtension:(NSString*)extension;

@end

@interface GBYSoundUtils : NSObject<GBYSoundUtils>

@end
