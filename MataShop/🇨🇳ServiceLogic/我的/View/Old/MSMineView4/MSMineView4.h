//
//  MSMineView4.h
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "BaseCollectionViewCell.h"
#import "MSMineView6CVCell.h"

#import "MSRedEnvelopeDetailVC.h"/// 共享收益.助力红包
#import "MSSignInVC.h"/// 每日签到
#import "MSChuBaoVC.h"/// 储宝

NS_ASSUME_NONNULL_BEGIN

@interface MSMineView4 : BaseCollectionViewCell
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
