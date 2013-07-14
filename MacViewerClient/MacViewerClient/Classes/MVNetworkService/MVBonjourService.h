//
//  MVBonjourService.h
//  MacViewerClient
//

@protocol MVBonjourServiceDelegate;

@interface MVBonjourService : NSObject<NSNetServiceBrowserDelegate>
{
    @private
    NSNetServiceBrowser         *_systemBrowser;
}

@property (nonatomic, assign)id<MVBonjourServiceDelegate>       browseDelegate;
@property (nonatomic, retain)NSArray                            *browseServiceList;

- (id) initWithSystemDiscoveryDelegate:(id)delegate;
- (void) searchForSearviceType:(NSString *)searviceType forDomain:(NSString *)domain;

@end

@protocol MVBonjourServiceDelegate <NSObject>

- (void) bonjourBrowseService:(MVBonjourService*)browseService didUpdateWithServiceList:(NSArray*)serviceList;
- (void) bonjourBrowseService:(MVBonjourService*)browseService didFailWithError:(NSDictionary *)error;
@end