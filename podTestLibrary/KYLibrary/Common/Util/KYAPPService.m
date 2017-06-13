//
//  KYAPPService.m
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYAPPService.h"


#define appStoreAppId @"1221777915"


@interface KYAPPService ()

@property (nonatomic, strong) NSDictionary *appStoteInfo;

@end

@implementation KYAPPService

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSString*)getAppStoreVersion{
    if (self.appStoteInfo == nil) {
        return nil;
    }
    
    NSString *lastVersion = [self.appStoteInfo objectForKey:@"version"];
    
    return lastVersion;
}

- (NSString*)trackViewUrl{
    if (self.appStoteInfo == nil) {
        return nil;
    }
    
    NSString *trackViewUrl = [self.appStoteInfo objectForKey:@"trackViewUrl"];
    
    return trackViewUrl;
}

- (NSDictionary *)appStoteInfo {
    if (_appStoteInfo) {
        return _appStoteInfo;
    }
    
    NSData* appData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@", appStoreAppId]]];
    
    if (appData == nil) {
        return nil;
    }
    
    NSError *error = nil;
    NSDictionary* appVersionInfoDic = [NSJSONSerialization JSONObjectWithData:appData options:0 error:&error];
    
    if (error != nil || appVersionInfoDic == nil) {
        return nil;
    }
    
    NSArray *infoArray = [appVersionInfoDic objectForKey:@"results"];
    
    if (infoArray == nil || infoArray.count == 0) {
        return nil;
    }
    
    _appStoteInfo = [infoArray objectAtIndex:0];
    
    return _appStoteInfo;
}

@end
