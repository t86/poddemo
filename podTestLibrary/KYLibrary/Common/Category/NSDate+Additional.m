//
//  NSDate+Additional.m
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "NSDate+Additional.h"

@implementation NSDate (Additional)

- (NSString *)stringWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:self];
}

@end
