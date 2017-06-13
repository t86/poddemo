//
//  KYAppHelper.m
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYAppHelper.h"

@implementation KYAppHelper

+ (NSString*) bundleID
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)appShortVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (BOOL)isAppUpdate{
    static NSInteger isUpdate = -1; //-1代表未做过判断
    if (isUpdate == -1) {
        NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        NSString* defaultVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastVersion"];
        
        if(![currentVersion isEqualToString:defaultVersion]){
            
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"lastVersion"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            isUpdate = 1;
        } else {
            isUpdate = 0;
        }
    }
    return isUpdate;
}

@end
