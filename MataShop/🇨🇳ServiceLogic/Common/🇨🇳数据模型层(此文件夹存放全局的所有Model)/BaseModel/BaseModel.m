//
//  BaseModel.m
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "BaseModel.h"

@implementation BaseModel
/// 重定向到自定义的属性字段名
//+(NSDictionary *)mj_replacedKeyFromPropertyName{
//    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
//    return @{
//        @"ID" : @"id",
//        @"childMutArr":@"child"
//    };
//}
//
//+(NSDictionary *)mj_objectClassInArray{
//    return @{
//        @"childMutArr" : MKChildCommentModel.class,//childMutArr为真实的或者自定义的属性字段名
//    };
//}

//@property(nonatomic,strong)NSString *headImage;
//@property(nonatomic,strong)NSURL *headImage;
//- (id)mj_newValueFromOldValue:(id)oldValue
//                     property:(MJProperty *)property{
//    if ([property.name isEqualToString:@"headImage"]) {
//        return [NSURL URLWithString:oldValue];
//    }return oldValue;
//}

@end
