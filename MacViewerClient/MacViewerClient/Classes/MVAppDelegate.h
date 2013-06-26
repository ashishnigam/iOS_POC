//
//  MVAppDelegate.h
//  MacViewerClient
//
//  Created by Ashish Nigam on 6/19/13.
//  Copyright (c) 2013 Ashish Nigam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@end
