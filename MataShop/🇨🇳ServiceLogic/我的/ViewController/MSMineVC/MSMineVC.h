//
//  MSMineVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "BaseViewController.h"

#import "MSMineCollectionReusableView.h"
#import "JobsHeaderFooterView.h"
#import "MSMineView6CVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSMineVC : BaseViewController
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
