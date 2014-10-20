#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GBYTableView <JSExport>

@property JSValue* dataSource;
@property JSValue* delegate;

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

@interface GBYTableView : NSObject<GBYTableView>

+(GBYTableView*)wrap:(UITableView*)tableView;

@end
