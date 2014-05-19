//
//  NSRSwipeTabBar.h
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Helper.h"

@class NSRSwipeTabBar;

@protocol NSRSwipeTabBarDelegate <NSObject>

- (void)swipeTabBar:(NSRSwipeTabBar *)swipeTabBar didSelectItemAtIndex:(NSInteger)index;

@end

@interface NSRSwipeTabBar : UIView

@property (strong, nonatomic) id<NSRSwipeTabBarDelegate> delegate;
@property (strong, nonatomic) NSArray *itemViews;
@property (strong, nonatomic) UIColor *indicatorBackgroundColor;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIFont *font;
@property (assign, nonatomic) CGFloat itemMargin;

- (void)setItemTitles:(NSArray *)itemTitles;
- (void)selectedAtIndex:(NSUInteger)index;

@end
