#import "GBYViewController.h"
#import "GBYManager.h"

@interface GBYViewController ()

@end

@implementation GBYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self handleViewDidLoad];
}

- (void)handleViewDidLoad
{
    [[self getFunction:@"view-did-load!"] callWithArguments:@[self]];
}

- (NSString*) getNamespace {
    NSAssert(NO, @"Must provide init method namespace");
    return nil;
}

- (void)performSegueWithIdentifier:(NSString*)identifier
{
    [self performSegueWithIdentifier:identifier sender:self];
}

- (void)dismissViewControllerAnimated:(BOOL)animated
{
    [self dismissViewControllerAnimated:animated completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JSValue* fn = [self getOptionalFunction:@"prepare-for-segue!"];
    if (fn) {
        NSString* identifier = segue.identifier;
        id dest = [segue destinationViewController];
        [fn callWithArguments:@[identifier != nil ? identifier :[NSNull null],
                                dest != nil ? dest : [NSNull null]]];
    }
}

- (void)animateWithDuration:(NSTimeInterval)duration animations:(JSValue*)animations completion:(JSValue*)completion
{
    [UIView animateWithDuration:duration
                     animations:^{ [animations callWithArguments:@[]]; }
                     completion:(![completion isNull] ? ^(BOOL done){ [completion callWithArguments:@[@(done)]]; } : nil)];
}

- (GBYManager*)manager
{
    id appDelegate = [[UIApplication sharedApplication] delegate];
    return [appDelegate valueForKey:@"cljsManager"];
}

- (JSValue*)getFunctionImpl:(NSString*)name isOptional:(BOOL)optional
{
    NSString* namespace = [self getNamespace];
    JSValue *function = [self.manager getValue:name inNamespace:namespace];
    
    if (optional) {
        if ([function isUndefined]) {
            function = nil;
        }
    } else {
        NSAssert(function != nil, @"Failed to find function: %@/%@", namespace, name);
        NSAssert(![function isUndefined], @"Function is undefined: %@/%@", namespace, name);
    }
    
    return function;
}

- (JSValue*)getOptionalFunction:(NSString*)name
{
    return [self getFunctionImpl:name isOptional:YES];
}


- (JSValue*)getFunction:(NSString*)name
{
     return [self getFunctionImpl:name isOptional:NO];
}

- (void)callOptionalFunctionOfName:(NSString*)name withArguments:(NSArray*)args
{
    JSValue* fn = [self getOptionalFunction:name];
    if (fn) {
        [fn callWithArguments:args];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self callOptionalFunctionOfName:@"view-will-appear-animated!" withArguments:@[@(animated)]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self callOptionalFunctionOfName:@"view-did-appear-animated!" withArguments:@[@(animated)]];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self callOptionalFunctionOfName:@"will-animate-rotation-to-interface-orientation-duration!"
                       withArguments:@[@(toInterfaceOrientation), @(duration)]];
}

- (UIInterfaceOrientation)interfaceOrientation
{
    return super.interfaceOrientation;
}

@end
