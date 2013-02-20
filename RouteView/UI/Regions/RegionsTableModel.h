#import <Foundation/Foundation.h>

@interface RegionsTableModel : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDictionary *regions;
- (void)updateFromRemote;

@end
