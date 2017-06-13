//
//  KYJsonResponse.m
//  icfappIOS
//
//  Created by xwzhou on 16/4/11.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYJsonResponse.h"
#import "KYReqResult.h"
#import "NSDictionary+HSCheckedExtraction.h"

@implementation KYJsonResponse

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.data = [dic objectForKey:@"data"];
        if ([self.data isKindOfClass:[NSNull class]]) {
            self.data = nil;
        }
        
        NSDictionary *dicResult = [dic nonEmptyDictionaryForKey:@"reqResult"];
        if (dicResult) {
            self.reqResult = [[KYReqResult alloc] initWithDictionary:dicResult];
        }
    }
    return self;
}

@end
