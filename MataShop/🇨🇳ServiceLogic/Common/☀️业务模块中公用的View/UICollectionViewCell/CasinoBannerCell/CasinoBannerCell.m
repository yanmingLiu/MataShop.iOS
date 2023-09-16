//
//  CasinoBannerCell.m
//  Casino
//
//  Created by Jobs on 2021/12/6.
//

#import "CasinoBannerCell.h"

@implementation CasinoBannerCell

#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    CasinoBannerCell *cell = (CasinoBannerCell *)[collectionView collectionViewCellClass:CasinoBannerCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:CasinoBannerCell.class];
        cell = (CasinoBannerCell *)[collectionView collectionViewCellClass:CasinoBannerCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
-(void)richElementsInCellWithModel:(id _Nullable)model{

}

+(CGSize)cellSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(345), JobsWidth(152));
}

@end
