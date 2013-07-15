//
//  MVHostStreamService.h
//  MacViewerClient
//


@interface MVHostStreamService : NSObject

- (ENetworkServiceResult) connectHostForServerString:(NSString *)serverString withOptions:(NSDictionary *)options;

@end
