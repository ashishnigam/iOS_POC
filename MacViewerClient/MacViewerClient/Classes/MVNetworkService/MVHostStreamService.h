//
//  MVHostStreamService.h
//  MacViewerClient
//

@protocol MVHostStreamConnecting;

@interface MVHostStreamService : NSObject

@property (nonatomic, retain)NSData*        hostAddress;
@property (nonatomic, retain)NSString*      hostName;
@property (nonatomic, assign)id<MVHostStreamConnecting> delegate;

- (id) initWithDelegate:(id)deleagte;
- (ENetworkServiceResult) connectHostForAddressString:(NSString *)addressString withOptions:(NSDictionary *)options;

@end

@protocol MVHostStreamConnecting <NSObject>

- (void) streamService:(MVHostStreamService *)streamService didSuccessfullyConnectWithInputStream:(NSStream *)inputStream outputStream:(NSStream *)outputStream;
- (void) streamService:(MVHostStreamService *)streamService didFailWithError:(NSError *)error;

@end