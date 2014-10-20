#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GBYProtocolForwarder.h"

@interface GBYFetchedResultsControllerDelegate : GBYProtocolForwarder<NSFetchedResultsControllerDelegate>

- (id)initWithObject:(JSValue*)object;

@end
