//
//  UIView+Reframer.m
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "UIView+Reframer.h"

@implementation UIView (Reframer)

- (Reframer*)rf_reframer
{
    return [[Reframer alloc] initWithView:self];
}

/**
 *	@brief	获取UIView所在的视图控制器
 *
 *	@return	根视图控制器
 */
-(UIViewController *)getRootViewController

{
    for (UIView *next=[self superview]; next; next=next.superview) {
        UIResponder *nextResponder=[next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
