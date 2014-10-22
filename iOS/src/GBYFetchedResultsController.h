#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <CoreData/CoreData.h>

/**
 `GBYFetchedResultsController` defines interop methods for an `NSFetchedResultsController`.
 */
@protocol GBYFetchedResultsController <JSExport>

/**
 Maps to the `delegate` property.
 */
@property JSValue* cljsDelegate;

/**
 Maps to `-[NSFetchedResultsController objectAtIndexPath:]`.
 
 @param section The index path section.
 @param row The index path row.
 @return The object.
 */
- (id)objectAtSection:(NSInteger)section row:(NSInteger)row;

/**
 Maps to `-[NSFetchedResultsController performFetch:]`.
 */
- (void)performFetch;

/**
 Gets the number of sections.
 
 @return The number of sections.
 */
- (int)sectionCount;

/**
 Gets the number of objects in a section.
 
 @param section Identifies a section.
 @return The number of objects in a section.
 */
- (int)numberOfObjectsInSection:(int)section;

@end

/**
 `GBYFetchedResultsController` extends `NSFetchedResultsController` for interop purposes.
 */
@interface GBYFetchedResultsController : NSFetchedResultsController<GBYFetchedResultsController>

- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext: (NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name;

@end
