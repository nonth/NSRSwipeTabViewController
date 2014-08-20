//
//  NSRViewController.m
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import "NSRViewController.h"

@interface NSRViewController ()

@property (strong, nonatomic) NSRSwipeTabViewController *swipeTabViewController;

@end

@implementation NSRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    self.swipeTabViewController = [[NSRSwipeTabViewController alloc] init];
    [self.swipeTabViewController setDelegate:self];
    
//    Uncomment to customize NSRSwipeTabViewController
//    [self.swipeTabViewcontainerViewroller setTabBarItemMargin:10.0f];
//    [self.swipeTabViewController setEnableSwipe:NO];
//    [self.swipeTabViewController setTabBarFont:[UIFont boldSystemFontOfSize:18.0f]];
//    [self.swipeTabViewController setTabBarBackgroundColor:[UIColor blackColor]];
//    [self.swipeTabViewController setTabBarTextColor:[UIColor whiteColor]];
//    [self.swipeTabViewController setTabBarIndicatorColor:[UIColor greenColor]];
    
    [self.swipeTabViewController willMoveToParentViewController:self];
    [self.swipeTabViewController.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.swipeTabViewController.view setFrame:self.view.bounds];
    [self.view addSubview:self.swipeTabViewController.view];
    [self.swipeTabViewController didMoveToParentViewController:self];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    [vc1.view setBackgroundColor:[UIColor redColor]];
    vc1.title = @"MENU 1";
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    [vc2.view setBackgroundColor:[UIColor greenColor]];
    vc2.title = @"MENU 2";
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    [vc3.view setBackgroundColor:[UIColor blueColor]];
    vc3.title = @"MENU 3";
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    [vc4.view setBackgroundColor:[UIColor yellowColor]];
    vc4.title = @"MENU 4";
    
    UITableViewController *tbv = [[UITableViewController alloc] init];
    tbv.title = @"MENU 5";
    
    self.swipeTabViewController.viewControllers = @[vc1, vc2, vc3, vc4, tbv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark NSRSwipeTabViewContorller Delegate Methods

- (void)swipeTabViewController:(NSRSwipeTabViewController *)swipeTabViewController didTransitionToViewController:(UIViewController *)viewController
{
    NSLog(@"transition to vc: %@", viewController);
}

@end
