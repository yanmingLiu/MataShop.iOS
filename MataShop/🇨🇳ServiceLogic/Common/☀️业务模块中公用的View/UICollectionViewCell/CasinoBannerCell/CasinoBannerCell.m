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
    [collectionView registerCollectionViewCellClass:CasinoBannerCell.class];
    CasinoBannerCell *cell = (CasinoBannerCell *)[collectionView collectionViewCellClass:CasinoBannerCell.class forIndexPath:indexPath];
    if (!cell) {
        cell = (CasinoBannerCell *)[collectionView collectionViewCellClass:CasinoBannerCell.class forIndexPath:indexPath];
    }
    
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
-(void)richElementsInCellWithModel:(id _Nullable)model{

}

+(CGSize)cellSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(230));
}

@end
