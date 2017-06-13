//
//  KYErrMsgJson.h
//  icfappIOS
//
//  Created by xwzhou on 16/5/24.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYErrMsgJson : NSObject

@property (nonatomic, strong) NSString *appUICode;
@property (nonatomic, strong) NSString *hint;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
