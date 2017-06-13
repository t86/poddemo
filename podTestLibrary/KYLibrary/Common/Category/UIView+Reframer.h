//
//  UIView+Reframer.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reframer.h"


@interface UIView (Reframer)

- (Reframer*)rf_reframer;

-(UIViewController *)getRootViewController;

@end
