//
//  MSProdSelectCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSProdSelectCVCell.h"

@interface MSProdSelectCVCell ()
/// UI
@property(nonatomic,strong)BaseButton *prodNameLab;
@property(nonatomic,strong)BaseButton *prodDailyRateLab;
@property(nonatomic,strong)BaseButton *prodRemainsLab;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UITextView *prodTipsTextView;
@property(nonatomic,strong)BaseButton *recommendedBuyBtn;
@property(nonatomic,strong)BaseButton *buyBtn;
/// Data
@property(nonatomic,strong)MSProdSelectModel *prodSelectModel;

@end

@implementation MSProdSelectCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSProdSelectCVCell *cell = (MSProdSelectCVCell *)[collectionView collectionViewCellClass:MSProdSelectCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSProdSelectCVCell.class];
        cell = (MSProdSelectCVCell *)[collectionView collectionViewCellClass:MSProdSelectCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = self.contentView.backgroundColor = JobsWhiteColor;
    if([model isKindOfClass:UIViewModel.class]){
        self.prodSelectModel = model.data;
        self.prodNameLab.resetTitle(@"wowowowow");
//        [self.prodNameLab setBtnConfigTitle:self.prodSelectModel.prodName];/// 产品名
//        [self.prodNameLab setBtnConfigSubtitle:self.prodSelectModel.prodPrice];/// 产品价格
//        [self.prodRemainsLab setBtnConfigTitle:self.prodSelectModel.prodNum];/// 产品剩余
//        [self.prodDailyRateLab setBtnConfigTitle:self.prodSelectModel.prodDailyRate];/// 产品日利率
    }
    self.lineLab.alpha = 1;
    self.prodTipsTextView.alpha = 1;
    self.buyBtn.alpha = 1;
    self.recommendedBuyBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(124));
}
#pragma mark —— lazyLoad
-(BaseButton *)prodNameLab{
    if(!_prodNameLab){
        @jobs_weakify(self)
        _prodNameLab = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:@"3543"
                                                           subTitle:@"34"
                                                          titleFont:UIFontWeightSemiboldSize(16)
                                                       subTitleFont:UIFontWeightSemiboldSize(14)
                                                           titleCor:JobsCor(@"#333333")
                                                        subTitleCor:JobsCor(@"#E02020")
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:JobsClearColor
                                                       imagePadding:JobsWidth(0)
                                                       titlePadding:JobsWidth(0)
                                                     imagePlacement:NSDirectionalRectEdgeNone
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
        
        [self.contentView addSubview:_prodNameLab];
        [_prodNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodNameLab;
}

-(BaseButton *)prodRemainsLab{
    if(!_prodRemainsLab){
        @jobs_weakify(self)
        _prodRemainsLab = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                            background:nil
                                                        titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                         textAlignment:NSTextAlignmentCenter
                                                           normalImage:nil
                                                        highlightImage:nil
                                                       attributedTitle:nil
                                               selectedAttributedTitle:nil
                                                    attributedSubtitle:nil
                                                                 title:Internationalization(@"剩余")
                                                              subTitle:nil
                                                             titleFont:UIFontWeightRegularSize(12)
                                                          subTitleFont:UIFontWeightSemiboldSize(14)
                                                              titleCor:JobsCor(@"#EA2918")
                                                           subTitleCor:JobsCor(@"#000000")
                                                    titleLineBreakMode:NSLineBreakByWordWrapping
                                                 subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                   baseBackgroundColor:JobsClearColor
                                                          imagePadding:JobsWidth(0)
                                                          titlePadding:JobsWidth(0)
                                                        imagePlacement:NSDirectionalRectEdgeNone
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
        [self.contentView addSubview:_prodRemainsLab];
        [_prodRemainsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(192));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodRemainsLab;
}

-(BaseButton *)prodDailyRateLab{
    if(!_prodDailyRateLab){
        @jobs_weakify(self)
        _prodDailyRateLab = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                           textAlignment:NSTextAlignmentCenter
                                                             normalImage:nil
                                                          highlightImage:nil
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:nil
                                                                subTitle:nil
                                                               titleFont:UIFontWeightRegularSize(12)
                                                            subTitleFont:UIFontWeightSemiboldSize(14)
                                                                titleCor:JobsCor(@"#EA2918")
                                                             subTitleCor:JobsCor(@"#000000")
                                                      titleLineBreakMode:NSLineBreakByWordWrapping
                                                   subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                     baseBackgroundColor:JobsClearColor
                                                            imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(0)
                                                          imagePlacement:NSDirectionalRectEdgeNone
                                              contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                           contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                       cornerRadiusValue:JobsWidth(16)
                                                         roundingCorners:UIRectCornerAllCorners
                                                    roundingCornersRadii:CGSizeZero
                                                          layerBorderCor:nil
                                                             borderWidth:JobsWidth(1)
                                                           primaryAction:nil
                                                         clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastMsg:Internationalization(@"提现")];
            return nil;
        }];
        
        [self.contentView addSubview:_prodDailyRateLab];
        [_prodDailyRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(112));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodDailyRateLab;
}

-(UILabel *)lineLab{
    if(!_lineLab){
        _lineLab = UILabel.new;
        _lineLab.backgroundColor = RGBA_COLOR(241, 245, 249, 1);
        [self.contentView addSubview:_lineLab];
        [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(303), JobsWidth(1)));
            make.top.equalTo(self.contentView).offset(JobsWidth(63));
        }];
    }return _lineLab;
}

