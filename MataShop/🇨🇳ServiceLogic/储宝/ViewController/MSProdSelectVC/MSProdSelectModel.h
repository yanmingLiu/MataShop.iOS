//
//  MSProdSelectModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSProdSelectModel : BaseModel

@property(nonatomic,copy)NSString *prodName;/// 产品名
@property(nonatomic,copy)NSString *prodPrice;/// 产品价格
@property(nonatomic,copy)NSString *prodDailyRate;/// 产品日利率
@property(nonatomic,copy)NSString *prodNum;/// 产品库存
@property(nonatomic,copy)NSString *prodTips;/// 产品细节说明

@end

NS_ASSUME_NONNULL_END
