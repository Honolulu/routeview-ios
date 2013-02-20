//
//  RouteViewController.m
//  RouteView
//
//  Created by James Wang on 2/20/13.
//  Copyright (c) 2013 Slickage. All rights reserved.
//

#import "RouteViewController.h"

@interface RouteViewController () {
  NiftySearchView *_searchView;
}

@end

@implementation RouteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.navigationController.navigationBar setHidden:YES];
	// Do any additional setup after loading the view.
  _searchView = [[NiftySearchView alloc] initWithFrame:CGRectMake(0, -76, 320, 76)];
  _searchView.delegate = (id)self;
  [self.view addSubview:_searchView];
  
  
  if ([_searchView.startTextField.text isEqualToString:NSLocalizedString(@"Current Location", nil)]) {
    _searchView.startTextField.textColor = [UIColor blueColor];
  } else {
    _searchView.startTextField.textColor = [UIColor blackColor];
  }
  if ([_searchView.finishTextField.text isEqualToString:NSLocalizedString(@"Current Location", nil)]) {
    _searchView.finishTextField.textColor = [UIColor blueColor];
  } else {
    _searchView.finishTextField.textColor = [UIColor blackColor];
  }
  
  CGRect searchBarFrame = _searchView.frame;
  searchBarFrame.origin.y = 0;
  [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     _searchView.frame = searchBarFrame;
                   }
                   completion:^(BOOL completion) {
                     [_searchView.startTextField becomeFirstResponder];
                   }];
}
- (void)viewDidAppear:(BOOL)animated {
  [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)routeButtonClicked:(UITextField *)startTextField finishTextField:(UITextField *)finishTextField {
  [self performSegueWithIdentifier:@"PushTrafficCamsView" sender:self];
}

@end
