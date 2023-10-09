//
//  MSOrderModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import <Foundation/Foundation.h>
#import "JobsDefineAllEnumHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSOrderModel : NSObject

@property(nonatomic,copy)NSString *shopName;/// 店铺名
@property(nonatomic,assign)JobsOrderType orderType;/// 订单类型
@property(nonatomic,copy)NSString *goodsName;/// 商品名称
@property(nonatomic,copy)NSString *orderTime;/// 订单时间
@property(nonatomic,copy)NSString *orderAmount;/// 订单金额
@property(nonatomic,assign)JobsPayType payType;/// 支付方式

@end

NS_ASSUME_NONNULL_END
