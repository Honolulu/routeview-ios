//
//  CamsCollectionModel.h
//  RouteView
//
//  Created by James Wang on 2/20/13.
//  Copyright (c) 2013 Slickage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CamListingViewCell.h"

@interface CamsCollectionModel : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSDictionary *cams;
- (void)updateFromRemote:(NSString *)region;
@end
