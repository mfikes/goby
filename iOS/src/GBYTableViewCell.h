#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYLabel;

@protocol GBYTableViewCell <JSExport>

@property (nonatomic,readonly) GBYLabel* textLabel;
@property (nonatomic,readonly) GBYLabel* detailTextLabel;

@end

@interface GBYTableViewCell : NSObject<GBYTableViewCell>

+(GBYTableViewCell*)wrap:(UITableViewCell*)tableViewCell;

@end

