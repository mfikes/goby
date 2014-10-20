#import "GBYNavigationItem.h"

@interface GBYNavigationItem ()

@property UINavigationItem* navigationItem;

@end

@implementation GBYNavigationItem

+(GBYNavigationItem*)wrap:(UINavigationItem*)navigationItem
{
     return [[GBYNavigationItem alloc] initWithNavigationItem:navigationItem];
}

-(id)initWithNavigationItem:(UINavigationItem*)navigationItem
{
    if (self = [super init]) {
        self.navigationItem = navigationItem;
    }
    
    return self;
}

-(void)setTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

-(NSString*)title
{
    return self.navigationItem.title;
}

@end
