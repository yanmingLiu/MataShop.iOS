//
//  MSInternalRecruitmentVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "MSSalesVC.h"/// 销售部
#import "MSMDVC.h"/// 市场部
#import "MSBODVC.h"/// 董事会

NS_ASSUME_NONNULL_BEGIN
/// 内部招聘
@interface MSInternalRecruitmentVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
