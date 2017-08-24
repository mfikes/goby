#import "GBYTableViewDelegate.h"

@implementation GBYTableViewDelegate

- (id)initWithObject:(JSValue *)object
{
    if (self = [super initWithObject:object
                           methodMap:@{@"did-select-row-at-index-path": [NSValue valueWithPointer:@selector(tableView:didSelectRowAtIndexPath:)],
                                       @"did-deselect-row-at-index-path": [NSValue valueWithPointer:@selector(tableView:didDeselectRowAtIndexPath:)],
                                       @"title-for-delete-confirmation-button-for-row-at-index-path": [NSValue valueWithPointer:@selector(tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:)]}
            protocolName:@"TableViewDelegate" inNamespace:@"goby.core"]) {
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self call:@"did-select-row-at-index-path" withArguments:@[@(indexPath.section), @(indexPath.row)]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self call:@"did-deselect-row-at-index-path" withArguments:@[@(indexPath.section), @(indexPath.row)]];
}

- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self call:@"title-for-delete-confirmation-button-for-row-at-index-path" withArguments:@[@(indexPath.section), @(indexPath.row)]].toString;
}

@end
