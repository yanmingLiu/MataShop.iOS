//
//  MSFindVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "BaseViewController.h"
#import "MSFindCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSFindVC : BaseViewController
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
