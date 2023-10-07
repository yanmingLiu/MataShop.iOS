//
//  MSProdShowModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/15/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSProdShowModel : BaseModel

@property(nonatomic,copy)UIImage *prodIMG;/// 商品图
@property(nonatomic,copy)NSString *prodIMGURL;/// 商品图URL
@property(nonatomic,copy)NSString *prodTitle;/// 商品名
@property(nonatomic,copy)NSString *prodSubTitle;/// 商品特色
@property(nonatomic,copy)NSString *prodPrice;/// 商品折扣价(实际卖价)
@property(nonatomic,copy)NSString *prodSubPrice;/// 商品原价
@property(nonatomic,copy)NSString *prodSales;/// 商品销量

@end

NS_ASSUME_NONNULL_END
