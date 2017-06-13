//
//  UIImage+Additional.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additional)

-(UIImage*)scaleToSize:(CGSize)size;

- (UIImage *)imageWithRotation:(UIImageOrientation)orientation;

@end
