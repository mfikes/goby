#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class GBYLabel;

/**
 `GBYTableViewCell` defines interop methods for a `UITableViewCell`.
 */
@protocol GBYTableViewCell <JSExport>

@property (nonatomic,readonly) GBYLabel* textLabel;
@property (nonatomic,readonly) GBYLabel* detailTextLabel;

@end

/**
 `GBYTableViewCell` wraps a `UITableViewCell` for interop.
 */
@interface GBYTableViewCell : NSObject<GBYTableViewCell>

+(GBYTableViewCell*)wrap:(UITableViewCell*)tableViewCell;

@end

