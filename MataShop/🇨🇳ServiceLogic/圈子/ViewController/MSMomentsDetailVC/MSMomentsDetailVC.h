//
//  MSMomentsDetailVC.h
//  MataShop
//
//  Created by Jobs Hi on 10/15/23.
//

#import "BaseViewController.h"
#import "JobsCommentCoreVC.h"

#import "MSLastDynamicCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSMomentsDetailVC : JobsCommentCoreVC
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
