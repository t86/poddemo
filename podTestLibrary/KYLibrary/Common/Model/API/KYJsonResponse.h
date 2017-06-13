//
//  KYJsonResponse.h
//  icfappIOS
//
//  Created by xwzhou on 16/4/11.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KYReqResult;

@interface KYJsonResponse : NSObject

@property (nonatomic, strong) id data;
@property (nonatomic, strong) KYReqResult *reqResult;

//- (id)initWithDictionary:(NSDictionary *)dic;

@end
