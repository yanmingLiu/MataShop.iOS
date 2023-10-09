//
//  MSOrderVC.h
//  MataShop
//
//  Created by Jobs Hi on 10/9/23.
//

#import "BaseViewController.h"
#import "MSOrderAllVC.h"/// 订单.全部
#import "MSOrderDueVC.h"/// 订单.待付款
#import "MSOrderWaitSentVC.h"/// 订单.待发货
#import "MSOrderWaitReceivedVC.h"/// 订单.待收货
#import "MSOrderEvaluateVC.h"/// 订单.评价

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "MSOrderFilterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSOrderVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryViewDelegate
,JXCategoryListContainerViewDelegate
>

@end

NS_ASSUME_NONNULL_END
