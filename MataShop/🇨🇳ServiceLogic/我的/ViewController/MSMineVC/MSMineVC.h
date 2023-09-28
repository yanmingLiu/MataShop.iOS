//
//  MSMineVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSMineView1.h"
#import "MSMineView2.h"
#import "MSMineView3.h"
#import "MSMineView4.h"
#import "MSMineView5.h"

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSMineVC : BaseViewController
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
