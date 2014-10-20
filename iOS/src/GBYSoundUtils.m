#import "GBYSoundUtils.h"
#import <AudioToolbox/AudioServices.h>

@implementation GBYSoundUtils


+(void)playSoundWithName:(NSString*)name andExtension:(NSString*)extension {
    
    // Get the main bundle for the app
    CFBundleRef mainBundle = CFBundleGetMainBundle ();
    
    // Get the URL to the sound file to play.
    
    CFURLRef soundFileURLRef  = CFBundleCopyResourceURL (
                                                         mainBundle,
                                                         (__bridge CFStringRef)name,
                                                        (__bridge CFStringRef)extension,
                                                         NULL
                                                         );
    
    SystemSoundID soundFileObject;
    // Create a system sound object representing the sound file
    AudioServicesCreateSystemSoundID (
                                      soundFileURLRef,
                                      &soundFileObject
                                      );
    
    AudioServicesPlaySystemSound (soundFileObject);
    
    
}
 




@end
