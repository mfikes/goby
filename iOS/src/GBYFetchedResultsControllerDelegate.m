#import "GBYFetchedResultsControllerDelegate.h"

@implementation GBYFetchedResultsControllerDelegate

- (id)initWithObject:(JSValue *)object
{
    if (self = [super initWithObject:object
                           methodMap:@{@"did-change-object-at-index-path-for-change-type-new-index-path": [NSValue valueWithPointer:@selector(controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:)],
                                       @"did-change-section-at-index-for-change-type": [NSValue valueWithPointer:@selector(controller:didChangeSection:atIndex:forChangeType:)],
                                       @"will-change-content": [NSValue valueWithPointer:@selector(controllerWillChangeContent:)],
                                       @"did-change-content": [NSValue valueWithPointer:@selector(controllerDidChangeContent:)],
                                       @"section-index-title-for-section-name": [NSValue valueWithPointer:@selector(controller:sectionIndexTitleForSectionName:)]}
                    protocolName:@"FetchedResultsControllerDelegate" inNamespace:@"goby.core"]) {
    }
    return self;
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [self call:@"did-change-object-at-index-path-for-change-type-new-index-path" withArguments:@[anObject, @(indexPath.section), @(indexPath.row), @(type), @(newIndexPath.section), @(newIndexPath.row)]];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    // TODO make a JSExport wrapper for sectionInfo argument being passed, or pass its fields separately
   [self call:@"did-change-section-at-index-for-change-type" withArguments:@[sectionInfo, @(sectionIndex), @(type)]];
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self call:@"will-change-content" withArguments:@[]];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self call:@"did-change-content" withArguments:@[]];
}

- (NSString *)controller:(NSFetchedResultsController *)controller sectionIndexTitleForSectionName:(NSString *)sectionName
{
    return [self call:@"section-index-title-for-section-name" withArguments:@[sectionName]].toString;
}





@end
