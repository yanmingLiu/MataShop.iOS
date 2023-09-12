//
//  BaiShaETProjVIPSubCVCell_02.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjVIPSubCVCell_02.h"

@interface BaiShaETProjVIPSubCVCell_02 ()
/// UI
@property(nonatomic,strong)JobsUpDownLab *titleLab;
@property(nonatomic,strong)UIImageView *imageView;
/// Data
@property(nonatomic,strong)JobsUpDownLabModel *upDownLabModel;

@end

@implementation BaiShaETProjVIPSubCVCell_02

@synthesize viewModel = _viewModel;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = UIColor.whiteColor;
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjVIPSubCVCell_02 *cell = (BaiShaETProjVIPSubCVCell_02 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_02.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:BaiShaETProjVIPSubCVCell_02.class];
        cell = (BaiShaETProjVIPSubCVCell_02 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_02.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;;

    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    if (self.viewModel) {
        self.titleLab.alpha = 1;
        self.imageView.alpha = 1;
    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(164), JobsWidth(66));
}
#pragma mark —— lazyLoad
-(JobsUpDownLab *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsUpDownLab.new;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.size.mas_equalTo(CGSizeMake([BaiShaETProjVIPSubCVCell_02 cellSizeWithModel:nil].width,JobsWidth(12 + 14 + 8)));
        }];
        [_titleLab richElementsInViewWithModel:self.upDownLabModel];
    }return _titleLab;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = UIImageView.new;
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(24), JobsWidth(24)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-12));
            make.top.equalTo(self.titleLab);
        }];
        [_imageView cornerCutToCircleWithCornerRadius:JobsWidth(24 / 2)];
    }_imageView.image = self.viewModel.image;
    return _imageView;
}

-(JobsUpDownLabModel *)upDownLabModel{
    if (!_upDownLabModel) {
        _upDownLabModel = JobsUpDownLabModel.new;
        
        _upDownLabModel.upLabText = self.viewModel.textModel.text;
        _upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
        _upDownLabModel.upLabFont = notoSansBold(16);
        _upDownLabModel.upLabTextCor = HEXCOLOR(0x3D4A58);
        _upDownLabModel.upLabBgCor = UIColor.clearColor;

        _upDownLabModel.downLabText = self.viewModel.subTextModel.text;
        _upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
        _upDownLabModel.downLabFont = notoSansRegular(12);
        _upDownLabModel.downLabTextCor = HEXCOLOR(0x757575);
        _upDownLabModel.downLabBgCor = UIColor.clearColor;

        _upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;

        _upDownLabModel.space = JobsWidth(8);
        
    }return _upDownLabModel;
}

@end
