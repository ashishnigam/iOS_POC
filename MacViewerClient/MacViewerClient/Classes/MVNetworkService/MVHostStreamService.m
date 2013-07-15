//
//  MVHostStreamService.m
//  MacViewerClient
//

#import "MVHostStreamService.h"

@implementation MVHostStreamService

- (id) init
{
    self = [super init];
    
    return self;
}

- (ENetworkServiceResult) connectHostForServerString:(NSString *)serverString withOptions:(NSDictionary *)options
{
    NSRange separator = [serverString rangeOfString:@":" options:NSBackwardsSearch];
    NSInteger port;
	NSString *hostname;
    if(separator.location != NSNotFound)
    {
        hostname = [serverString substringToIndex:separator.location];
		port = [[serverString substringFromIndex:separator.location + separator.length] integerValue];
        if (port <= 0 || port >= MAX_PORT_VALUE) {
			return E_NETWORK_INVALID_PORT;
		}
    }
    else
    {
        hostname = serverString;
        port = DEFAULT_PORT;
    }
    
    return E_NETWORK_CONNECTING;
}

@end
