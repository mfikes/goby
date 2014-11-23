#import "GBYFetchedResultsController.h"
#import "GBYFetchedResultsControllerDelegate.h"

@interface GBYFetchedResultsController ()

// Properties to ensure delegates set from ClojureScript are retained
@property (strong, nonatomic) JSValue* retainedDelegate;
@property (strong, nonatomic) GBYFetchedResultsControllerDelegate* retainedDelegateWrapper;

@end

@implementation GBYFetchedResultsController

- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext: (NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name
{
    return [super initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:sectionNameKeyPath cacheName:name];
}


- (id)objectAtSection:(NSInteger)section row:(NSInteger)row
{
    return [self objectAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
}

- (void)performFetch {
    NSError* error = nil;
    [self performFetch:&error];
}

- (int)sectionCount
{
    return (int)self.sections.count; // unsigned long
}

- (int)numberOfObjectsInSection:(int)section
{
    if (self.sectionCount) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.sections objectAtIndex:section];
        return (int)[sectionInfo numberOfObjects]; // unsigned long
    }
    return 0;
}

- (void)setCljsDelegate:(JSValue*)delegate
{
    if ([delegate isNull]) {
        delegate = nil;
    }
    self.retainedDelegate = delegate;
    self.retainedDelegateWrapper = delegate != nil ? [[GBYFetchedResultsControllerDelegate alloc] initWithObject:delegate] : nil;
    self.delegate = self.retainedDelegateWrapper;
}

- (JSValue*)cljsDelegate
{
    return self.retainedDelegate;
}

@end
