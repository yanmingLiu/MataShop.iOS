//
//  MSInterestSettleRecordModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/13/23.
//

#import "BaseModel.h"

typedef NS_ENUM(NSInteger, ProdStyle) {
    ProdStyle01,/// 产品已到期
    ProdStyle02,/// 产品未到期（可赎回）
    ProdStyle03,/// 产品未到期（不可赎回）
};

NS_ASSUME_NONNULL_BEGIN

@interface MSInterestSettleRecordModel : BaseModel

@property(nonatomic,copy)NSString *prodName;/// 产品名
@property(nonatomic,copy)NSString *prodPrice;/// 产品价格
@property(nonatomic,copy)NSString *prodDailyRate;/// 产品日利率
@property(nonatomic,copy)NSString *prodInterestSettledYesterday;/// 昨日结息
@property(nonatomic,copy)NSString *prodInterestSettledAll;/// 总结息
@property(nonatomic,copy)NSString *prodExpectedIncome;/// 预计收益
@property(nonatomic,copy)NSString *prodEarnedIncome;/// 已获收益
@property(nonatomic,copy)NSString *prodAllIncome;/// 总收益
@property(nonatomic,copy)NSString *prodTimeTips;/// 产品时间 = 购买时间 + 到期释放时间
@property(nonatomic,assign)ProdStyle prodStyle;/// 产品状态

@end

NS_ASSUME_NONNULL_END
