#import "GBYTableViewCell.h"
#import "GBYLabel.h"

@interface GBYTableViewCell ()

@property UITableViewCell* tableViewCell;

@end

@implementation GBYTableViewCell

+(GBYTableViewCell*)wrap:(UITableViewCell*)tableViewCell
{
    return [[GBYTableViewCell alloc] initWithTableViewCell:tableViewCell];
}

-(id)initWithTableViewCell:(UITableViewCell*)tableViewCell
{
    if (self = [super init]) {
        self.tableViewCell = tableViewCell;
    }
    
    return self;
}

-(GBYLabel*)textLabel
{
    return [GBYLabel wrap:self.tableViewCell.textLabel];
}

-(GBYLabel*)detailTextLabel
{
    return [GBYLabel wrap:self.tableViewCell.detailTextLabel];
}


@end
