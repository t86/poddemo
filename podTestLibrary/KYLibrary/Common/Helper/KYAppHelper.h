//
//  KYAppHelper.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYAppHelper : NSObject

+ (NSString*) bundleID;

+ (NSString *)appVersion;

+ (NSString *)appShortVersion;

+ (BOOL)isAppUpdate;

@end
