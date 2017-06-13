//
//  KYAlertTool.m
//  icfappIOS
//
//  Created by xwzhou on 16/3/21.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYAlertTool.h"
#import "KYLibGlobalData.h"
#import "KYMacro.h"

typedef void(^CancelBlock)();
typedef void(^ConfirmBlock)();

@interface KYAlertTool () {
    CancelBlock _cancel;
    ConfirmBlock _confirm;
}

@property (nonatomic, strong) UIWindow *alertWindow;

@end

@implementation KYAlertTool

- (id)init {
    self =[super init];
    if (self) {
        [[KYLibGlobalData sharedInstance].alertTools addObject:self];
    }
    return self;
}

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                cancelBtnTitle:(NSString *)cancelBtnTitle
                 otherBtnTitle:(NSString *)otherBtnTitle
                   cancelBlock:(void (^)())cancelBlock
                  confirmBlock:(void (^)())confirmBlock {
    _cancel = cancelBlock;
    _confirm = confirmBlock;
    
    if (IsIOS8) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        if (cancelBtnTitle) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                self.alertWindow.hidden = YES;
                if (_cancel) {
                    _cancel();
                    _cancel = nil;
                }
                [[KYLibGlobalData sharedInstance].alertTools removeObject:self];
            }];
            [alert addAction:cancelAction];
        }
        
        if (otherBtnTitle) {
            UIAlertAction *confirmAction =[UIAlertAction actionWithTitle:otherBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.alertWindow.hidden = YES;
                if (_confirm) {
                    _confirm();
                    _confirm = nil;
                }
                [[KYLibGlobalData sharedInstance].alertTools removeObject:self];
            }];
            [alert addAction:confirmAction];
        }

        
        if (self.alertWindow == nil) {
            UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            [window setBackgroundColor:[UIColor clearColor]];
            UIViewController*rootViewController = [[UIViewController alloc] init];
            [[rootViewController view] setBackgroundColor:[UIColor clearColor]];
            [window setRootViewController:rootViewController];
            [window setWindowLevel:UIWindowLevelAlert + 1];
            self.alertWindow = window;
        }
        
        [self.alertWindow makeKeyAndVisible];
        [self.alertWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelBtnTitle otherButtonTitles:otherBtnTitle, nil];
        [alert show];
    }
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) { //两个按钮其中一个为nil，则buttonIndex始终为0
        if (_cancel) {
            _cancel();
            _cancel = nil;
        } else if (_confirm) {
            _confirm();
            _confirm = nil;
        }
        [[KYLibGlobalData sharedInstance].alertTools removeObject:self];
    } else {
        if (_confirm) {
            _confirm();
            _confirm = nil;
        }
        [[KYLibGlobalData sharedInstance].alertTools removeObject:self];
    }
}

@end
