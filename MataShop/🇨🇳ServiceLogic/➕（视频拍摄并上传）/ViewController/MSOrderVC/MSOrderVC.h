//
//  MSOrderVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "MSFindVC.h"/// 发现
#import "MSMySocialVC.h"/// 我的交际圈
#import "MSMyPostDynamicVC.h"/// 发布动态

NS_ASSUME_NONNULL_BEGIN

@interface MSOrderVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
