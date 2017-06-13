//
//  KYErrMsgJson.m
//  icfappIOS
//
//  Created by xwzhou on 16/5/24.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYErrMsgJson.h"
#import "NSDictionary+HSCheckedExtraction.h"

@implementation KYErrMsgJson

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.appUICode = [dic nonEmptyStringForKey:@"appUICode"];
        self.hint = [dic nonEmptyStringForKey:@"hint"];
    }
    return self;
}

@end
