//
//  MSWalletRecordVCViewController.h
//  MataShop
//
//  Created by Mac on 2023/10/24.
//
#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "MSTransactionRecordCVCell.h"

#import "BaseViewController.h"
#import "MSChuBaoWithdrawVC.h"/// 储宝.提现
#import "MSChuBaoBuyVC.h"/// 储宝.购买
#import "MSTopupRecordViewController.h"/// 储宝.充值
NS_ASSUME_NONNULL_BEGIN

@interface MSWalletRecordVCViewController : BaseViewController
<
JXCategoryListContainerViewDelegate,
JXCategoryTitleViewDataSource,
JXCategoryViewDelegate
>
@end

NS_ASSUME_NONNULL_END
