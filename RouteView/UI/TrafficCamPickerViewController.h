//
//  TrafficCamPickerViewController.h
//  RouteView
//
//  Created by Julie Ann Sakuda on 2/19/13.
//  Copyright (c) 2013 Slickage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraPreviewCell.h"
#import "IAInfiniteGridView.h"

@interface TrafficCamPickerViewController : UIViewController<IAInfiniteGridDataSource, IAInfiniteGridDelegate>
@property (weak, nonatomic) IBOutlet IAInfiniteGridView *gridView;

@end
