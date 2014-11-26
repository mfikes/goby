#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYViewController <JSExport>

@property(nonatomic,readonly) UIInterfaceOrientation interfaceOrientation;
- (void)performSegueWithIdentifier:(NSString*)identifier;
- (void)dismissViewControllerAnimated:(BOOL)animated;
- (void)animateWithDuration:(NSTimeInterval)duration animations:(JSValue*)animations completion:(JSValue*)completion;

@end

@interface GBYViewController : UIViewController<GBYViewController>

- (NSString*)getNamespace;
- (JSValue*)getFunction:(NSString*)name;
- (void)handleViewDidLoad;

@end
