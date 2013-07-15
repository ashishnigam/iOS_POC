//
//  MVMasterViewController.m
//  MacViewerClient
//

#import "MVBonjourService.h"
#import "MVSystemDiscoveryViewController.h"
#import "MVSystemViewerViewController.h"

#define IPInputTextViewHeight         44u
#define IPInputTextFieldHeight        30u

@interface MVSystemDiscoveryViewController ()<MVBonjourServiceDelegate>

@property (nonatomic, retain)MVBonjourService           *bonjurService;
- (void) addNavigationBarButton;

@end

@implementation MVSystemDiscoveryViewController

@synthesize bonjurService;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self addNavigationBarButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  Dynamic UI

- (void) addNavigationBarButton
{
    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(startSearchSystem:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
}

#pragma mark - 
#pragma mark Event Handling
- (void) startSearchSystem:(id)sender
{
    
}

#pragma mark - Table View
#pragma mark TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }

    return cell;
}

#pragma mark TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - Bonjour Service Delegates
- (void) bonjourBrowseService:(MVBonjourService*)browseService didUpdateWithServiceList:(NSArray*)serviceList
{
    
}
- (void) bonjourBrowseService:(MVBonjourService*)browseService didFailWithError:(NSDictionary *)error
{
    
}

- (void) bonjourBrowseService:(MVBonjourService*)browseService didResolveService:(NSNetService *)service
{
    
}
- (void) bonjourBrowseService:(MVBonjourService*)browseService didNotResolve:(NSDictionary *)errorDict
{
    
}

@end
