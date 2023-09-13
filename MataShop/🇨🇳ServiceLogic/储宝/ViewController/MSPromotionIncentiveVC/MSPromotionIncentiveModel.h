//
//  MSPromotionIncentiveModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/13/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSPromotionIncentiveDetailModel : BaseModel

@property(nonatomic,copy)NSString *myIncentiveTypeNameStr;/// 名目（直推/间推）
@property(nonatomic,copy)NSString *myIncentiveDetailNameStr;/// 激励名
@property(nonatomic,copy)NSString *userNameStr;/// 下级用户名
@property(nonatomic,copy)NSString *timeStr;/// 时间
@property(nonatomic,strong)NSIndexPath *indexPath;

@end

@interface MSPromotionIncentiveModel : BaseModel

@property(nonatomic,copy)NSMutableArray <MSPromotionIncentiveDetailModel *>*incentiveDetailModelMutArr;
@property(nonatomic,strong)NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
