//
//  MSPromotionIncentiveVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "BaseViewController.h"
#import "MSPromotionIncentiveCVCell.h"
#import "BaseCollectionReusableView.h"

#import "MSPromotionIncentiveModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 推广奖励
@interface MSPromotionIncentiveVC : BaseViewController
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@end

NS_ASSUME_NONNULL_END