-(UITextView *)prodTipsTextView{
    if(!_prodTipsTextView){
        _prodTipsTextView = UITextView.new;
        _prodTipsTextView.backgroundColor = self.backgroundColor;
        _prodTipsTextView.font = UIFontWeightRegularSize(9);
        _prodTipsTextView.textColor = RGBA_COLOR(102, 102, 102, 1);
        _prodTipsTextView.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_prodTipsTextView];
        [_prodTipsTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLab);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(132), JobsWidth(32)));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
    }
    _prodTipsTextView.text = self.prodSelectModel.prodTips;
    return _prodTipsTextView;
}

-(BaseButton *)buyBtn{
    if (!_buyBtn) {
        @jobs_weakify(self)
        _buyBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                    background:nil
                                                titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                 textAlignment:NSTextAlignmentCenter
                                                   normalImage:nil
                                                highlightImage:nil
                                               attributedTitle:nil
                                       selectedAttributedTitle:nil
                                            attributedSubtitle:nil
                                                         title:Internationalization(@"我要购买")
                                                      subTitle:nil
                                                     titleFont:UIFontWeightRegularSize(14)
                                                  subTitleFont:nil
                                                      titleCor:JobsWhiteColor
                                                   subTitleCor:nil
                                            titleLineBreakMode:NSLineBreakByWordWrapping
                                         subtitleLineBreakMode:NSLineBreakByWordWrapping
                                           baseBackgroundColor:RGBA_COLOR(136, 79, 2, 1)
                                                  imagePadding:JobsWidth(0)
                                                  titlePadding:JobsWidth(0)
                                                imagePlacement:NSDirectionalRectEdgeNone
                                    contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                      contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                 contentInsets:jobsSameDirectionalEdgeInsets(0)
                                             cornerRadiusValue:JobsWidth(16)
                                               roundingCorners:UIRectCornerAllCorners
                                          roundingCornersRadii:CGSizeZero
                                                layerBorderCor:nil
                                                   borderWidth:JobsWidth(1)
                                                 primaryAction:nil
                                               clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"我要购买")];
            return nil;
        }];
        [self.contentView addSubview:_buyBtn];
        [_buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
    }return _recommendedBuyBtn;
}

-(BaseButton *)recommendedBuyBtn{
    if (!_recommendedBuyBtn) {
        @jobs_weakify(self)
        _recommendedBuyBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                               background:nil
                                                           titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                            textAlignment:NSTextAlignmentCenter
                                                              normalImage:nil
                                                           highlightImage:nil
                                                          attributedTitle:nil
                                                  selectedAttributedTitle:nil
                                                       attributedSubtitle:nil
                                                                    title:Internationalization(@"推荐购买")
                                                                 subTitle:nil
                                                                titleFont:UIFontWeightRegularSize(14)
                                                             subTitleFont:nil
                                                                 titleCor:RGBA_COLOR(136, 79, 2, 1)
                                                              subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                    subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                      baseBackgroundColor:UIColor.whiteColor
                                                             imagePadding:JobsWidth(0)
                                                             titlePadding:JobsWidth(0)
                                                           imagePlacement:NSDirectionalRectEdgeNone
                                               contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                 contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                            contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                        cornerRadiusValue:JobsWidth(16)
                                                          roundingCorners:UIRectCornerAllCorners
                                                     roundingCornersRadii:CGSizeZero
                                                           layerBorderCor:nil
                                                              borderWidth:JobsWidth(1)
                                                            primaryAction:nil
                                                          clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"推荐购买")];
            return nil;
        }];
        [self.contentView addSubview:_recommendedBuyBtn];
        [_recommendedBuyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.left.equalTo(self.contentView).offset(JobsWidth(154));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
    }return _recommendedBuyBtn;
}

@end
