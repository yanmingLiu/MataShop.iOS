//
//  MSForHotTopicCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSForHotTopicCVCell.h"

@interface MSForHotTopicCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLab;
/// Data

@end

@implementation MSForHotTopicCVCell
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
    MSForHotTopicCVCell *cell = (MSForHotTopicCVCell *)[collectionView collectionViewCellClass:MSForHotTopicCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSForHotTopicCVCell.class];
        cell = (MSForHotTopicCVCell *)[collectionView collectionViewCellClass:MSForHotTopicCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell 圆切角
    //    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    //    [cell.contentView layerBorderCor:RGBA_COLOR(255, 225, 144, 1) andBorderWidth:JobsWidth(0.5f)];
    
    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.imageView.alpha = 1;
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(98), JobsWidth(116));
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    _imageView.image = self.viewModel.image;
    return _imageView;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.textColor = JobsWhiteColor;
        _titleLab.font = UIFontWeightBoldSize(13);
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(10));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-10));
            make.right.equalTo(self.contentView);
        }];
    }
    _titleLab.text = self.viewModel.textModel.text;
    [_titleLab makeLabelByShowingType:UILabelShowingType_05];
    return _titleLab;
}

@end
