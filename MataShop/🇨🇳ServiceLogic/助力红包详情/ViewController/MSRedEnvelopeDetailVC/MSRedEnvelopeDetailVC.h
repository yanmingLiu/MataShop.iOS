//
//  MSRedEnvelopeDetailVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/18/23.
//
#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "MSIncomeVC.h"/// 收入
#import "MSDisburseVC.h"/// 支出

NS_ASSUME_NONNULL_BEGIN
/// 助力红包详情
@interface MSRedEnvelopeDetailVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
