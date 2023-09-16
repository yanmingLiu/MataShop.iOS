//
//  MSInternalRecruitmentDetailModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSInternalRecruitmentDetailModel : BaseModel

@property(nonatomic,copy)NSString *titleName;/// 职位名称
@property(nonatomic,copy)NSString *titleValue;/// 职位（数字资产）
@property(nonatomic,copy)NSString *rate1;/// 直招补贴奖励
@property(nonatomic,copy)NSString *rate2;/// 红包助力返点比例
@property(nonatomic,copy)NSString *value2;/// 助力红包金额
@property(nonatomic,copy)NSString *rate3;/// 间招补贴奖励
@property(nonatomic,copy)NSString *rate4;/// 数字资产释放期限（5年）
@property(nonatomic,copy)NSString *value3;/// 职别招聘Mata值（锁仓配额）
@property(nonatomic,copy)NSString *value4;/// KPI招聘考核标准（60Mata值）

@end

NS_ASSUME_NONNULL_END
