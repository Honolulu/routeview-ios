#import "MKNetworkEngine.h"

@interface RouteViewRemote : MKNetworkEngine
typedef void (^DictionaryResponseBlock)(NSDictionary *dictionary);
typedef void (^DataResponseBlock)(NSData *data);

-(MKNetworkOperation*) regionsWithCompletion:(DictionaryResponseBlock)completionBlock
                                     onError:(MKNKErrorBlock)errorBlock;
-(MKNetworkOperation*) camsForRegion:(NSString *)region
                        onCompletion:(DictionaryResponseBlock)completionBlock
                             onError:(MKNKErrorBlock)errorBlock;
-(MKNetworkOperation*) camForURL:(NSString *)camURL
                    onCompletion:(DataResponseBlock)completionBlock
                         onError:(MKNKErrorBlock)errorBlock;

+ (RouteViewRemote *)sharedInstance;

@end
