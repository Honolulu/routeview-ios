//
//  MainNavigationViewController.m
//  RouteView
//
//  Created by James Wang on 2/19/13.
//  Copyright (c) 2013 Slickage. All rights reserved.
//

#import "MainNavigationViewController.h"

@interface MainNavigationViewController ()

@end

@implementation MainNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  JMTabView * tabView = [[JMTabView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 60., self.view.bounds.size.width, 60.)];
  tabView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
  
  [tabView setDelegate:self];
  
  UIImage * standardIcon = [UIImage imageNamed:@"icon3.png"];
  UIImage * highlightedIcon = [UIImage imageNamed:@"icon2.png"];
  
  NavigationTabItem * tabItem1 = [NavigationTabItem tabItemWithTitle:@"Regions" icon:standardIcon alternateIcon:highlightedIcon executeBlock:^{
    NSLog(@"tab 1");
  }];
  NavigationTabItem * tabItem2 = [NavigationTabItem tabItemWithTitle:@"Route" icon:standardIcon alternateIcon:highlightedIcon executeBlock:^{
    NSLog(@"tab 2");
  }];
  NavigationTabItem * tabItem3 = [NavigationTabItem tabItemWithTitle:@"Location" icon:standardIcon alternateIcon:highlightedIcon executeBlock:^{
    NSLog(@"tab 3");
    
    UIStoryboard *storyboard = self.storyboard;
    TrafficCamPickerViewController *tcp = [storyboard instantiateViewControllerWithIdentifier:@"CamPicker"];
    [self presentViewController:tcp animated:YES completion:nil];
  }];
  
  [tabView addTabItem:tabItem1];
  [tabView addTabItem:tabItem2];
  [tabView addTabItem:tabItem3];
  
  [tabView setSelectionView:[NavigationSelectionView createSelectionView]];
  [tabView setItemSpacing:1.];
  [tabView setBackgroundLayer:[[NavigationBackgroundLayer alloc] init]];
  
  [tabView setSelectedIndex:0];
  
  [self.view addSubview:tabView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
