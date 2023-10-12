//
//  BaiShaETProjUserInfoModel.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import "BaiShaETProjUserInfoModel.h"

@implementation BaiShaETProjUserInfoModel
#pragma mark —— NSCoding
/// 解档
- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        self.phone = [decoder decodeObjectForKey:@"phone"];
        for (NSString *key in printPropertyListByClass(BaiShaETProjUserInfoModel.class)) {
            if ([self respondsToSelector:NSSelectorFromString(key)]) {
                NSString *value = [decoder decodeObjectForKey:key];
                if (value) {
                    [self setValue:value forKey:key];
                }
            }
        }
    }return self;
}
/// 归档
-(void)encodeWithCoder:(NSCoder *)encoder{
    [super encodeWithCoder:encoder];
//    [encoder encodeObject:self.phone forKey:@"phone"];
    NSLog(@"printPropertyListByClass = %@",printPropertyListByClass(BaiShaETProjUserInfoModel.class));
    for (NSString *key in printPropertyListByClass(BaiShaETProjUserInfoModel.class)) {
        // 检查是否实现了协议中的属性对应的setter方法
        NSLog(@"key.jobsCapitalCaseString = %@",[NSString stringWithFormat:@"set%@:", key.jobsCapitalCaseString]);
        NSLog(@"key = %@",key);
        if ([self respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"set%@:", key.jobsCapitalCaseString])]) {
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
}

//-(void)encodeWithCoder0:(NSCoder *)encoder {
//    [encoder encodeObject:self.phone forKey:@"phone"];
//    // 继续为其他属性编码
//}

//-(instancetype)initWithCoder:(NSCoder *)decoder {
//    if (self = [super init]) {
//        self.userName = [decoder decodeObjectForKey:@"userName"];
//        // 继续为其他属性解码
//    }return self;
//}
#pragma mark —— NSSecureCoding
/**
 方法的目的是告诉系统该类是否支持安全编码（NSSecureCoding）。
 通常情况下，为了确保数据的安全性，特别是在跨应用程序或跨设备之间传输数据时，您应该将其设置为 YES。这样可以确保在归档和解档过程中，只有指定的类可以被解档，从而防止潜在的安全风险。
 */
+ (BOOL)supportsSecureCoding {
    return YES;
}
@end
