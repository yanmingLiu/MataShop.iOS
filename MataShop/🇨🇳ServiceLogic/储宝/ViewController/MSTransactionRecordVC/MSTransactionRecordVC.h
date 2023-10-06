//
//  MSTransactionRecordVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
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
#import "MSChuBaoTopUpVC.h"/// 储宝.充值

NS_ASSUME_NONNULL_BEGIN
/// 交易记录
@interface MSTransactionRecordVC : BaseViewController
<
JXCategoryListContainerViewDelegate,
JXCategoryTitleViewDataSource,
JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
