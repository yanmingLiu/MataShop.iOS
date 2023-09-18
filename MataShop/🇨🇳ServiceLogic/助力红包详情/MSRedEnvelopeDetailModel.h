//
//  MSRedEnvelopeDetailModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/18/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSRedEnvelopeDetailModel : BaseModel

@property(nonatomic,copy)NSString *amountValue;/// 账变金额
@property(nonatomic,copy)NSString *timeValue;/// 账变时间

@end

NS_ASSUME_NONNULL_END
