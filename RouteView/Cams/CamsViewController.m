#import "CamsViewController.h"

@interface CamsViewController ()

@end

@implementation CamsViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"CamsCollectionReload" object:nil];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  UINib *thisNib = [UINib nibWithNibName:@"CamListingViewCell" bundle:nil];
  [_collectionView registerNib:thisNib forCellWithReuseIdentifier:@"CamCell"];
	// Do any additional setup after loading the view.
  [_camsCollectionModel updateFromRemote:_region];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void)reloadData {
  [_collectionView reloadData];
  NSLog(@"Cams reloaded.");
}


@end
