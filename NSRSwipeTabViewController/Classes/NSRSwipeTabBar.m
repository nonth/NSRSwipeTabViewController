//
//  NSRSwipeTabBar.m
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import "NSRSwipeTabBar.h"

static CGFloat const NSRSwipeTabBarItemViewWidth = 100.0f;
static CGFloat const NSRSwipeTabBarItemViewMargin = 30.0f;
static CGFloat const NSRSwipeTabBarIndicatorViewHeight = 2.0f;

@interface NSRSwipeTabBar ()

@property (strong, nonatomic) UIScrollView *scrollView;

- (UIButton *)generateButtonItem:(NSString *)title;
- (UIView *)generateIndicatorView:(CGRect)frame;
- (void)buttonItemOnClicked:(id)sender;

@end

@implementation NSRSwipeTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self.scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.scrollView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:self.scrollView];
        
    }
    return self;
}

#pragma mark -
#pragma mark Setup View Item Methods

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = 0.0f;
    for (UIButton *buttonItem in self.itemViews) {
        CGFloat width = [buttonItem.titleLabel.text sizeWithFontSize:buttonItem.titleLabel.font.pointSize].width;
        width += NSRSwipeTabBarItemViewMargin;
        CGRect frame = CGRectMake(x, 0.0f, width, CGRectGetHeight(self.frame));
        [buttonItem setFrame:frame];
        x += width;
    }
    
    [self.scrollView setContentSize:CGSizeMake(x, CGRectGetHeight(self.scrollView.frame))];
    
    CGRect frame = self.scrollView.frame;
    
    if (CGRectGetWidth(self.frame) > x) {
        frame.origin.x = (CGRectGetWidth(self.frame) - x) / 2.0f;
        frame.size.width = x;
    } else {
        frame.origin.x = 0.0f;
        frame.size.width = CGRectGetWidth(self.frame);
    }
    
    [self.scrollView setFrame:frame];
}

- (void)setItemTitles:(NSArray *)itemTitles
{
    NSMutableArray *itemViews = [[NSMutableArray alloc] init];
    
    for (NSString *title in itemTitles) {
        UIButton *buttonItem = [self generateButtonItem:title];
        [itemViews addObject:buttonItem];
        [self.scrollView addSubview:buttonItem];
    }
    self.itemViews = itemViews;
    [self layoutSubviews];
}

- (UIButton *)generateButtonItem:(NSString *)title
{
    CGRect frame = CGRectMake(0.0f, 0.0f, NSRSwipeTabBarItemViewWidth, CGRectGetHeight(self.frame));
    UIFont *textFont = (self.font)? self.font : [UIFont systemFontOfSize:12.0f];
    UIColor *textColor = (self.textColor)? self.textColor : [UIColor blackColor];
    
    UIButton *buttonItem = [[UIButton alloc] initWithFrame:frame];
    [buttonItem setTitle:title forState:UIControlStateNormal];
    [buttonItem.titleLabel setFont:textFont];
    [buttonItem setTitleColor:textColor forState:UIControlStateNormal];
    [buttonItem addTarget:self action:@selector(buttonItemOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *indicatorView = [self generateIndicatorView:frame];
    [buttonItem addSubview:indicatorView];
    
    return buttonItem;
}

- (UIView *)generateIndicatorView:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, NSRSwipeTabBarIndicatorViewHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    return view;
}

#pragma mark -
#pragma mark Event Handler Methods

- (void)buttonItemOnClicked:(id)sender
{
    for (UIButton *button in self.itemViews) {
        [[button.subviews lastObject] setBackgroundColor:[UIColor clearColor]];
    }
    
    UIColor *color = (self.indicatorBackgroundColor)? self.indicatorBackgroundColor : [UIColor redColor];
    
    [[((UIButton *)sender).subviews lastObject] setBackgroundColor:color];
    
    if ([self.delegate respondsToSelector:@selector(swipeTabBar:didSelectItemAtIndex:)]) {
        [self.delegate swipeTabBar:self didSelectItemAtIndex:[self.itemViews indexOfObject:sender]];
    }
}

#pragma mark -
#pragma mark Helper Methods

- (void)selectedAtIndex:(NSUInteger)index
{
    for (UIButton *button in self.itemViews) {
        [[button.subviews lastObject] setBackgroundColor:[UIColor clearColor]];
    }
    
    UIColor *color = (self.indicatorBackgroundColor)? self.indicatorBackgroundColor : [UIColor redColor];
    
    [[((UIButton *)[self.itemViews objectAtIndex:index]).subviews lastObject] setBackgroundColor:color];
}

@end
