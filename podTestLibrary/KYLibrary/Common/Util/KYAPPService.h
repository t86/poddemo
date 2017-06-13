//
//  KYAPPService.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYAPPService : NSObject

+ (instancetype)sharedInstance;

//获取APP Store上应用的版本信息
- (NSString*)getAppStoreVersion;

//打开APP Store连接
- (NSString*)trackViewUrl;

@end
