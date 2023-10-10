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
@property(nonatomic,assign)JobsOrderState orderState;/// 订单状态
@property(nonatomic,copy)NSString *goodsTitle;/// 商品名称1
@property(nonatomic,copy)NSString *goodsSubTitle;/// 商品名称2
@property(nonatomic,copy)NSString *orderTime;/// 订单时间
@property(nonatomic,copy)NSString *orderAmount;/// 订单金额
@property(nonatomic,assign)JobsPayType payType;/// 支付方式

@end

NS_ASSUME_NONNULL_END
