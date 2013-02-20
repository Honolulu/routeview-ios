#import <UIKit/UIKit.h>
#import "CamsCollectionModel.h"
@interface CamsViewController : UIViewController

@property (strong, nonatomic) NSString *region;
@property (strong, nonatomic) IBOutlet CamsCollectionModel *camsCollectionModel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
