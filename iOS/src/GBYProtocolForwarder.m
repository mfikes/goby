#import "GBYProtocolForwarder.h"
#import "GBYManager.h"

@interface GBYProtocolForwarder ()

@property JSValue* object;
@property NSSet* implementedSelectors;
@property NSDictionary* methodNameToFnCache;
@property NSString* namespace;

@end

@implementation GBYProtocolForwarder

-(id)initWithObject:(JSValue*)object methodMap:(NSDictionary*)methodNameToSelector protocolName:(NSString*)protocolName inNamespace:(NSString*)namespace
{
    if (self = [super init]) {
        self.object = object;
        self.namespace = namespace;
        NSArray* implementedMethods = [[self getFnWithNameFromScript:[NSString stringWithFormat:@"%@-implements", protocolName]] callWithArguments:@[object]].toArray;
        [self setUpMethods:methodNameToSelector withImplementedMethods:implementedMethods];
    }
    return self;
}

-(JSValue*)call:(NSString*)name withArguments:(NSArray*)args
{
    NSMutableArray* scriptArguments = [[NSMutableArray alloc] init];
    [scriptArguments addObject:self.object];
    [scriptArguments addObjectsFromArray:args];
    return [[self getFnWithName:name] callWithArguments:scriptArguments];
}
- (GBYManager*)manager
{
    id appDelegate = [[UIApplication sharedApplication] delegate];
    return [appDelegate valueForKey:@"cljsManager"];
}

- (JSValue*)getFnWithNameFromScript:(NSString*)name
{
    //NSLog(@"getFnWithNameFromScript: %@", name);
    
    JSValue* rv = [self.manager getValue:name inNamespace:self.namespace];
    
    NSAssert(rv && !rv.isUndefined, @"Function with name %@.%@ is undefined in script", self.namespace, name);
    
    return rv;
}

-(void)setUpMethods:(NSDictionary*)methodNameToSelector withImplementedMethods:(NSArray*)implementedMethods
{
    NSMutableSet* implementedSelectorsTemp = [[NSMutableSet alloc] init];
    NSMutableDictionary* methodNameToFnTemp = [[NSMutableDictionary alloc] init];
    for (NSString* methodName in [methodNameToSelector allKeys] ) {
        if ([implementedMethods containsObject:methodName]) {
            [implementedSelectorsTemp addObject:[methodNameToSelector objectForKey:methodName]];
            [methodNameToFnTemp setObject:[self getFnWithNameFromScript:methodName] forKey:methodName];
        }
    }
    self.implementedSelectors = [[NSSet alloc] initWithSet:implementedSelectorsTemp];
    self.methodNameToFnCache = [[NSDictionary alloc] initWithDictionary:methodNameToFnTemp];
}

- (JSValue*)getFnWithName:(NSString*)name
{
    JSValue* rv = [self.methodNameToFnCache objectForKey:name];
    if (rv) {
        return rv;
    }
    return [self getFnWithNameFromScript:name];
}

-(BOOL)respondsToSelector:(SEL)selector
{
    BOOL rv = [self.implementedSelectors containsObject:[NSValue valueWithPointer:selector]];
    //NSLog(@"%d %@", rv, NSStringFromSelector(selector));
    return rv;
}

@end
