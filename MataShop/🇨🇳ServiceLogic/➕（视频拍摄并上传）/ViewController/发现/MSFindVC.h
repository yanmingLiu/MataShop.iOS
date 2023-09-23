//
//  MSFindVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "MSFindCVCell.h"

#import "BaseViewController.h"
#import "MSVedioSubVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSFindVC : BaseViewController
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
JXCategoryTitleViewDataSource,
JXCategoryListContainerViewDelegate,
JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
