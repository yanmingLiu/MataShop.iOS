//
//  MSMineView6.m
//  MataShop
//
//  Created by Jobs Hi on 9/27/23.
//

#import "MSMineView6CVCell.h"

@interface MSMineView6CVCell ()

@end

@implementation MSMineView6CVCell
@synthesize viewModel = _viewModel;

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
    MSMineView6CVCell *cell = (MSMineView6CVCell *)[collectionView collectionViewCellClass:MSMineView6CVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSMineView6CVCell.class];
        cell = (MSMineView6CVCell *)[collectionView collectionViewCellClass:MSMineView6CVCell.class forIndexPath:indexPath];
    }
    
    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.contentView.backgroundColor = self.backgroundColor = UIColor.clearColor;
    UIButton *btn = self.getBtn;
    btn.backgroundColor = JobsWhiteColor;
    btn.normalTitle = self.viewModel.textModel.text;
    btn.normalTitleColor = JobsCor(@"#333333");
    btn.titleFont = UIFontWeightRegularSize(14);
    btn.normalImage = self.viewModel.image;
    [btn layoutButtonWithEdgeInsetsStyle:self.viewModel.buttonEdgeInsetsStyle
                         imageTitleSpace:self.viewModel.imageTitleSpace];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(73), JobsWidth(64));
}
#pragma mark —— lazyLoad

@end
