//
//  BaiShaETProjHeaderIconCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "BaiShaETProjHeaderIconCVCell.h"

@interface BaiShaETProjHeaderIconCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *headerIconIMGV;
@property(nonatomic,strong)UIImageView *coverIMGV;
@property(nonatomic,strong)UILabel *titleLab;
/// Data
@property(nonatomic,strong)BaiShaETProjHeaderIconModel *headerIconModel;

@end

@implementation BaiShaETProjHeaderIconCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjHeaderIconCVCell *cell = (BaiShaETProjHeaderIconCVCell *)[collectionView collectionViewCellClass:BaiShaETProjHeaderIconCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:BaiShaETProjHeaderIconCVCell.class];
        cell = (BaiShaETProjHeaderIconCVCell *)[collectionView collectionViewCellClass:BaiShaETProjHeaderIconCVCell.class forIndexPath:indexPath];
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
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(id _Nullable)model{
//    self.headerIconModel = model;
//    self.headerIconIMGV.alpha = 1;
//    if (model.headerIconCellStyle == HeaderIconCVCellStyleChange) {
//        self.coverIMGV.alpha = 1;
//        self.titleLab.alpha = 1;
//    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(66), JobsWidth(66));
}
#pragma mark —— lazyLoad
-(UIImageView *)headerIconIMGV{
    if (!_headerIconIMGV) {
        _headerIconIMGV = UIImageView.new;
        _headerIconIMGV.image = self.headerIconModel.image;
        _headerIconIMGV.backgroundColor = UIColor.lightGrayColor;
        [self.contentView addSubview:_headerIconIMGV];
        [_headerIconIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(JobsWidth(1), JobsWidth(1), JobsWidth(1), JobsWidth(1)));
        }];

        [_headerIconIMGV cornerCutToCircleWithCornerRadius:[BaiShaETProjHeaderIconCVCell cellSizeWithModel:nil].height / 2];
    }return _headerIconIMGV;
}

-(UIImageView *)coverIMGV{
    if (!_coverIMGV) {
        _coverIMGV = UIImageView.new;
        _coverIMGV.backgroundColor = HEXCOLOR_ALPHA(0x000000, .5f);
        [self.headerIconIMGV addSubview:_coverIMGV];
        [_coverIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _coverIMGV;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"更换");
        _titleLab.textColor = UIColor.whiteColor;
        _titleLab.font = [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightRegular];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.backgroundColor = UIColor.clearColor;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }return _titleLab;
}

@end
