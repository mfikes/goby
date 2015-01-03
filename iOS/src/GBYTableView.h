#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 `GBYTableView` defines interop methods for a `UITableView`.
 */
@protocol GBYTableView <JSExport>

@property JSValue* dataSource;
@property JSValue* delegate;

@property (nonatomic) JSValue* hidden;
@property CGRect frame;

-(void)reloadData;
-(void)reloadRow:(int)row inSection:(int)section withAnimation:(UITableViewRowAnimation)animation;
-(void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
-(void)beginUpdates;
-(void)endUpdates;

-(void)insertSection:(int)sectionIndex withRowAnimation:(UITableViewRowAnimation)rowAnimation;
-(void)deleteSection:(int)sectionIndex withRowAnimation:(UITableViewRowAnimation)rowAnimation;

-(void)insertRow:(int)row inSection:(int)section withRowAnimation:(UITableViewRowAnimation)rowAnimation;
-(void)deleteRow:(int)row inSection:(int)section withRowAnimation:(UITableViewRowAnimation)rowAnimation;

-(NSArray*)indexPathForSelectedRow;
-(NSArray*)indexPathsForSelectedRows;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

- (void)selectRow:(int)row inSection:(int)section animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;

@property JSValue* allowsMultipleSelectionDuringEditing;

@end

/**
 `GBYTableView` wraps a `UITableView` for interop.
 */
@interface GBYTableView : NSObject<GBYTableView>

/**
 Wraps a table view for interop.
 
 @param tableView The table view to wrap.
 @return The wrapped table view.
 */
+(GBYTableView*)wrap:(UITableView*)tableView;

@end
