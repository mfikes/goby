#import "GBYProtocolForwarder.h"

@interface GBYTableViewDataSource : GBYProtocolForwarder<UITableViewDataSource>

- (id)initWithObject:(JSValue *)object cellReuseIdentifier:(NSString*)cellReuseIdentifier;

@end
