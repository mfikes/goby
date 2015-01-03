#import "GBYTableView.h"
#import "GBYTableViewDataSource.h"
#import "GBYTableViewDelegate.h"

@interface GBYTableView ()

@property UITableView* tableView;

// Properties to ensure delegates set from ClojureScript are retained
@property (strong, nonatomic) JSValue* retainedDataSource;
@property (strong, nonatomic) JSValue* retainedDelegate;
@property (strong, nonatomic) GBYTableViewDataSource* retainedDataSourceWrapper;
@property (strong, nonatomic) GBYTableViewDelegate* retainedDelegateWrapper;

@end

@implementation GBYTableView

+(GBYTableView*)wrap:(UITableView*)tableView
{
    return [[GBYTableView alloc] initWithTableView:tableView];
}

-(id)initWithTableView:(UITableView*)tableView
{
    if (self = [super init]) {
        self.tableView = tableView;
    }
    
    return self;
}

- (void)setDataSource:(JSValue*)dataSource
{
    if ([dataSource isNull]) {
        dataSource = nil;
    }
    self.retainedDataSource = dataSource;
    self.retainedDataSourceWrapper = dataSource != nil ? [[GBYTableViewDataSource alloc] initWithObject:dataSource
                                                                                     cellReuseIdentifier:@"reuseIdentifier"] : nil;
    self.tableView.dataSource = self.retainedDataSourceWrapper;
}

- (JSValue*)dataSource
{
    return self.retainedDataSource;
}

- (void)setDelegate:(JSValue*)delegate
{
    if ([delegate isNull]) {
        delegate = nil;
    }
    self.retainedDelegate = delegate;
    self.retainedDelegateWrapper = delegate != nil ? [[GBYTableViewDelegate alloc] initWithObject:delegate] : nil;
    self.tableView.delegate = self.retainedDelegateWrapper;
}

- (JSValue*)delegate
{
    return self.retainedDelegate;
}

-(void)reloadData
{
    [self.tableView reloadData];
}

-(void)reloadRow:(int)row inSection:(int)section withAnimation:(UITableViewRowAnimation)animation
{
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:animation];
}

-(void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]
                          atScrollPosition:scrollPosition
                                  animated:animated];
}

-(JSValue*)hidden
{
    return [JSValue valueWithBool:self.tableView.hidden inContext:[JSContext currentContext]];
}

-(void)setHidden:(JSValue*)hidden
{
    self.tableView.hidden = [hidden toBool];
}

- (void)setFrame:(CGRect)frame
{
    self.tableView.frame = frame;
}

-(CGRect)frame
{
    return self.tableView.frame;
}

-(void)beginUpdates
{
    [self.tableView beginUpdates];
}

-(void)endUpdates
{
    [self.tableView endUpdates];
}

-(void)insertSection:(int)sectionIndex withRowAnimation:(UITableViewRowAnimation)rowAnimation
{
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:rowAnimation];
}

-(void)deleteSection:(int)sectionIndex withRowAnimation:(UITableViewRowAnimation)rowAnimation
{
     [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:rowAnimation];
}

-(void)insertRow:(int)row inSection:(int)section withRowAnimation:(UITableViewRowAnimation)rowAnimation
{
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:rowAnimation];
}

-(void)deleteRow:(int)row inSection:(int)section withRowAnimation:(UITableViewRowAnimation)rowAnimation
{
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:rowAnimation];
}

-(NSArray*)indexPathForSelectedRow {
    NSIndexPath* path = self.tableView.indexPathForSelectedRow;
    return @[@(path.section), @(path.row)];
}

-(NSArray*)indexPathsForSelectedRows {
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSArray* paths = self.tableView.indexPathsForSelectedRows;
    for (NSIndexPath *path in paths) {
        [rv addObject:@[@(path.section), @(path.row)]];
    }
    return rv;
}

-(JSValue*)allowsMultipleSelectionDuringEditing
{
    return [JSValue valueWithBool:self.tableView.allowsMultipleSelectionDuringEditing inContext:[JSContext currentContext]];
}

-(void)setAllowsMultipleSelectionDuringEditing:(JSValue*)value
{
    self.tableView.allowsMultipleSelectionDuringEditing = [value toBool];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [self.tableView setEditing:editing animated:animated];
}

- (void)selectRow:(int)row inSection:(int)section animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition
{
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section] animated:animated scrollPosition:scrollPosition];
}

@end
