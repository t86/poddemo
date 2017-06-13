//
//  KYAlertTool.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/21.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYAlertTool : NSObject <UIAlertViewDelegate>

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                cancelBtnTitle:(NSString *)cancelBtnTitle
                 otherBtnTitle:(NSString *)otherBtnTitle
                   cancelBlock:(void(^)())cancelBlock
                  confirmBlock:(void(^)())confirmBlock;
@end
