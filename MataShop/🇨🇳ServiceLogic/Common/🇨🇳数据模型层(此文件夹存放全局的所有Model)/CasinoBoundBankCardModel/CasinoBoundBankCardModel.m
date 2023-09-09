//
//  CasinoBoundBankCardModel.m
//  Casino
//
//  Created by Jobs on 2021/12/29.
//

#import "CasinoBoundBankCardModel.h"

@implementation CasinoBoundBankCardModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id"
    };
}

@end
