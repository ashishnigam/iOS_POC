//
//  MVBonjourService.m
//  MacViewerClient
//

#import "MVBonjourService.h"

@interface MVBonjourService () 

@property (nonatomic, retain)NSNetServiceBrowser         *systemBrowser;
@property (nonatomic, retain)NSNetService                *currentResolveService;;

@end

@implementation MVBonjourService
@synthesize browseDelegate;
@synthesize browseServiceList;
@synthesize systemBrowser = _systemBrowser;
@synthesize currentResolveService = _currentResolveService;

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
    self.browseDelegate = nil;
    _ReleaseObjectWithCheck(_currentResolveService);
    _ReleaseObject(_systemBrowser);
    [super dealloc];
}

#pragma mark - Search Service SECTION

- (void) searchForSearviceType:(NSString *)searviceType forDomain:(NSString *)domain
{
    [_systemBrowser stop];
    self.browseServiceList = nil;
    if([searviceType rangeOfString:@"_tcp"].length > 0)
    {
        [_systemBrowser searchForServicesOfType:searviceType inDomain:domain];
    }
}

#pragma mark - Resolve Service Address

- (void) resolveServiceAtIndex:(NSUInteger)index
{
    [self.currentResolveService stop];
    self.currentResolveService = nil;
    
    self.currentResolveService = [self.browseServiceList objectAtIndex:index];
    [self.currentResolveService setDelegate:self];
    [self.currentResolveService resolveWithTimeout:SERVICE_RESOLVE_TIMEOUT];
    
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

#pragma mark - Net Service Delegate

- (void)netServiceDidResolveAddress:(NSNetService *)sender
{
    if([self.browseDelegate conformsToProtocol:@protocol(MVBonjourServiceDelegate)])
        [self.browseDelegate bonjourBrowseService:self didResolveService:sender];
}

- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict
{
    if([self.browseDelegate conformsToProtocol:@protocol(MVBonjourServiceDelegate)])
        [self.browseDelegate bonjourBrowseService:self didFailWithError:errorDict];
}
@end
