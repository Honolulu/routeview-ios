#import "RegionsTableModel.h"

@implementation RegionsTableModel

#pragma mark -
#pragma mark UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _regions ? [[_regions allKeys] count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"RegionCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  
  
  NSString *regionKey = [[_regions allKeys] objectAtIndex:[indexPath row]];
//  NSDictionary *item = [_regions objectForKey:regionKey];
  NSString *label = regionKey;
  [[cell textLabel] setText:label];
  [[cell detailTextLabel] setText:label];
  return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)updateFromRemote {
  NSLog(@"Loading regions...");
  RouteViewRemote *rvr = [RouteViewRemote sharedInstance];
  [rvr regionsWithCompletion:^(NSDictionary *dictionary) {
    NSLog(@"%@", dictionary);
    _regions = dictionary;
    NSLog(@"Regions loaded.");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RegionsTableReload" object:nil];
  } onError:^(NSError *error) {
    NSLog(@"%@", error);
  }];
}

@end
