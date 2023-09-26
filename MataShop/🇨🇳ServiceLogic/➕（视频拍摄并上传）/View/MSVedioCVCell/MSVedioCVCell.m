//
//  MSVedioCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSVedioCVCell.h"

@interface MSVedioCVCell ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;

@end

@implementation MSVedioCVCell
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
    MSVedioCVCell *cell = (MSVedioCVCell *)[collectionView collectionViewCellClass:MSVedioCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSVedioCVCell.class];
        cell = (MSVedioCVCell *)[collectionView collectionViewCellClass:MSVedioCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell 圆切角
    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;;
    
    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.getImageView.image = model.bgImage;
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(166), JobsWidth(166));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.textColor = JobsWhiteColor;
        _titleLab.font = UIFontWeightRegularSize(12);
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.left.equalTo(self.contentView).offset(JobsWidth(10));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-15));
        }];
    }
    _titleLab.text = self.viewModel.textModel.text;
    [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    return _titleLab;
}

@end
