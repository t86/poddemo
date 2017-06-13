//
//  KYReqResult.h
//  icfappIOS
//
//  Created by xwzhou on 16/4/11.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYReqResult : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *msg;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
