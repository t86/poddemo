//
//  KYUpLoadFile.m
//  icfappIOS
//
//  Created by xwzhou on 20/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "KYUpLoadFile.h"

@implementation KYUpLoadFile

-(id)initWithData:(NSData* )fileData mimeType:(HttpRequestUploadMimeType)mimeType{
    
    self=[super init];
    
    if(self){
        
        self.fileData = fileData;
        self.mimeType = mimeType;
    }
    return self;
}
@end
