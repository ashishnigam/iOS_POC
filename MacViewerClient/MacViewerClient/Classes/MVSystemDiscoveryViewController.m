//
//  MVMasterViewController.m
//  MacViewerClient
//

#import "MVConstant/MVDefines.h"
#import "MVSystemDiscoveryViewController.h"
#import "MVSystemViewerViewController.h"

#define IPInputTextViewHeight         44u
#define IPInputTextFieldHeight        30u

@interface MVSystemDiscoveryViewController () {
    
}
@end

@implementation MVSystemDiscoveryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
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

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertHostInputTextView:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertHostInputTextView:(id)sender
{
    if (!self.hostInputTextView) {
        CGRect bound = _viewBound();
        UIView* hostInputTextView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_ORIGIN_X, SCREEN_ORIGIN_Y, bound.size.width, IPInputTextViewHeight)];
        bound.origin.x = 10;
        bound.origin.y = 7;
        bound.size.width -= 40;
        UITextField* IPInputTextField = [[UITextField alloc] initWithFrame:CGRectMake(bound.origin.x, bound.origin.y, bound.size.width, IPInputTextFieldHeight)];
        IPInputTextField.borderStyle = UITextBorderStyleRoundedRect;
        [hostInputTextView addSubview:IPInputTextField];
        hostInputTextView.backgroundColor = [UIColor blackColor];
        hostInputTextView.opaque = true;
        [self.view addSubview:hostInputTextView];
        [self setHostInputTextView:hostInputTextView];
        [hostInputTextView release];
        [IPInputTextField release];
       
    }
}

#pragma mark - Table View

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
