//
//  MSInternalRecruitmentModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSInternalRecruitmentDetailModel : BaseModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *value;

@end

@interface MSInternalRecruitmentModel : BaseModel

@property(nonatomic,copy)NSString *titleName;/// 职位名称
@property(nonatomic,strong)NSMutableArray <MSInternalRecruitmentDetailModel *>*detailMutArr;

@end


NS_ASSUME_NONNULL_END
