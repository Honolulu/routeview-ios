#import <UIKit/UIKit.h>
#import "RegionsTableModel.h"
#import "CamsViewController.h"

@interface RegionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *regionsTableView;
@property (strong, nonatomic) IBOutlet RegionsTableModel *regionsTableModel;

@end
