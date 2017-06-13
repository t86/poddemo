//
//  KYLibGlobalData.m
//  icfappIOS
//
//  Created by xwzhou on 20/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYLibGlobalData.h"

static KYLibGlobalData *instance;

@implementation KYLibGlobalData

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _alertTools = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
