#import "TrafficCamPickerViewController.h"

@interface TrafficCamPickerViewController ()

@end

@implementation TrafficCamPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.navigationController.navigationBar setHidden:NO];
	// Do any additional setup after loading the view.
  [_gridView setPaging:YES];
  [_gridView setCircular:YES];
  
  [self loadCameras];
}

- (void)loadCameras {
  NSLog(@"Region: %@", _region);
  if (_region) {
    RouteViewRemote *rvr = [RouteViewRemote sharedInstance];
    [rvr camsForRegion:_region onCompletion:^(NSDictionary *dictionary) {
      NSLog(@"Cameras for %@: %@", _region, dictionary);
    } onError:^(NSError *error) {
      NSLog(@"Error loading cameras for %@", _region);
    }];
  }
}

- (void)viewDidAppear:(BOOL)animated {
  [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIView *)infiniteGridView:(IAInfiniteGridView *)gridView forIndex:(NSInteger)gridIndex {
  UIView *grid = [self.gridView dequeueReusableGrid];
  if (grid == nil) {
    CGRect frame = CGRectMake(0.0, 0.0, [self infiniteGridSize].width, [self infiniteGridSize].height);
    grid = [[UIView alloc] initWithFrame:frame];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.jpeg"]];
    imageView.frame = frame;
    [imageView setTag:9999];
    [grid addSubview:imageView];
  }
  
  UIImageView *imageView = (UIImageView *)[grid viewWithTag:9999];
  [imageView setImage:[UIImage imageNamed:@"camera.jpeg"]];
  
  return grid;
}

// this method is used for circular mode, not very useful for infinite mode
- (NSUInteger)numberOfInfiniteGrids {
  return 5;
}

- (CGSize)infiniteGridSize {
  return CGSizeMake(80, 60);
}

- (void)infiniteGridView:(IAInfiniteGridView *)gridView didSelectGridAtIndex:(NSInteger)gridIndex {
  NSLog(@"Grid selected : %i", gridIndex);
}

@end
