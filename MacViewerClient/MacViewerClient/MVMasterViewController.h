//
//  MVMasterViewController.h
//  MacViewerClient
//
//  Created by Ashish Nigam on 6/19/13.
//  Copyright (c) 2013 Ashish Nigam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MVDetailViewController;

@interface MVMasterViewController : UITableViewController

@property (strong, nonatomic) MVDetailViewController *detailViewController;

@end
