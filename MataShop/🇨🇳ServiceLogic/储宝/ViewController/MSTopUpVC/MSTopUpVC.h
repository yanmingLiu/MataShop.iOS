//
//  MSTopUpVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "MSWechatTopUpVC.h"// 微信支付
#import "MSAlipayTopUpVC.h"// 支付宝支付
#import "MSBankCardTopUpVC.h"// 银行卡支付

NS_ASSUME_NONNULL_BEGIN

@interface MSTopUpVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
