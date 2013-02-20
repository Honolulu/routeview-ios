#import "RegionsViewController.h"

@interface RegionsViewController () {
}
@end

@implementation RegionsViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"RegionsTableReload" object:nil];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [_regionsTableModel updateFromRemote];
  
}
- (void)viewDidAppear:(BOOL)animated {
  [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)reloadData {
  [_regionsTableView reloadData];
  NSLog(@"Region table reloaded.");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"PushTrafficCamsView"]) {
    CamsViewController *cvc = [segue destinationViewController];
    NSInteger selectedRow = [[_regionsTableView indexPathForSelectedRow] row];
    NSString *region = [[[_regionsTableModel regions] allKeys] objectAtIndex:selectedRow];
//    NSDictionary *region = [[_regionsTableModel regions] objectForKey:regionKey];
    [cvc setRegion:region];
    [cvc setTitle:region];
  }
}
@end
