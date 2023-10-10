//
//  MSProdSelectCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSProdSelectCVCell.h"

@interface MSProdSelectCVCell ()
/// UI
@property(nonatomic,strong)BaseButton *prodNameBtn;
@property(nonatomic,strong)BaseButton *prodDailyRateBtn;
@property(nonatomic,strong)BaseButton *prodRemainsBtn;
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
    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    [cell.contentView layerBorderCor:JobsCor(@"#D2D5E0") andBorderWidth:JobsWidth(.5f)];
    cell.indexPath = indexPath;

    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = self.contentView.backgroundColor = JobsWhiteColor;
    if([model isKindOfClass:UIViewModel.class]){
        self.prodSelectModel = model.data;
        self.prodNameBtn.jobsResetTitle(self.prodSelectModel.prodName);/// 产品名
        self.prodNameBtn.jobsResetSubtitle(self.prodSelectModel.prodPrice);/// 产品价格
        self.prodRemainsBtn.jobsResetSubtitle(self.prodSelectModel.prodNum);/// 产品剩余
        self.prodDailyRateBtn.jobsResetSubtitle(self.prodSelectModel.prodDailyRate);/// 产品日利率
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
-(BaseButton *)prodNameBtn{
    if(!_prodNameBtn){
        @jobs_weakify(self)
        _prodNameBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:nil
                                                           subTitle:nil
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
        
        [self.contentView addSubview:_prodNameBtn];
        [_prodNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodNameBtn;
}

-(BaseButton *)prodRemainsBtn{
    if(!_prodRemainsBtn){
        @jobs_weakify(self)
        _prodRemainsBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                            background:nil
                                                        titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                         textAlignment:NSTextAlignmentCenter
                                                      subTextAlignment:NSTextAlignmentCenter
                                                           normalImage:nil
                                                        highlightImage:nil
                                                       attributedTitle:nil
                                               selectedAttributedTitle:nil
                                                    attributedSubtitle:nil
                                                                 title:Internationalization(@"剩余")
                                                              subTitle:nil
                                                             titleFont:UIFontWeightRegularSize(12)
                                                          subTitleFont:UIFontWeightSemiboldSize(14)
                                                              titleCor:JobsCor(@"#666666")
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
        [self.contentView addSubview:_prodRemainsBtn];
        [_prodRemainsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(192));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodRemainsBtn;
}

-(BaseButton *)prodDailyRateBtn{
    if(!_prodDailyRateBtn){
        @jobs_weakify(self)
        _prodDailyRateBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:nil
                                                          highlightImage:nil
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:Internationalization(@"日利率")
                                                                subTitle:nil
                                                               titleFont:UIFontWeightRegularSize(12)
                                                            subTitleFont:UIFontWeightSemiboldSize(14)
                                                                titleCor:JobsCor(@"#666666")
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
        
        [self.contentView addSubview:_prodDailyRateBtn];
        [_prodDailyRateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(112));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodDailyRateBtn;
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
        _prodTipsTextView.font = UIFontWeightRegularSize(12);
        _prodTipsTextView.textColor = JobsCor(@"#666666");
        _prodTipsTextView.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_prodTipsTextView];
        [_prodTipsTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLab);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(132), JobsWidth(40)));
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
                                              subTextAlignment:NSTextAlignmentCenter
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
                                           baseBackgroundColor:JobsCor(@"#EA2918")
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
                                                   borderWidth:JobsWidth(0)
                                                 primaryAction:nil
                                               clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast jobsToastErrMsg:Internationalization(@"我要购买")];
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
                                                         subTextAlignment:NSTextAlignmentCenter
                                                              normalImage:nil
                                                           highlightImage:nil
                                                          attributedTitle:nil
                                                  selectedAttributedTitle:nil
                                                       attributedSubtitle:nil
                                                                    title:Internationalization(@"推荐购买")
                                                                 subTitle:nil
                                                                titleFont:UIFontWeightRegularSize(14)
                                                             subTitleFont:nil
                                                                 titleCor:JobsCor(@"#EA2918")
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
                                                           layerBorderCor:JobsCor(@"#F0D4AD")
                                                              borderWidth:JobsWidth(.5f)
                                                            primaryAction:nil
                                                          clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast jobsToastErrMsg:Internationalization(@"推荐购买")];
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
