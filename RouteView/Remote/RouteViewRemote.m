#import "RouteViewRemote.h"

@implementation RouteViewRemote

-(MKNetworkOperation*) regionsWithCompletion:(DictionaryResponseBlock)completionBlock
                                     onError:(MKNKErrorBlock)errorBlock {
  MKNetworkOperation *op = [self operationWithPath:@"regions"
                                            params:nil
                                        httpMethod:@"GET"];
  
  [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    NSDictionary *collection = [completedOperation responseJSON];
    completionBlock(collection);
  }
              errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                errorBlock(error);
              }];
  [self enqueueOperation:op];
  return op;
}

-(MKNetworkOperation*) camsForRegion:(NSString *)region
                        onCompletion:(DictionaryResponseBlock)completionBlock
                             onError:(MKNKErrorBlock)errorBlock {
  if (region) {
    region = [region stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  }
  else {
    region = @"Airport";
  }
  MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"regions/%@/cams", region]
                                            params:nil
                                        httpMethod:@"GET"];
  
  [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    NSDictionary *collection = [completedOperation responseJSON];
    completionBlock(collection);
  }
              errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                errorBlock(error);
              }];
  [self enqueueOperation:op];
  return op;
}

-(MKNetworkOperation*) camForURL:(NSString *)camURL
                    onCompletion:(DataResponseBlock)completionBlock
                         onError:(MKNKErrorBlock)errorBlock {
  MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"camera%@", camURL]
                                            params:nil
                                        httpMethod:@"GET"];
  
  [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    NSData *camImageData = [completedOperation responseData];
    completionBlock(camImageData);
  }
              errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                errorBlock(error);
              }];
  [self enqueueOperation:op];
  return op;
}



+ (RouteViewRemote *)sharedInstance {
  static RouteViewRemote *sharedInstance = nil;
  if (sharedInstance == nil) {
    //    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/json", @"Accept", nil];
    sharedInstance = [[RouteViewRemote alloc] initWithHostName:RV_HOST customHeaderFields:nil];
  }
  return sharedInstance;
}

@end
