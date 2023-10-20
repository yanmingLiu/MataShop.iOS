//
//  YMClearCacheTool.m
//  Industrialbuilder
//
//  Created by lym on 2019/6/26.
//  Copyright © 2019 braspringc. All rights reserved.
//

#import "ClearCacheTool.h"

@implementation ClearCacheTool

/**
 获取缓存大小

 @return M = result/1024/1024
 */
+ (NSString *)getCacheSize {
    //得到缓存路径
    NSString * path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSLog(@"path = %@", path);

    NSInteger pathSize = [self getCacheSizeWithFilePath:path];
    NSInteger imgSize = (CGFloat)[SDImageCache sharedImageCache].totalDiskSize;

    NSLog(@"pathSize----%zd",pathSize);
    NSLog(@"imgSize----%zd", imgSize);

    NSInteger totleSize = pathSize + imgSize;
    NSString *totleStr = nil;
    totleStr = [NSString stringWithFormat:@"%.1fM",totleSize / 1000.00f /1000.00f];
    return totleStr;
}

/**
 清除缓存

 @param callback 回调
 */

+ (void)cleanCacheFinish:(void(^)(void))callback {
    //获取缓存路径
    NSString * path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;

    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
        NSString *filePath = nil;
        NSError *error = nil;
        for (NSString *subPath in subPathArr)
        {
            filePath = [path stringByAppendingPathComponent:subPath];
            //删除子文件夹
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
            if (error) {
                NSLog(@"removeItemAtPath error");
            }
        }

    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        if (callback) {
            callback();
        }
    }];
}


+ (NSInteger)getCacheSizeWithFilePath:(NSString *)path {

    // 获取“path”文件夹下的所有文件
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];

    NSString *filePath  = nil;
    NSInteger totleSize = 0;

    for (NSString *subPath in subPathArr){

        // 1. 拼接每一个文件的全路径
        filePath =[path stringByAppendingPathComponent:subPath];
        // 2. 是否是文件夹，默认不是
        BOOL isDirectory = NO;
        // 3. 判断文件是否存在
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];

        // 4. 以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]){
            // 过滤: 1. 文件夹不存在  2. 过滤文件夹  3. 隐藏文件
            continue;
        }
        // 5. 指定路径，获取这个路径的属性
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        /**
         attributesOfItemAtPath: 文件夹路径
         该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因
         */
        // 6. 获取每一个文件的大小
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        // 7. 计算总大小
        totleSize += size;
    }
    return totleSize;
}


@end
