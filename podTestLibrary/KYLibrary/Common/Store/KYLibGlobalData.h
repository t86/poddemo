//
//  KYLibGlobalData.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

@interface KYLibGlobalData : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSMutableArray *alertTools;

//loadingView的superView
@property (nonatomic, strong) UIView *loadingParentView;

@end
