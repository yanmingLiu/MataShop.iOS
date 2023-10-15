//
//  MSMomentsVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "BaseViewController.h"
#import "MSMyPostDynamicVC.h"/// 发布动态

#import "MSMoreMomentsCVCell.h"/// 更多圈子
#import "MSHotTopicCVCell.h"/// 热门话题
#import "MSLastDynamicCVCell.h"/// 最新动态
#import "MSMomentsCollectionReusableView.h"

#import "MSLastDynamicModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 点击用户头像区域，进入该用户的用户中心
/// 点击最近动态下面的时间、评论、点赞区域，进入动态详情页面
/// 点击图片，图片在本页放大
@interface MSMomentsVC : BaseViewController
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>


@end

NS_ASSUME_NONNULL_END
