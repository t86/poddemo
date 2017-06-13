//
//  KYReqResult.m
//  icfappIOS
//
//  Created by xwzhou on 16/4/11.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYReqResult.h"
#import "NSDictionary+HSCheckedExtraction.h"

@implementation KYReqResult

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.code = [dic numberForKey:@"code"].integerValue;
        self.msg = [dic nonEmptyStringForKey:@"msg"];
    }
    return self;
}

@end
