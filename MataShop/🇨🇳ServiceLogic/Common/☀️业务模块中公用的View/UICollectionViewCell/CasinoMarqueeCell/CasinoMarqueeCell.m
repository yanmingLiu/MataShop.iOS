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
    [collectionView registerCollectionViewCellClass:CasinoMarqueeCell.class];
    CasinoMarqueeCell *cell = (CasinoMarqueeCell *)[collectionView collectionViewCellClass:CasinoMarqueeCell.class forIndexPath:indexPath];
    if (!cell) {
        cell = (CasinoMarqueeCell *)[collectionView collectionViewCellClass:CasinoMarqueeCell.class forIndexPath:indexPath];
        cell.contentView.backgroundColor = JobsRedColor;
    }
    cell.indexPath = indexPath;
    return cell;
}

@end
