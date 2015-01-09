#include <libkern/OSAtomic.h>

#import "GBYManager.h"
#import <JavaScriptCore/JavaScriptCore.h>

#import "GBYColor.h"
#import "GBYSoundUtils.h"
#import "GBYAlertUtils.h"

@interface GBYManager ()

@property JSContext *context;

#ifdef DEBUG
@property UIWebView *webView;
#endif

@end

@implementation GBYManager

- (void)setUpExceptionLogging:(JSContext*)context
{
    context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
       NSString* errorString = [NSString stringWithFormat:@"[%@:%@:%@] %@\n%@", exception[@"sourceURL"], exception[@"line"], exception[@"column"], exception, [exception[@"stack"] toObject]];
        NSLog(@"%@", errorString);
    };
}

- (void)setUpConsoleLog:(JSContext*)context
{
    [context evaluateScript:@"var console = {}"];
    context[@"console"][@"log"] = ^(NSString *message) {
        NSLog(@"JS: %@",message);
    };
}

- (void)setUpTimerFunctionality:(JSContext*)context
{
    static volatile int32_t counter = 0;
    
    NSString* callbackImpl = @"var callbackstore = {};\nvar setTimeout = function( fn, ms ) {\ncallbackstore[setTimeoutFn(ms)] = fn;\n}\nvar runTimeout = function( id ) {\nif( callbackstore[id] )\ncallbackstore[id]();\ncallbackstore[id] = nil;\n}\n";
    
    [context evaluateScript:callbackImpl];
    
    context[@"setTimeoutFn"] = ^( int ms ) {
        
        int32_t incremented = OSAtomicIncrement32(&counter);
    
        NSString *str = [NSString stringWithFormat:@"timer%d", incremented];
        
        JSValue *timeOutCallback = [JSContext currentContext][ @"runTimeout" ];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, ms * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
            [timeOutCallback callWithArguments: @[str]];
        });
        
        return str;
    };
    
}

- (JSContext*)createJSContext
{
#ifdef DEBUG
    self.webView = [[UIWebView alloc] init];
    JSContext* context =[self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [self setUpExceptionLogging:context];
    [self setUpConsoleLog:context];
#else
    JSContext* context = [[JSContext alloc] init];
    [self setUpExceptionLogging:context];
    [self setUpConsoleLog:context];
    [self setUpTimerFunctionality:context];
#endif
    
    return context;
}

- (id)initWithInitFnName:(NSString*)initFnName inNamespace:(NSString*)namespace
{
    if (self = [super init]) {
        
        [self setContext:[self createJSContext]];
        
        [self injectClass:[GBYColor class] withGlobalName:@"GBYColor"];
        [self injectClass:[GBYSoundUtils class] withGlobalName:@"GBYSoundUtils"];
        [self injectClass:[GBYAlertUtils class] withGlobalName:@"GBYAlertUtils"];
                
        NSAssert(_context != nil, @"The JavaScript context should not be nil");
        
        // Load the ClojureScript module
        NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
        NSString *scriptString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSAssert(scriptString != nil, @"The JavaScript text could not be loaded");
        [self.context evaluateScript:scriptString];
        
        JSValue* initFn = [self getValue:initFnName inNamespace:namespace];
        
        NSAssert(!initFn.isUndefined, @"Could not find the app init function");
        
#ifdef DEBUG
        BOOL debugBuild = YES;
#else 
        BOOL debugBuild = NO;
#endif
        
#ifdef TARGET_IPHONE_SIMULATOR
        BOOL targetSimulator = YES;
#else
        BOOL targetSimulator = NO;
#endif

        [initFn callWithArguments:@[@{@"debug-build": @(debugBuild),
                                      @"target-simulator": @(targetSimulator),
                                      @"user-interface-idiom": (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? @"iPad": @"iPhone")}]];
        
    }
    
    return self;
}

- (JSValue*)getValue:(NSString*)name inNamespace:(NSString*)namespace
{
    JSValue* namespaceValue = nil;
    for (NSString* namespaceElement in [namespace componentsSeparatedByString: @"."]) {
        if (namespaceValue) {
            namespaceValue = namespaceValue[[GBYManager munge:namespaceElement]];
        } else {
            namespaceValue = self.context[[GBYManager munge:namespaceElement]];
        }
    }
    
    return namespaceValue[[GBYManager munge:name]];
}

+ (NSString*)munge:(NSString*)s
{
    return [[[s stringByReplacingOccurrencesOfString:@"-" withString:@"_"]
             stringByReplacingOccurrencesOfString:@"!" withString:@"_BANG_"]
            stringByReplacingOccurrencesOfString:@"?" withString:@"_QMARK_"];
}

- (void)injectClass:(Class)clazz withGlobalName:(NSString*)name
{
    self.context[name] = clazz;
}

@end
