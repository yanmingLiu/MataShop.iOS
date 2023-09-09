//
//  BaiShaETProjVIPSubModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/12.
//

#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaiShaETProjVIPSubModel : UIViewModel

@property(nonatomic,assign)RankClass rankClass;/// 等级
@property(nonatomic,assign)ActiveState activeState;/// 活动状态
@property(nonatomic,copy)NSString *protectRankClassTime;/// 保級期限日期
@property(nonatomic,copy)NSString *cumulativeDeposit;/// 累積存款
@property(nonatomic,copy)NSString *requestCashFlow;/// 流水要求
@property(nonatomic,copy)NSString *protectRequestCashFlow;/// 保級流水
@property(nonatomic,copy)NSString *vipName;

@property(nonatomic,copy)NSString *minTransfer;/// 最低转账
@property(nonatomic,copy)NSString *dividends;/// 红利比例
@property(nonatomic,copy)NSString *highestReward;/// 最高奖励
@property(nonatomic,copy)NSString *multipleWater;/// 流水倍数

@end

NS_ASSUME_NONNULL_END
