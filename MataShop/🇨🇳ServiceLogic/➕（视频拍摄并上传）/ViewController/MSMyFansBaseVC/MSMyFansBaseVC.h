//
//  MSMyFansBaseVC.h
//  MataShop
//
//  Created by Jobs Hi on 10/2/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "MSThumbsUpVC.h"/// 点赞作品
#import "MSMyFansSubVC.h"/// 我的粉丝
#import "MSMyAttentionSubVC.h"/// 我的关注
#import "MSMyTipsSubVC.h"/// 我打赏的用户
#import "MSTipsMeSubVC.h"/// 打赏我的用户

typedef NS_ENUM(NSInteger,  MSMyFansStyle) {
    MSMyFansStyle_1 = 0,/// 我的粉丝——我的关注
    MSMyFansStyle_2,/// 我的粉丝——我的粉丝
    MSMyFansStyle_3,/// 我的粉丝——我打赏的用户
    MSMyFansStyle_4/// 我的粉丝——打赏我的用户
};

NS_ASSUME_NONNULL_BEGIN

@interface MSMyFansBaseVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
