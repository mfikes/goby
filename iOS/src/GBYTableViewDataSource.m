#import "GBYTableViewDataSource.h"
#import "GBYTableViewCell.h"

@interface GBYTableViewDataSource  ()

@property (nonatomic, strong) NSString* cellReuseIdentifier;

@end

@implementation GBYTableViewDataSource

- (id)initWithObject:(JSValue *)object cellReuseIdentifier:(NSString*)cellReuseIdentifier
{
    if (self = [super initWithObject:object
                           methodMap:@{@"number-of-rows-in-section": [NSValue valueWithPointer:@selector(tableView:numberOfRowsInSection:)],
                                       @"init-cell-for-row-at-index-path": [NSValue valueWithPointer:@selector(tableView:cellForRowAtIndexPath:)],
                                       @"number-of-sections": [NSValue valueWithPointer:@selector(numberOfSectionsInTableView:)],
                                       @"title-for-header-in-section": [NSValue valueWithPointer:@selector(tableView:titleForHeaderInSection:)],
                                       @"title-for-barter-in-section": [NSValue valueWithPointer:@selector(tableView:titleForFooterInSection:)],
                                       @"can-edit-row-at-index-path?": [NSValue valueWithPointer:@selector(tableView:canEditRowAtIndexPath:)],
                                       @"can-move-row-at-index-path?": [NSValue valueWithPointer:@selector(tableView:canMoveRowAtIndexPath:)],
                                       @"section-index-titles": [NSValue valueWithPointer:@selector(sectionIndexTitlesForTableView:)],
                                       @"section-for-section-index-title-at-index": [NSValue valueWithPointer:@selector(tableView:sectionForSectionIndexTitle:atIndex:)],
                                       @"commit-editing-style-for-row-at-index-path": [NSValue valueWithPointer:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)],
                                       @"move-row-at-index-path-to-index-path": [NSValue valueWithPointer:@selector(tableView:moveRowAtIndexPath:toIndexPath:)]}
            protocolName:@"TableViewDataSource" inNamespace:@"goby.core"]) {
        self.cellReuseIdentifier = cellReuseIdentifier;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self call:@"number-of-rows-in-section" withArguments:@[@(section)]].toInt32;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
    
    [self        call:@"init-cell-for-row-at-index-path"
        withArguments:@[[cell conformsToProtocol:@protocol(JSExport)] ? cell : [GBYTableViewCell wrap:cell],
                        @(indexPath.section), @(indexPath.row)]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self call:@"number-of-sections" withArguments:@[]].toInt32;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self call:@"title-for-header-in-section" withArguments:@[@(section)]].toString;
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [self call:@"title-for-barter-in-section" withArguments:@[@(section)]].toString;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self call:@"can-edit-row-at-index-path?" withArguments:@[@(indexPath.section), @(indexPath.row)]].toBool;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
   return [self call:@"can-move-row-at-index-path?" withArguments:@[@(indexPath.section), @(indexPath.row)]].toBool;
}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self call:@"section-index-titles" withArguments:@[]].toArray;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self call:@"section-for-section-index-title-at-index" withArguments:@[title, @(index)]].toInt32;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self call:@"commit-editing-style-for-row-at-index-path" withArguments:@[@(editingStyle), @(indexPath.section), @(indexPath.row)]];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self call:@"move-row-at-index-path-to-index-path" withArguments:@[@(sourceIndexPath.section), @(sourceIndexPath.row),
                                                                       @(destinationIndexPath.section), @(destinationIndexPath.row)]];
}

@end
