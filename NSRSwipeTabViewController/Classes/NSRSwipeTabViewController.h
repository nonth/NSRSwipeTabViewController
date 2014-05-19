//
//  NSRSwipeTabViewController.h
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSRSwipeTabViewController : UIViewController

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) UIColor *tabBarBackgroundColor;
@property (strong, nonatomic) UIColor *tabBarIndicatorColor;
@property (strong, nonatomic) UIFont *tabBarFont;
@property (strong, nonatomic) UIColor *tabBarTextColor;
@property (assign, nonatomic) BOOL enableSwipe;

- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated;
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)setTabBarBackgroundColor:(UIColor *)tabBarBackgroundColor;
- (void)setTabBarIndicatorColor:(UIColor *)tabBarIndicatorColor;
- (void)setTabBarFont:(UIFont *)tabBarFont;
- (void)setTabBarTextColor:(UIColor *)tabBarTextColor;

@end
