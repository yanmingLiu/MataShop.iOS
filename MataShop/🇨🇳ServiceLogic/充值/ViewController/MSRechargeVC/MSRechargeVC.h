//
//  MSRechargeVC.h
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "BaseViewController.h"
#import "JobsBtnStyleCVCell.h"
#import "JobsHeaderFooterView.h"
#import "JobsTextFieldStyleCVCell.h"
#import "MSChooseRechargeWayView.h"

NS_ASSUME_NONNULL_BEGIN
/// 带输入框的充值页面
@interface MSRechargeVC : BaseViewController
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
