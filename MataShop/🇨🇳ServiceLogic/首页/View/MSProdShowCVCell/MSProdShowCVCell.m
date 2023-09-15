//
//  MSProdShowCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 9/15/23.
//

#import "MSProdShowCVCell.h"

@interface MSProdShowCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *prodNameLab;
@property(nonatomic,strong)UILabel *prodPriceLab;
/// Data
@property(nonatomic,strong)MSProdShowModel *prodShowModel;

@end

@implementation MSProdShowCVCell
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
    MSProdShowCVCell *cell = (MSProdShowCVCell *)[collectionView collectionViewCellClass:MSProdShowCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSProdShowCVCell.class];
        cell = (MSProdShowCVCell *)[collectionView collectionViewCellClass:MSProdShowCVCell.class forIndexPath:indexPath];
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
-(void)richElementsInCellWithModel:(MSProdShowModel *_Nullable)model{
    self.prodShowModel = model;
    self.imageView.alpha = 1;
    self.prodNameLab.alpha = 1;
    self.prodPriceLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(165), JobsWidth(165 + 50));
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(JobsWidth(165));
        }];
    }
    _imageView.image = self.prodShowModel.prodIMG;
    return _imageView;
}

-(UILabel *)prodNameLab{
    if(!_prodNameLab){
        _prodNameLab = UILabel.new;
        _prodNameLab.textColor = RGBA_COLOR(20, 17, 38, 1);
        _prodNameLab.textAlignment = NSTextAlignmentLeft;
        _prodNameLab.font = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_prodNameLab];
        [_prodNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.top.equalTo(self.imageView.mas_bottom).offset(JobsWidth(8));
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.right.equalTo(self.contentView).offset(JobsWidth(-12));
        }];
    }
    _prodNameLab.text = self.prodShowModel.prodName;
    [_prodNameLab makeLabelByShowingType:UILabelShowingType_01];
    return _prodNameLab;
}

-(UILabel *)prodPriceLab{
    if(!_prodPriceLab){
        _prodPriceLab = UILabel.new;
        _prodPriceLab.textColor = RGBA_COLOR(255, 89, 12, 1);
        _prodPriceLab.textAlignment = NSTextAlignmentRight;
        _prodPriceLab.font = UIFontWeightBoldSize(14);
        [self.contentView addSubview:_prodPriceLab];
        [_prodPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.top.equalTo(self.prodNameLab.mas_bottom).offset(JobsWidth(6));
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.right.equalTo(self.contentView).offset(JobsWidth(-12));
        }];
    }
    _prodPriceLab.text = self.prodShowModel.prodPrice;
    [_prodPriceLab makeLabelByShowingType:UILabelShowingType_01];
    return _prodNameLab;
}

@end
