//
//  MVDetailViewController.h
//  MacViewerClient
//
//  Created by Ashish Nigam on 6/19/13.
//  Copyright (c) 2013 Ashish Nigam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVSystemViewerViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
