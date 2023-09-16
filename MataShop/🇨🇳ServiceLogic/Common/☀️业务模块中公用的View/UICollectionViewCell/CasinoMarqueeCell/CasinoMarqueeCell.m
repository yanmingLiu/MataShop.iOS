//
//  CasinoMarqueeCell.m
//  Casino
//
//  Created by Jobs on 2021/12/6.
//

#import "CasinoMarqueeCell.h"

@interface CasinoMarqueeCell ()

@end

@implementation CasinoMarqueeCell

#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    CasinoMarqueeCell *cell = (CasinoMarqueeCell *)[collectionView collectionViewCellClass:CasinoMarqueeCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:CasinoMarqueeCell.class];
        cell = (CasinoMarqueeCell *)[collectionView collectionViewCellClass:CasinoMarqueeCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}

@end
