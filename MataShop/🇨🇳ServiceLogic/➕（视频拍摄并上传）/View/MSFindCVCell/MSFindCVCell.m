//
//  MSFindCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSFindCVCell.h"

@interface MSFindCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *titleBackIMGV;
@property(nonatomic,strong)UILabel *titleLab;
/// Data

@end

@implementation MSFindCVCell
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
    MSFindCVCell *cell = (MSFindCVCell *)[collectionView collectionViewCellClass:MSFindCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSFindCVCell.class];
        cell = (MSFindCVCell *)[collectionView collectionViewCellClass:MSFindCVCell.class forIndexPath:indexPath];
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
    self.titleBackIMGV.alpha = 1;
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(166), JobsWidth(166));
}
#pragma mark —— lazyLoad
-(UIImageView *)titleBackIMGV{
    if(!_titleBackIMGV){
        _titleBackIMGV = UIImageView.new;
        _titleBackIMGV.image = JobsIMG(@"广场舞标注背景");
        [self.contentView addSubview:_titleBackIMGV];
        [_titleBackIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(66), JobsWidth(22)));
            make.left.equalTo(self.contentView).offset(JobsWidth(16));
            make.top.equalTo(self.contentView).offset(JobsWidth(15));
        }];
    }return _titleBackIMGV;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.textColor = JobsWhiteColor;
        _titleLab.font = UIFontWeightRegularSize(12);
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.titleBackIMGV);
        }];
    }
    _titleLab.text = self.viewModel.textModel.text;
    [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    return _titleLab;
}

@end
