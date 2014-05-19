NSRSwipeTabViewController
=========================

iOS SwipeTabViewController inspired by scrollable Tabs in Android

![NSRSwipeTabViewController Screenshot](https://raw.githubusercontent.com/nonth/NSRSwipeTabViewController/master/screenshot.png "NSRSwipeTabViewController Screenshot")

## Requirements

* iOS 7.0 or higher
* ARC

## Installation

### CocoaPods

Since we are not in CocoaPods's repository. but you can install by adding the following line to your Podfile.

```
pod 'NSRSwipeTabViewController', :git => 'https://github.com/nonth/NSRSwipeTabViewController.git'
```

Install into your Xcode project:

``` bash
$ pod install
```

### Manual Install

Add all files in `NSRSwipeTabViewController/Classes/` into your project, and import headers in your source files `#import "NSRSwipeTabViewController.h"`

## Example Usage

``` objective-c

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.swipeTabViewController = [[NSRSwipeTabViewController alloc] init];

    [self.swipeTabViewController willMoveToParentViewController:self];
    [self.swipeTabViewController.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.swipeTabViewController.view setFrame:self.view.frame];
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

```

## Customization

You can customize the following properties of `NSRSwipeTabViewController`

``` objective-c

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) UIColor *tabBarBackgroundColor;
@property (strong, nonatomic) UIColor *tabBarIndicatorColor;
@property (strong, nonatomic) UIFont *tabBarFont;
@property (strong, nonatomic) UIColor *tabBarTextColor;
@property (assign, nonatomic) CGFloat tabBarItemMargin;
@property (assign, nonatomic) BOOL enableSwipe;

```

## Contact

Developed by Nonthawat Srichad

- https://github.com/nonth
- https://twitter.com/nonth

## License

The MIT License (MIT)

Copyright (c) 2014 Nonthawat Srichad

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE
