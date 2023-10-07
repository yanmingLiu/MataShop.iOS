//
//  MSProdListCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/8/23.
//

#import "MSProdListCVCell.h"

@interface MSProdListCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *prodTitleLab;
@property(nonatomic,strong)UILabel *prodSubNameLab;
@property(nonatomic,strong)UILabel *prodPriceLab;
@property(nonatomic,strong)UILabel *prodSubPriceLab;
@property(nonatomic,strong)UIButton *prodSalesBtn;
/// Data
@property(nonatomic,strong)MSProdShowModel *prodShowModel;

@end

@implementation MSProdListCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

- (void)setNeedsLayout{
    [super setNeedsLayout];
}

- (void)layoutIfNeeded{
    [super layoutIfNeeded];
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;//_prodPriceLab.resetByOffsetWidth(JobsWidth(100));
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSProdListCVCell *cell = (MSProdListCVCell *)[collectionView collectionViewCellClass:MSProdListCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSProdListCVCell.class];
        cell = (MSProdListCVCell *)[collectionView collectionViewCellClass:MSProdListCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell 圆切角
    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    [cell.contentView layerBorderCor:JobsCor(@"#F2F2F2") andBorderWidth:JobsWidth(.5f)];
    cell.contentView.backgroundColor = cell.backgroundColor = JobsWhiteColor;
    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSProdShowModel *_Nullable)model{
    
    self.prodShowModel = model;
    
    self.imageView.alpha = 1;
    self.prodTitleLab.alpha = 1;
    self.prodSubNameLab.alpha = 1;
    self.prodSalesBtn.alpha = 1;
//    self.prodPriceLab.alpha = 1;
//    self.prodSubPriceLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(172), JobsWidth(172 + 80));
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
    _imageView.image = self.prodShowModel.prodIMG;// prodIMGURL
    return _imageView;
}

-(UILabel *)prodTitleLab{
    if(!_prodTitleLab){
        _prodTitleLab = UILabel.new;
        _prodTitleLab.textColor = RGBA_COLOR(20, 17, 38, 1);
        _prodTitleLab.textAlignment = NSTextAlignmentLeft;
        _prodTitleLab.font = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_prodTitleLab];
        [_prodTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.top.equalTo(self.imageView.mas_bottom).offset(JobsWidth(8));
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.right.equalTo(self.contentView).offset(JobsWidth(-12));
        }];
    }
    _prodTitleLab.text = self.prodShowModel.prodTitle;
    [_prodTitleLab makeLabelByShowingType:UILabelShowingType_01];
    return _prodTitleLab;
}

-(UILabel *)prodSubNameLab{
    if(!_prodSubNameLab){
        _prodSubNameLab = UILabel.new;
        _prodSubNameLab.textColor = JobsCor(@"#2B3034");
        _prodSubNameLab.backgroundColor = JobsCor(@"#EAECEE");
        _prodSubNameLab.textAlignment = NSTextAlignmentLeft;
        _prodSubNameLab.font = UIFontWeightRegularSize(12);
        [self.contentView addSubview:_prodSubNameLab];
        [_prodSubNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.bottom.equalTo(self.contentView.mas_bottom).offset(JobsWidth(8));
            make.right.equalTo(self.contentView);
        }];
    }
    [_prodSubNameLab appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                                   cornerRadii:CGSizeMake(JobsWidth(7), JobsWidth(7))];
    _prodSubNameLab.text = self.prodShowModel.prodSubTitle;
    [_prodSubNameLab makeLabelByShowingType:UILabelShowingType_03];
    return _prodSubNameLab;
}

-(UILabel *)prodPriceLab{
    if(!_prodPriceLab){
        _prodPriceLab = UILabel.new;
        _prodPriceLab.textColor = JobsCor(@"#FFFFFF");
        _prodPriceLab.backgroundColor = JobsCor(@"#EA2A18");
        _prodPriceLab.textAlignment = NSTextAlignmentLeft;
        _prodPriceLab.font = UIFontWeightBoldSize(14);
        [self.contentView addSubview:_prodPriceLab];
        [_prodPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.prodSubNameLab.mas_bottom).offset(JobsWidth(6));
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.height.mas_equalTo(JobsWidth(14));
        }];
        [_prodPriceLab cornerCutToCircleWithCornerRadius:JobsWidth(7)];
    }
    _prodPriceLab.text = self.prodShowModel.prodPrice;
    [_prodPriceLab makeLabelByShowingType:UILabelShowingType_03];
    return _prodPriceLab;
}

-(UILabel *)prodSubPriceLab{
    if(!_prodSubPriceLab){
        _prodSubPriceLab = UILabel.new;
        _prodSubPriceLab.textColor = RGBA_COLOR(255, 89, 12, 1);
        _prodSubPriceLab.textAlignment = NSTextAlignmentRight;
        _prodSubPriceLab.font = UIFontWeightBoldSize(14);
        [self.contentView addSubview:_prodSubPriceLab];
        [_prodSubPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.centerY.equalTo(self.prodPriceLab);
            make.left.equalTo(self.prodPriceLab.mas_right).offset(JobsWidth(5));
        }];
    }
    _prodSubPriceLab.attributedText = _prodSubPriceLab.jobsHorizontalCentralLineation(self.prodShowModel.prodSubPrice);
//    [_prodSubPriceLab makeLabelByShowingType:UILabelShowingType_01];
    return _prodSubPriceLab;
}

-(UIButton *)prodSalesBtn{
    if(!_prodSalesBtn){
        @jobs_weakify(self)
        _prodSalesBtn = [UIButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:JobsIMG(@"火")
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:nil
                                                          subTitle:nil
                                                            titleFont:UIFontWeightBoldSize(14)
                                                      subTitleFont:nil
                                                          titleCor:JobsCor(@"#FF0E3E")
                                                       subTitleCor:nil
                                                titleLineBreakMode:NSLineBreakByWordWrapping
                                             subtitleLineBreakMode:NSLineBreakByWordWrapping
                                               baseBackgroundColor:UIColor.whiteColor
                                                      imagePadding:JobsWidth(0)
                                                      titlePadding:JobsWidth(0)
                                                    imagePlacement:NSDirectionalRectEdgeLeading
                                        contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                          contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                     contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                 cornerRadiusValue:JobsWidth(0)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self.contentView addSubview:_prodSalesBtn];
        [_prodSalesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(16));
            make.top.equalTo(self.prodTitleLab.mas_bottom).offset(JobsWidth(6));
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    _prodSalesBtn.jobsResetTitle(self.prodShowModel.prodSales);
    return _prodSalesBtn;
}

@end
