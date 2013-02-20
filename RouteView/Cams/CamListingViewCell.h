#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CamListingViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *camImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *camImageActivityIndicatorView;
- (void)loadCamImage:(NSString *)camImageUrl;
@end