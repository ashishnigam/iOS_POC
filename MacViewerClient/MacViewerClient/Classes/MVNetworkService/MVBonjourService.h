//
//  MVBonjourService.h
//  MacViewerClient
//

@protocol MVBonjourServiceDelegate;

@interface MVBonjourService : NSObject<NSNetServiceBrowserDelegate, NSNetServiceDelegate>
{
    @private
    NSNetServiceBrowser         *_systemBrowser;
    NSNetService                *_currentResolveService;
}

@property (nonatomic, assign)id<MVBonjourServiceDelegate>       browseDelegate;
@property (nonatomic, retain)NSArray                            *browseServiceList;

- (id) initWithSystemDiscoveryDelegate:(id)delegate;
- (void) searchForSearviceType:(NSString *)searviceType forDomain:(NSString *)domain;
- (void) resolveServiceAtIndex:(NSUInteger)index;

@end

@protocol MVBonjourServiceDelegate <NSObject>

- (void) bonjourBrowseService:(MVBonjourService*)browseService didUpdateWithServiceList:(NSArray*)serviceList;
- (void) bonjourBrowseService:(MVBonjourService*)browseService didFailWithError:(NSDictionary *)error;
- (void) bonjourBrowseService:(MVBonjourService*)browseService didResolveService:(NSNetService *)service;
- (void) bonjourBrowseService:(MVBonjourService*)browseService didNotResolve:(NSDictionary *)errorDict;
@end