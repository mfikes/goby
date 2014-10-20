#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "GBYProtocolForwarder.h"

@interface GBYFetchedResultsControllerDelegate : GBYProtocolForwarder<NSFetchedResultsControllerDelegate>

- (id)initWithObject:(JSValue*)object;

@end
