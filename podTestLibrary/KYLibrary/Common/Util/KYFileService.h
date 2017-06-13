//
//  KYFileService.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KYFolderTypeCommon,
    KYFolderTypeUser,
} KYFolderType;

@interface KYFileService : NSObject

+ (id)decodeContentFromFileName:(NSString *)fileName type:(KYFolderType)type customId:(long)customId;

+ (BOOL)encodeContent:(id)content toFileName:(NSString *)fileName type:(KYFolderType)type customId:(long)customId;

+ (NSURL *)saveContent:(NSData *)content toFileName:(NSString *)fileName type:(KYFolderType)type customId:(long)customId;

+ (void) createFolderIfNotExistForFile:(NSURL*)pFileName;

+ (NSURL*) pathForResource:(NSString*)pFileName ofType:(NSString*)pType;

+ (NSURL*) document;

+ (NSURL*) library;

+ (NSURL*) cache;

+ (NSURL*) temp;

+ (NSURL *)commonFilePath;

+ (NSURL *)userFilePath:(long)customId;

//保存数据到指定目录下
+ (void)saveData:(NSData*)data toFilePath:(NSString*)fullFilePath;

//保存图片到document的指定文件夹下, 返回保存的路径
+ (NSString *)saveImage:(UIImage *)image folder:(NSString *)folder fileName:(NSString *)fileName;

//保存数据到document的指定文件夹下, 返回保存的路径
+ (NSString *)saveData:(NSData *)data folder:(NSString *)folder fileName:(NSString *)fileName waitUntilDone:(BOOL)wait;

+ (BOOL)fileExistAtPath:(NSString *)filePath;

@end
