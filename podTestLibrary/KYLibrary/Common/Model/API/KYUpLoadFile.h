//
//  KYUpLoadFile.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYUpLoadFile : NSObject

typedef enum {
    HttpRequestUploadMimeTypeImage, //图片类型
    HttpRequestUploadMimeTypeVideo,//视频类型
    HttpRequestUploadMimeTypeNone//未知类型
} HttpRequestUploadMimeType;

@property (nonatomic, strong) NSData* fileData;
@property (nonatomic, assign) HttpRequestUploadMimeType mimeType;

-(id)initWithData:(NSData* )fileData mimeType:(HttpRequestUploadMimeType)mimeType;

@end
