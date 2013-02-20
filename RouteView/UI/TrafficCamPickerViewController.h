#import <UIKit/UIKit.h>
#import "IAInfiniteGridView.h"

@interface TrafficCamPickerViewController : UIViewController<IAInfiniteGridDataSource, IAInfiniteGridDelegate>
@property (weak, nonatomic) IBOutlet IAInfiniteGridView *gridView;
@property (strong, nonatomic) NSString *region;
@end
