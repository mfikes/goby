#import "GBYScrollViewDelegate.h"

@interface GBYScrollViewDelegate ()

@property (strong, nonatomic) NSString* extendingProtocolName;

@end

@implementation GBYScrollViewDelegate

- (id)initWithObject:(JSValue *)object
{
    if (self = [self initWithObject:object
                          methodMap:@{}
                       protocolName:@"ScrollViewDelegate"
                        inNamespace:@"goby.core"]) {
    }
    return self;
}

-(id)initWithObject:(JSValue*)object methodMap:(NSDictionary*)methodNameToSelector protocolName:(NSString*)protocolName inNamespace:(NSString *)namespace
{
    NSDictionary* baseMethodMap = @{@"did-scroll": [NSValue valueWithPointer:@selector(scrollViewDidScroll:)],
                                    @"did-zoom": [NSValue valueWithPointer:@selector(scrollViewDidZoom:)],
                                    @"will-begin-dragging": [NSValue valueWithPointer:@selector(scrollViewWillBeginDragging:)],
                                    @"will-end-dragging-with-velocity-target-content-offset": [NSValue valueWithPointer:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)],
                                    @"did-end-dragging-will-decelerate": [NSValue valueWithPointer:@selector(scrollViewDidEndDragging:willDecelerate:)],
                                    @"will-begin-decelerating": [NSValue valueWithPointer:@selector(scrollViewWillBeginDecelerating:)],
                                    @"did-end-decelerating": [NSValue valueWithPointer:@selector(scrollViewDidEndDecelerating:)],
                                    @"did-end-scrolling-animation": [NSValue valueWithPointer:@selector(scrollViewDidEndScrollingAnimation:)],
                                    @"view-for-zooming-in-scroll-view": [NSValue valueWithPointer:@selector(viewForZoomingInScrollView:)],
                                    @"will-begin-zooming-with-view": [NSValue valueWithPointer:@selector(scrollViewWillBeginZooming:withView:)],
                                    @"did-end-zooming-with-view-at-scale": [NSValue valueWithPointer:@selector(scrollViewDidEndZooming:withView:atScale:)],
                                    @"should-scroll-to-top?": [NSValue valueWithPointer:@selector(scrollViewShouldScrollToTop:)],
                                    @"did-scroll-to-top": [NSValue valueWithPointer:@selector(scrollViewDidScrollToTop:)]};
    
    NSMutableDictionary* methodMap = [[NSMutableDictionary alloc] init];
    
    // Copy in the base method names, perhaps prepending with extending protocol name
    for (NSString* name in [baseMethodMap allKeys]) {
        NSString* methodName = name;
        if (![protocolName isEqualToString:@"ScrollViewDelegate"]) {
            methodName = [NSString stringWithFormat:@"%@-%@", protocolName, name];
        }
        [methodMap setObject:[baseMethodMap objectForKey:name] forKey:methodName];

    }
    
    // Copy in extending protocol names
    for (NSString* name in [methodNameToSelector allKeys]) {
        [methodMap setObject:[methodNameToSelector objectForKey:name] forKey:name];
    }
    
    if (self = [super initWithObject:object methodMap:methodMap protocolName:protocolName inNamespace:namespace]) {
        if (![protocolName isEqualToString:@"ScrollViewDelegate"]) {
            self.extendingProtocolName = protocolName;
        }
    }
    return self;
}

-(NSString*)getMethodName:(NSString*)baseName
{
    if (self.extendingProtocolName) {
        return [NSString stringWithFormat:@"%@-%@", self.extendingProtocolName, baseName];
    }
    return baseName;
}

-(JSValue*)callScoped:(NSString*)name withArguments:(NSArray*)args
{
    return [super call:[self getMethodName:name] withArguments:args];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self callScoped:@"did-scroll" withArguments:@[]];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self callScoped:@"did-zoom" withArguments:@[]];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self callScoped:@"will-begin-dragging" withArguments:@[]];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSArray* rv = [self callScoped:@"will-end-dragging-with-velocity-target-content-offset" withArguments:@[@(velocity.x), @(velocity.y), @(targetContentOffset->x), @(targetContentOffset->y)]].toArray;
    targetContentOffset->x = ((NSNumber*)rv[0]).floatValue;
    targetContentOffset->y = ((NSNumber*)rv[1]).floatValue;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self callScoped:@"did-end-dragging-will-decelerate" withArguments:@[@(decelerate)]];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self callScoped:@"will-begin-decelerating" withArguments:@[]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self callScoped:@"did-end-decelerating" withArguments:@[]];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self callScoped:@"did-end-scrolling-animation" withArguments:@[]];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self callScoped:@"view-for-zooming-in-scroll-view" withArguments:@[]].toObject;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    [self callScoped:@"will-begin-zooming-with-view" withArguments:@[view]];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    [self callScoped:@"did-end-zooming-with-view-at-scale" withArguments:@[view, @(scale)]];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return [self callScoped:@"should-scroll-to-top?" withArguments:@[]].toBool;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
     [self callScoped:@"did-scroll-to-top" withArguments:@[]];
}

@end
