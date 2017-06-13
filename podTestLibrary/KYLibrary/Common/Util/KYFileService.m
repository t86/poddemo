//
//  KYFileService.m
//  icfappIOS
//
//  Created by xwzhou on 20/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYFileService.h"

#define KImageSuffix_jpeg @"jpeg"
#define KImageSuffix_png @"png"
NSString * const kArchizeFileRootKey = @"Root";

@implementation KYFileService

+ (id)decodeContentFromFileName:(NSString *)fileName type:(KYFolderType)type customId:(long)customId {
    NSURL *filePath = type == KYFolderTypeCommon ? [self commonFilePath] : [self userFilePath:customId];
    if (filePath == nil) {
        return nil;
    }
    filePath = [filePath URLByAppendingPathComponent:fileName];
    
    NSData* data = [[NSData alloc] initWithContentsOfURL:filePath];
    if ([data length] <= 0)
    {
        return nil;
    }
    
    NSKeyedUnarchiver* unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    id content = [unArchiver decodeObjectForKey:kArchizeFileRootKey];
    [unArchiver finishDecoding];
    return content;
}

+ (BOOL)encodeContent:(id)content toFileName:(NSString *)fileName type:(KYFolderType)type customId:(long)customId{
    NSURL *filePath = type == KYFolderTypeCommon ? [self commonFilePath] : [self userFilePath:customId];
    if (filePath == nil) {
        return NO;
    }
    filePath = [filePath URLByAppendingPathComponent:fileName];
    
    NSMutableData* data = [[NSMutableData alloc] init];
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];

    [archiver encodeObject:content forKey:kArchizeFileRootKey];
    [archiver finishEncoding];    

    [KYFileService createFolderIfNotExistForFile:filePath];
    return [data writeToURL:filePath atomically:YES];
}

+ (NSURL *)saveContent:(NSData *)content toFileName:(NSString *)fileName type:(KYFolderType)type customId:(long)customId {
    NSURL *filePath = type == KYFolderTypeCommon ? [self commonFilePath] : [self userFilePath:customId];
    if (filePath == nil) {
        return nil;
    }
    
    filePath = [filePath URLByAppendingPathComponent:fileName];
    [KYFileService createFolderIfNotExistForFile:filePath];
    
    NSError *error;
    BOOL result = [content writeToURL:filePath options:NSDataWritingAtomic error:&error];
    
    if (result == YES) {
        return filePath;
    } else {
        return nil;
    }
}

+ (NSURL *)commonFilePath {
    return [[self document] URLByAppendingPathComponent:@"common"];
}

+ (NSURL *)userFilePath:(long)customId {
    
    return [[self document] URLByAppendingPathComponent:[NSString stringWithFormat:@"user_%ld",customId]];
}

+ (void) createFolderIfNotExistForFile:(NSURL*)pFileName
{
    NSURL* fileFolder = [pFileName URLByDeletingLastPathComponent];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    [fileManager createDirectoryAtPath:fileFolder.path withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (NSURL*) pathForResource:(NSString*)pFileName ofType:(NSString*)pType;
{
    return [[NSBundle mainBundle] URLForResource:pFileName withExtension:pType];
}

+ (NSURL*) document
{
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:NSDocumentDirectory
                                             inDomains:NSUserDomainMask];
    NSURL* dir = nil;

    
    if ([possibleURLs count] >= 1) {
        dir = [possibleURLs objectAtIndex:0];
    }
    return dir;
}

+ (NSURL*) library
{
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:NSLibraryDirectory
                                             inDomains:NSUserDomainMask];
    NSURL* dir = nil;
    
    
    if ([possibleURLs count] >= 1) {
        
        dir = [possibleURLs objectAtIndex:0];
    }
    
    return dir;
}

+ (NSURL*) cache
{
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:NSCachesDirectory
                                             inDomains:NSUserDomainMask];
    NSURL* dir = nil;
    
    
    if ([possibleURLs count] >= 1) {
        
        dir = [possibleURLs objectAtIndex:0];
    }
    
    return dir;
}

+ (NSURL*) temp
{
    return [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES]; 
}

+ (void)saveData:(NSData*)data toFilePath:(NSString*)fullFilePath {
    [self createFolderIfNotExistForFile:[NSURL URLWithString:fullFilePath]];
    
    [data writeToFile:fullFilePath atomically:YES];
}

+ (NSString *)saveImage:(UIImage *)image folder:(NSString *)folder fileName:(NSString *)fileName {
    NSData *imageData;
    if ([fileName.pathExtension isEqualToString:KImageSuffix_jpeg]) {
        imageData = UIImageJPEGRepresentation(image, 1);
    } else if ([fileName.pathExtension isEqualToString:KImageSuffix_png]) {
        imageData = UIImagePNGRepresentation(image);
    } else {
        return nil;
    }
    
    return [self saveData:imageData folder:folder fileName:fileName waitUntilDone:NO];
}

+ (NSString *)saveData:(NSData *)data folder:(NSString *)folder fileName:(NSString *)fileName waitUntilDone:(BOOL)wait {
    NSString *filePath = [[self document] path];
    
    if (folder && [folder isEqualToString:@""] == NO) {
        filePath = [filePath stringByAppendingPathComponent:folder];
    }
    filePath = [filePath stringByAppendingPathComponent:fileName];
    
    if (wait) {
        [self saveData:data toFilePath:filePath];
    } else {
        dispatch_queue_t queue = dispatch_queue_create("saveData", NULL);
        dispatch_async(queue, ^{
            [self saveData:data toFilePath:filePath];
        });
    }
    
    return [folder stringByAppendingPathComponent:fileName];
}

+ (BOOL)fileExistAtPath:(NSString *)filePath {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fullPaht = [docPath stringByAppendingPathComponent:filePath];
    return[[NSFileManager defaultManager] fileExistsAtPath:fullPaht];
}

@end
