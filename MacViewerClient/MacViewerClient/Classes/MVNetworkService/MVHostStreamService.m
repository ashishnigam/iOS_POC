//
//  MVHostStreamService.m
//  MacViewerClient
//
#include <sys/types.h>
#include <sys/socket.h>
#import <netdb.h>

#include <CFNetwork/CFNetwork.h>
#import "MVHostStreamService.h"

@interface MVHostStreamService ()

@property (nonatomic, assign, readwrite) CFHostRef      host;

@end

@implementation MVHostStreamService

@synthesize delegate;
@synthesize hostAddress;
@synthesize hostName;

- (id) initWithDelegate:(id)deleagte
{
    self = [super init];
    self.delegate = deleagte;
    return self;
}

- (void) dealloc
{
    CFRelease(self.host);
    
    self.delegate = nil;
    self.hostAddress = nil;
    self.hostName = nil;
    self.host = nil;
    [super dealloc];
}

- (ENetworkServiceResult) connectHostForAddressString:(NSString *)addressString withOptions:(NSDictionary *)options
{
    assert(addressString == nil);
    CFHostRef   host;
    
    host = CFHostCreateWithName(NULL, (CFStringRef)addressString);
    if(host != nil){
        self.host = host;
        CFRetain(self.host);
        self.hostName = addressString;
    }
    else{
        int                 err;
        struct addrinfo     *result;
        struct addrinfo     addressTemplete;
        
        memset(&addressTemplete, 0, sizeof(addressTemplete));
        addressTemplete.ai_flags = AI_NUMERICHOST;
        err = getaddrinfo([addressString UTF8String], NULL, &addressTemplete, &result);
        if(err == 0){
            NSData* address = [NSData dataWithBytes:result->ai_addr length:result->ai_addrlen];
            freeaddrinfo(result);
            if(address != nil){
                host = CFHostCreateWithAddress(NULL, (CFDataRef) address);
                self.hostAddress = address;
                self.host = host;
                CFRetain(host);
            }
            else{
                return E_NETWORK_INVALID_IP;
            }
        }
    }
    return E_NETWORK_CONNECTING;
}

@end
