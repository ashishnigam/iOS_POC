//
//  MVHostStreamService.h
//  MacViewerClient
//


@interface MVHostStreamService : NSObject

- (ENetworkServiceResult) connectHostForServerString:(NSString *)serverString withOptions:(NSDictionary *)options;

@end

@protocol MVHostStreamConnecting <NSObject>

- (void) streamService:(MVHostStreamService *)streamService didSuccessfullyConnectWithInputStream:(NSStream *)inputStream outputStream:(NSStream *)outputStream;
- (void) streamService:(MVHostStreamService *)streamService didFailWithError:(NSError *)error;

@end