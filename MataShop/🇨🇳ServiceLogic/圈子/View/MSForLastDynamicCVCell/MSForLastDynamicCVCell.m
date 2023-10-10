//
//  MSForLastDynamicCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSForLastDynamicCVCell.h"

@interface MSForLastDynamicCVCell ()
/// UI

@end

@implementation MSForLastDynamicCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSForLastDynamicCVCell *cell = (MSForLastDynamicCVCell *)[collectionView collectionViewCellClass:MSForLastDynamicCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSForLastDynamicCVCell.class];
        cell = (MSForLastDynamicCVCell *)[collectionView collectionViewCellClass:MSForLastDynamicCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    [cell.contentView layerBorderCor:RGBA_COLOR(255, 225, 144, 1) andBorderWidth:JobsWidth(0.5f)];

    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIImage *_Nullable)model{
    self.getImageView.image = model;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(98), JobsWidth(98));
}
#pragma mark —— lazyLoad


@end
