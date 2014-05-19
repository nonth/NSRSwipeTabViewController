//
//  NSRPageViewController.m
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/19/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import "NSRPageViewController.h"

@interface NSRPageViewController ()

@end

@implementation NSRPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEnableSwipe:(BOOL)enableSwipe
{
    _enableSwipe = enableSwipe;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            [scrollView setScrollEnabled:enableSwipe];
        }
    }
}

@end
