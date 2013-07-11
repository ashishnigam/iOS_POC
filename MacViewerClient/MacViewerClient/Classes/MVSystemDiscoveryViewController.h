//
//  MVMasterViewController.h
//  MacViewerClient
//

@class MVSystemViewerViewController;

@interface MVSystemDiscoveryViewController : UIViewController

@property (strong, nonatomic) UIView                       *hostInputTextView;
@property (strong, nonatomic) MVSystemViewerViewController *detailViewController;

- (void) startSearchSystem:(id)sender;
@end
