//
//  MSInterestSettleRecordCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSInterestSettleRecordCVC.h"

@interface MSInterestSettleRecordCVC ()

@end

@implementation MSInterestSettleRecordCVC
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:MSInterestSettleRecordCVC.class];
    MSInterestSettleRecordCVC *cell = (MSInterestSettleRecordCVC *)[collectionView collectionViewCellClass:MSInterestSettleRecordCVC.class forIndexPath:indexPath];
    if (!cell) {
        cell = (MSInterestSettleRecordCVC *)[collectionView collectionViewCellClass:MSInterestSettleRecordCVC.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.contentView.backgroundColor = JobsGrayColor;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(124));
}
#pragma mark —— lazyLoad

@end
