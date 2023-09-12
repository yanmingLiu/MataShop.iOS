//
//  MSPromotionIncentiveCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSPromotionIncentiveCVC.h"

@interface MSPromotionIncentiveCVC ()

@end

@implementation MSPromotionIncentiveCVC
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSPromotionIncentiveCVC *cell = (MSPromotionIncentiveCVC *)[collectionView collectionViewCellClass:MSPromotionIncentiveCVC.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSPromotionIncentiveCVC.class];
        cell = (MSPromotionIncentiveCVC *)[collectionView collectionViewCellClass:MSPromotionIncentiveCVC.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.contentView.backgroundColor = JobsYellowColor;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(64));
}
#pragma mark —— lazyLoad

@end
