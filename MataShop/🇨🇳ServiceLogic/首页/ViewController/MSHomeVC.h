//
//  MSHomeVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#if __has_include(<WMZBanner/WMZBannerView.h>)
#import <WMZBanner/WMZBannerView.h>
#else
#import "WMZBannerView.h"
#endif

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "CasinoBannerCell.h"
#import "BaiShaETProjMarqueeView.h"
#import "MSSearchBoardView.h"

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSHomeVC : BaseViewController<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
