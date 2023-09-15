//
//  MSProdShowModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/15/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSProdShowModel : BaseModel

@property(nonatomic,copy)UIImage *prodIMG;
@property(nonatomic,copy)NSString *prodIMGURL;
@property(nonatomic,copy)NSString *prodName;
@property(nonatomic,copy)NSString *prodPrice;

@end

NS_ASSUME_NONNULL_END
