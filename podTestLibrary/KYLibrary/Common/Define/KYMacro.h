//
//  KYMacro.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#define IsIOS8 ([[[UIDevice currentDevice].systemVersion substringToIndex:[[UIDevice currentDevice].systemVersion rangeOfString:@"."].location] intValue] >= 8)

//设备的高和宽
#define SHeight [UIScreen mainScreen].bounds.size.height
#define Swidth [UIScreen mainScreen].bounds.size.width

//屏幕宽扩大比例(iphone6 为标准)
#define kScale [UIScreen mainScreen].bounds.size.width / 375.0
