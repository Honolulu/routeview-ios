#import "CamsCollectionModel.h"

@implementation CamsCollectionModel

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellReuseId = @"CamCell";
  CamListingViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseId forIndexPath:indexPath];
  if (cell == nil) {
    cell = [[CamListingViewCell alloc] init];
  }
  NSString *camKey = [[_cams allKeys] objectAtIndex:[indexPath row]];
  NSDictionary *cam = [_cams objectForKey:camKey];
  NSString *camImageUrl = [cam objectForKey:@"cameraImageURL"];
  [cell loadCamImage:camImageUrl];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  //  [self performSegueWithIdentifier:@"ViewCamera" sender:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return _cams ? [[_cams allKeys] count] : 0;
}

- (void)updateFromRemote:(NSString *)region {
  NSLog(@"Region: %@", region);
  //  if (region) {
  RouteViewRemote *rvr = [RouteViewRemote sharedInstance];
  [rvr camsForRegion:region onCompletion:^(NSDictionary *dictionary) {
    NSLog(@"Cameras for %@: %@", region, dictionary);
    _cams = dictionary;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CamsCollectionReload" object:nil];
  } onError:^(NSError *error) {
    NSLog(@"Error loading cameras for %@", region);
  }];
}

@end
