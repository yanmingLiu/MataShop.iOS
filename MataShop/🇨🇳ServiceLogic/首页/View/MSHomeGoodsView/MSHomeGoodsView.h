//
//  MSHomeGoodsView.h
//  MataShop
//
//  Created by Jobs Hi on 9/19/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "JXCategoryTimelineView.h"
#import "JXCategoryIndicatorBackgroundView.h"

#import "BaseView.h"
#import "MS3rdShopLinkView.h"
#import "MSProdShowCVCell.h"
#import "MSProdShowModel.h"

#import "MSHomeGoodsBaseVC.h"

/// 锚点1（最低点）
#define 初始位置 \
JobsStatusBarHeightByAppleIncData() + \
[MSSearchBoardView viewSizeWithModel:nil].height + \
[CasinoBannerCell cellSizeWithModel:nil].height + \
JobsWidth(-10) + \
[BaiShaETProjMarqueeView viewSizeWithModel:nil].height + JobsWidth(16) + \
[MS3rdShopLinkView viewSizeWithModel:nil].height\
/// 锚点2（最高点）
#define 终点位置 \
JobsStatusBarHeightByAppleIncData() + \
[MSSearchBoardView viewSizeWithModel:nil].height \

///// 锚点1（最低点）
//#define 初始位置 JobsMainScreen_HEIGHT() / 2
///// 锚点2（最高点）
//#define 终点位置 100

NS_ASSUME_NONNULL_BEGIN

@interface MSHomeGoodsView : BaseView
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
