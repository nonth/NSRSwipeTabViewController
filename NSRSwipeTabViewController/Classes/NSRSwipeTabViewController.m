//
//  NSRSwipeTabViewController.m
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import "NSRSwipeTabViewController.h"
#import "NSRPageViewController.h"
#import "NSRSwipeTabBar.h"

static CGFloat const NSRSwipeTabBarHeight = 37.0f;

@interface NSRSwipeTabViewController () <NSRSwipeTabBarDelegate, UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) NSRSwipeTabBar *swipeTabBar;
@property (strong, nonatomic) NSRPageViewController *pageViewController;
@property (assign, nonatomic) NSInteger selectedIndex;

- (void)initSubViews;

@end

@implementation NSRSwipeTabViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    [self.parentViewController setEdgesForExtendedLayout:UIRectEdgeNone];
        
    CGRect swipeTabBarFrame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.frame), NSRSwipeTabBarHeight);
    self.swipeTabBar = [[NSRSwipeTabBar alloc] initWithFrame:swipeTabBarFrame];
    [self.swipeTabBar setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth];
    [self.swipeTabBar setDelegate:self];
    [self.swipeTabBar setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
    [self.view addSubview:self.swipeTabBar];
    
    CGRect pageViewControllerFrame = CGRectMake(0.0f,
                                                swipeTabBarFrame.origin.y + swipeTabBarFrame.size.height,
                                                CGRectGetWidth(self.view.frame),
                                                CGRectGetHeight(self.view.frame) - swipeTabBarFrame.size.height);
    self.pageViewController = [[NSRPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageViewController setDelegate:self];
    [self.pageViewController setDataSource:self];
    
    [self.pageViewController.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [self.pageViewController.view setFrame:pageViewControllerFrame];
    [self.pageViewController willMoveToParentViewController:self];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated
{
    UIPageViewControllerNavigationDirection direction;
    
    if (self.selectedIndex < selectedIndex) {
        direction = UIPageViewControllerNavigationDirectionForward;
    } else {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    __weak NSRSwipeTabViewController *weakSelf = self;
    [self.pageViewController setViewControllers:@[[self.viewControllers objectAtIndex:selectedIndex]]
                                      direction:direction
                                       animated:YES
                                     completion:^(BOOL finished) {
                                         if (finished) {
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 [weakSelf.pageViewController setViewControllers:@[[weakSelf.viewControllers objectAtIndex:selectedIndex]]
                                                                                       direction:direction
                                                                                        animated:NO
                                                                                      completion:nil];
                                             });
                                         }
                                     }];
    
    self.selectedIndex = selectedIndex;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    if (_viewControllers != viewControllers) {
        _viewControllers = viewControllers;
        [self.swipeTabBar setItemTitles:[viewControllers valueForKey:@"title"]];
        
        [self.pageViewController setViewControllers:@[[viewControllers firstObject]]
                                          direction:UIPageViewControllerNavigationDirectionForward
                                           animated:NO
                                         completion:nil];
        self.selectedIndex = 0;
        [self.swipeTabBar selectedAtIndex:self.selectedIndex];
    }
}

- (void)setTabBarBackgroundColor:(UIColor *)tabBarBackgroundColor
{
    _tabBarBackgroundColor = tabBarBackgroundColor;
    [self.swipeTabBar setBackgroundColor:tabBarBackgroundColor];
}

- (void)setTabBarIndicatorColor:(UIColor *)tabBarIndicatorColor
{
    _tabBarIndicatorColor = tabBarIndicatorColor;
    [self.swipeTabBar setIndicatorBackgroundColor:tabBarIndicatorColor];
}

- (void)setTabBarFont:(UIFont *)tabBarFont
{
    _tabBarFont = tabBarFont;
    [self.swipeTabBar setFont:tabBarFont];
}

- (void)setTabBarTextColor:(UIColor *)tabBarTextColor
{
    _tabBarTextColor = tabBarTextColor;
    [self.swipeTabBar setTextColor:tabBarTextColor];
}

- (void)setEnableSwipe:(BOOL)enableSwipe
{
    _enableSwipe = enableSwipe;
    [self.pageViewController setEnableSwipe:enableSwipe];
}

#pragma mark -
#pragma mark NSRSwipeTabBar Delegate Methods

- (void)swipeTabBar:(NSRSwipeTabBar *)swipeTabBar didSelectItemAtIndex:(NSInteger)index
{
    [self setSelectedIndex:index animated:YES];
}

#pragma mark -
#pragma mark UIPageViewController Delegate Methods

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *vc = [self.pageViewController.viewControllers firstObject];
    NSInteger index = [self.viewControllers indexOfObject:vc];
    
    self.selectedIndex = index;
    
    [self.swipeTabBar selectedAtIndex:index];
}

#pragma mark -
#pragma mark UIPageViewController DataSource Methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    
    if ([self.viewControllers count] == 0) {
        return nil;
    }
    
    if ((index == 0) || (index == NSNotFound)) {
        return [self.viewControllers lastObject];
    }
    
    index--;
    return [self.viewControllers objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    
    if ([self.viewControllers count] == 0) {
        return nil;
    }
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.viewControllers count]) {
        return [self.viewControllers firstObject];
    }
    return [self.viewControllers objectAtIndex:index];
}

@end
