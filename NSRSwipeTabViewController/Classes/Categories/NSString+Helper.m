//
//  NSString+Helper.m
//  NSRSwipeTabViewController
//
//  Created by Nonthawat Srichad on 5/15/2557 BE.
//  Copyright (c) 2557 Nonthawat Srichad. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (CGSize)sizeFromFont:(UIFont *)font linebreakMode:(NSLineBreakMode)linebreakMode inFrame:(CGRect)rect
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        
        // iOS < 6
        return [self sizeWithFont:font constrainedToSize:rect.size lineBreakMode:linebreakMode];
    } else {
    
        // iOS 7
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:linebreakMode];
        
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        
        CGRect rect = [self boundingRectWithSize: CGSizeMake(0.0f, MAXFLOAT)
                                         options:  NSStringDrawingUsesLineFragmentOrigin
                                      attributes:  attributes
                                         context:  nil];
        return rect.size;
    }
}

@end
