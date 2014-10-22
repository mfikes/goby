#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <CoreData/CoreData.h>

/**
 `GBYFetchedResultsController` defines interop methods for an `NSFetchedResultsController`.
 */
@protocol GBYFetchedResultsController <JSExport>

@property JSValue* cljsDelegate;

- (id)objectAtSection:(NSInteger)section row:(NSInteger)row;
- (void)performFetch;

- (int)sectionCount;
- (int)numberOfObjectsInSection:(int)section;

@end

@interface GBYFetchedResultsController : NSFetchedResultsController<GBYFetchedResultsController>

- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext: (NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name;

@end
