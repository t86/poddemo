//
//  KYCoreAnimationEffect.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface KYCoreAnimationEffect : NSObject

/**
 *   @brief 快速构建一个你自定义的动画,有以下参数供你设置.
 *
 *   @note  调用系统预置Type需要在调用类引入下句
 *
 *          #import <QuartzCore/QuartzCore.h>
 *
 *   @param type                动画过渡类型
 *   @param subType             动画过渡方向(子类型)
 *   @param duration            动画持续时间
 *   @param timingFunction      动画定时函数属性
 *   @param theView             需要添加动画的view.
 *
 *
 */

+ (void)showAnimationType:(NSString *)type
              withSubType:(NSString *)subType
                 duration:(CFTimeInterval)duration
           timingFunction:(NSString *)timingFunction
                     view:(UIView *)theView;

#pragma mark - Preset Animation

/**
 *  下面是一些常用的动画效果
 */

// reveal
+ (void)animationRevealFromBottom:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationRevealFromTop:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationRevealFromLeft:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationRevealFromRight:(UIView *)view duration:(CFTimeInterval)duration;

// 渐隐渐消
+ (void)animationEaseIn:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationEaseOut:(UIView *)view duration:(CFTimeInterval)duration;

// 翻转
+ (void)animationFlipFromLeft:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationFlipFromRigh:(UIView *)view duration:(CFTimeInterval)duration;

// 翻页
+ (void)animationCurlUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationCurlDown:(UIView *)view duration:(CFTimeInterval)duration;

// push
+ (void)animationPushUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationPushDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationPushLeft:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationPushRight:(UIView *)view duration:(CFTimeInterval)duration;

// move
+ (void)animationMoveUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveLeft:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveRight:(UIView *)view duration:(CFTimeInterval)duration;




// 旋转缩放

// 各种旋转缩放效果
+ (void)animationRotateAndScaleEffects:(UIView *)view duration:(CFTimeInterval)duration;

// 旋转同时缩小放大效果
+ (void)animationRotateAndScaleDownUp:(UIView *)view duration:(CFTimeInterval)duration;

//缩放

+(void)animationRotate:(UIView *)view duration:(CFTimeInterval)duration;

#pragma mark - Private API

/**
 *  下面动画里用到的某些属性在当前API里是不合法的,但是也可以用.
 */

+ (void)animationFlipFromTop:(UIView *)view;
+ (void)animationFlipFromBottom:(UIView *)view;

+ (void)animationCubeFromLeft:(UIView *)view;
+ (void)animationCubeFromRight:(UIView *)view;
+ (void)animationCubeFromTop:(UIView *)view;
+ (void)animationCubeFromBottom:(UIView *)view;

+ (void)animationSuckEffect:(UIView *)view;

+ (void)animationRippleEffect:(UIView *)view;

+ (void)animationCameraOpen:(UIView *)view;
+ (void)animationCameraClose:(UIView *)view;

@end
