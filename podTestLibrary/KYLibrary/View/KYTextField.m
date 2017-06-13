//
//  KYTextField.m
//  icfappIOS
//
//  Created by xwzhou on 16/5/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYTextField.h"

static const CGFloat kPadding = 8;

@implementation KYTextField

#pragma mark - 控制文字左端距离
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + kPadding, bounds.origin.y, bounds.size.width - kPadding, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + kPadding, bounds.origin.y, bounds.size.width - kPadding, bounds.size.height);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + kPadding, bounds.origin.y + self.placeholderYOffset, bounds.size.width - kPadding, bounds.size.height - self.placeholderYOffset);
}

@end
