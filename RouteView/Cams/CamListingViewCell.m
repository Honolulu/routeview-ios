#import "CamListingViewCell.h"

@implementation CamListingViewCell

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
//    [[self layer] setCornerRadius:5.0f];
//    [[self layer] setMasksToBounds:YES];
  }
  return self;
}
- (void)loadCamImage:(NSString *)camImageUrl {
  [_camImageActivityIndicatorView startAnimating];
  RouteViewRemote *rvr = [RouteViewRemote sharedInstance];
  [rvr camForURL:camImageUrl onCompletion:^(NSData *data) {
    UIImage *image=[UIImage imageWithData:data];
    [_camImageView setImage:image];
    [_camImageActivityIndicatorView stopAnimating];
  } onError:^(NSError *error) {
    NSLog(@"Error loading camera image with URL: %@", camImageUrl);
    [_camImageActivityIndicatorView stopAnimating];
  }];
}

@end
