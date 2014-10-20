#import "GBYProtocolForwarder.h"

@interface GBYScrollViewDelegate : GBYProtocolForwarder<UITableViewDelegate>

- (id)initWithObject:(JSValue*)object;

@end
