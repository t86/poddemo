//
//  KYSlider.m
//  icfappIOS
//
//  Created by xwzhou on 2017/3/21.
//  Copyright © 2017年 kaiyuandao. All rights reserved.
//

#import "KYSlider.h"

@implementation KYSlider

- (CGRect)trackRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x, 10, bounds.size.width, 10);
}

@end
