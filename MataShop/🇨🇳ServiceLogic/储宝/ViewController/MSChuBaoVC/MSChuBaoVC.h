//
//  MSChuBaoVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "MSChuBaoView1.h"
#import "MSChuBaoView2.h"
#import "MSChuBaoAdMarqueeView.h"

#import "BaseViewController.h"
#import "MSProdSelectVC.h"/// 产品选购
#import "MSTransactionRecordVC.h"/// 交易记录
#import "MSPromotionIncentiveVC.h"/// 推广奖励
#import "MSInterestSettleRecordVC.h"/// 结息记录
#import "MSAboutChuBaoVC.h"/// 关于储宝

NS_ASSUME_NONNULL_BEGIN
///  储宝模块入口页
@interface MSChuBaoVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
