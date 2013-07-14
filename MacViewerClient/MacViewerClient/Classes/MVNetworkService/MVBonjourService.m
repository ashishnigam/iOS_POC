//
//  MVBonjourService.m
//  MacViewerClient
//

#import "MVBonjourService.h"

@implementation MVBonjourService
@synthesize browseDelegate;
@synthesize browseServiceList;

#pragma mark - OBJECT LIFE CYCLE

- (id) initWithSystemDiscoveryDelegate:(id)delegate
{
    self = [super init];
    //initliaze the instance varaible.
    _systemBrowser = [[NSNetServiceBrowser alloc] init];
    _systemBrowser.delegate = self;
    self.browseDelegate = delegate;
    
    return self;
}

- (void) dealloc
{
    self.browseServiceList = nil;
    
    _ReleaseObject(_systemBrowser);
    [super dealloc];
}

#pragma mark - Search Service SECTION

- (void) searchForSearviceType:(NSString *)searviceType forDomain:(NSString *)domain
{
    if([searviceType rangeOfString:@"_tcp"].length > 0)
    {
        [_systemBrowser searchForServicesOfType:searviceType inDomain:domain];
    }
}

#pragma mark - Search Service DELEGATE

- (void)netServiceBrowserWillSearch:(NSNetServiceBrowser *)aNetServiceBrowser
{
    
}

- (void)netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)aNetServiceBrowser
{
    
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didNotSearch:(NSDictionary *)errorDict
{
    if([self.browseDelegate conformsToProtocol:@protocol(MVBonjourServiceDelegate)])
        [self.browseDelegate bonjourBrowseService:self didFailWithError:errorDict];
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindService:(NSNetService *)aNetService moreComing:(BOOL)moreComing
{
    NSMutableArray *serviceList = [[NSMutableArray alloc] initWithArray:self.browseServiceList];
    [serviceList addObject:aNetService];
    self.browseServiceList = [NSArray arrayWithArray:serviceList];
    if([self.browseDelegate conformsToProtocol:@protocol(MVBonjourServiceDelegate)])
        [self.browseDelegate bonjourBrowseService:self didUpdateWithServiceList:self.browseServiceList];
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing
{
    NSMutableArray *serviceList = [[NSMutableArray alloc] initWithArray:self.browseServiceList];
    [serviceList removeObject:aNetService];
    self.browseServiceList = [NSArray arrayWithArray:serviceList];
    if([self.browseDelegate conformsToProtocol:@protocol(MVBonjourServiceDelegate)])
        [self.browseDelegate bonjourBrowseService:self didUpdateWithServiceList:self.browseServiceList];
}

@end
