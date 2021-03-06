//
//  NSRSwipeTabViewController.h
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSRSwipeTabViewController;

@protocol NSRSwipeTabViewControllerDelegate <NSObject>

- (void)swipeTabViewController:(NSRSwipeTabViewController *)swipeTabViewController didTransitionToViewController:(UIViewController *)viewController;

@end

@interface NSRSwipeTabViewController : UIViewController

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) UIColor *tabBarBackgroundColor;
@property (strong, nonatomic) UIColor *tabBarIndicatorColor;
@property (assign, nonatomic) CGFloat tabBarIndicatorHeight;
@property (strong, nonatomic) UIFont *tabBarFont;
@property (strong, nonatomic) UIColor *tabBarTextColor;
@property (assign, nonatomic) CGFloat tabBarItemMargin;
@property (assign, nonatomic) BOOL enableSwipe;
@property (strong, nonatomic) id<NSRSwipeTabViewControllerDelegate> delegate;

- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated;
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)setTabBarBackgroundColor:(UIColor *)tabBarBackgroundColor;
- (void)setTabBarIndicatorHeight:(CGFloat)height;
- (void)setTabBarIndicatorColor:(UIColor *)tabBarIndicatorColor;
- (void)setTabBarFont:(UIFont *)tabBarFont;
- (void)setTabBarTextColor:(UIColor *)tabBarTextColor;
- (void)setTabBarItemMargin:(CGFloat)tabBarItemMargin;
- (void)setEnableSwipe:(BOOL)enableSwipe;

@end
