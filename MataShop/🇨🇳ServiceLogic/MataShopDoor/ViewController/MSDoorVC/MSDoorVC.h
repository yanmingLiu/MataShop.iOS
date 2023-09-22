//
//  MSDoorVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "MSMessageLoginVC.h"/// 短信登录
#import "MSPasswordLoginVC.h" /// 密码登录
#import "MSThirdPartyShortcutLoginPanelView.h"

NS_ASSUME_NONNULL_BEGIN
/// 登录
@interface MSDoorVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
