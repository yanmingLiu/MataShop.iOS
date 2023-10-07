//
//  MSInterestSettleRecordCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSInterestSettleRecordCVCell.h"

@interface MSInterestSettleRecordCVCell ()
/// UI
@property(nonatomic,strong)BaseButton *prodNameBtn;/// 产品名
@property(nonatomic,strong)BaseButton *prodDailyRateBtn;/// 日利率 或者 昨日结息
@property(nonatomic,strong)BaseButton *prodInterestSettledAllBtn;/// 总结息 或 预计收益
@property(nonatomic,strong)BaseButton *prodEarnedIncomeBtn;/// 已获收益
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UITextView *prodTipsTextView;
@property(nonatomic,strong)BaseButton *moneyBackBtn;/// 我要提现  或者 我要赎回
/// Data
@property(nonatomic,strong)MSInterestSettleRecordModel *interestSettleRecordModel;

@end

@implementation MSInterestSettleRecordCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSInterestSettleRecordCVCell *cell = (MSInterestSettleRecordCVCell *)[collectionView collectionViewCellClass:MSInterestSettleRecordCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSInterestSettleRecordCVCell.class];
        cell = (MSInterestSettleRecordCVCell *)[collectionView collectionViewCellClass:MSInterestSettleRecordCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    [cell.contentView layerBorderCor:JobsCor(@"#D2D5E0") andBorderWidth:JobsWidth(.5f)];
    cell.contentView.backgroundColor = cell.backgroundColor = JobsWhiteColor;
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if([model isKindOfClass:UIViewModel.class]){
        self.interestSettleRecordModel = model.data;
        self.prodNameBtn.jobsResetTitle(self.interestSettleRecordModel.prodName);/// 产品名
        self.prodNameBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodPrice);/// 产品价格
        
        switch (self.interestSettleRecordModel.prodStyle) {
            case ProdStyle01:{/// 产品已到期
                self.prodDailyRateBtn.jobsResetTitle(Internationalization(@"昨日结息："));
                self.prodDailyRateBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodInterestSettledYesterday);/// 昨日结息
                self.prodInterestSettledAllBtn.jobsResetTitle(Internationalization(@"总结息："));
                self.prodInterestSettledAllBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodInterestSettledAll);/// 总结息
                
            } break;
            case ProdStyle02:{/// 产品未到期（可赎回）
                self.prodDailyRateBtn.jobsResetTitle(Internationalization(@"日利率："));
                self.prodDailyRateBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodDailyRate);/// 日利率
                self.prodInterestSettledAllBtn.jobsResetTitle(Internationalization(@"预计收益："));
                self.prodInterestSettledAllBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodExpectedIncome);/// 预计收益
                
            } break;
            case ProdStyle03:{/// 产品未到期（不可赎回）
                self.prodDailyRateBtn.jobsResetTitle(Internationalization(@"日利率："));
                self.prodDailyRateBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodDailyRate);/// 日利率
                self.prodInterestSettledAllBtn.jobsResetTitle(Internationalization(@"预计收益："));
                self.prodInterestSettledAllBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodExpectedIncome);/// 预计收益
                
                self.prodEarnedIncomeBtn.jobsResetSubtitle(self.interestSettleRecordModel.prodEarnedIncome);/// 已获收益
            } break;
                
            default:
                break;
        }
    }
    
    self.prodNameBtn.alpha = 1;
    self.prodDailyRateBtn.alpha = 1;
    self.prodInterestSettledAllBtn.alpha = 1;
    self.prodEarnedIncomeBtn.alpha = self.interestSettleRecordModel.prodStyle == ProdStyle03;
    
    self.lineLab.alpha = 1;
    self.prodTipsTextView.alpha = 1;
    self.moneyBackBtn.alpha = 1;
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

-(BaseButton *)prodInterestSettledAllBtn{
    if(!_prodInterestSettledAllBtn){
        @jobs_weakify(self)
        _prodInterestSettledAllBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
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
        [self.contentView addSubview:_prodInterestSettledAllBtn];
        [_prodInterestSettledAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(192));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodInterestSettledAllBtn;
}

-(BaseButton *)prodEarnedIncomeBtn{
    if(!_prodEarnedIncomeBtn){
        @jobs_weakify(self)
        _prodEarnedIncomeBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                 background:nil
                                                             titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                              textAlignment:NSTextAlignmentCenter
                                                           subTextAlignment:NSTextAlignmentCenter
                                                                normalImage:nil
                                                             highlightImage:nil
                                                            attributedTitle:nil
                                                    selectedAttributedTitle:nil
                                                         attributedSubtitle:nil
                                                                      title:Internationalization(@"已获收益:")
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
        [self.contentView addSubview:_prodEarnedIncomeBtn];
        [_prodEarnedIncomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(263));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
    }
    [self layoutIfNeeded];
    return _prodEarnedIncomeBtn;
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
        _prodTipsTextView.backgroundColor = JobsClearColor;
        _prodTipsTextView.font = UIFontWeightRegularSize(9);
        _prodTipsTextView.textColor = RGBA_COLOR(102, 102, 102, 1);
        _prodTipsTextView.text = self.interestSettleRecordModel.prodTimeTips;
        _prodTipsTextView.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_prodTipsTextView];
        [_prodTipsTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLab);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(167), JobsWidth(32)));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
    }return _prodTipsTextView;
}

-(BaseButton *)moneyBackBtn{
    if (!_moneyBackBtn) {
        @jobs_weakify(self)
        _moneyBackBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
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
                                                      layerBorderCor:nil
                                                         borderWidth:JobsWidth(1)
                                                       primaryAction:nil
                                                     clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"我要")];
            return nil;
        }];
        [self.contentView addSubview:_moneyBackBtn];
        [_moneyBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
    }
    
    switch (self.interestSettleRecordModel.prodStyle) {
        case ProdStyle01:{/// 产品已到期
            _moneyBackBtn.jobsResetTitle(Internationalization(@"我要提现"));
            _moneyBackBtn.jobsResetBaseBackgroundColor(JobsCor(@"#EA2918"));
            [_moneyBackBtn jobsSetBtntitleFont:UIFontWeightRegularSize(14) btnTitleCor:JobsWhiteColor];
            [_moneyBackBtn layerBorderCor:JobsCor(@"#EA2918") andBorderWidth:JobsWidth(.5f)];
            _moneyBackBtn.userInteractionEnabled = YES;
        } break;
        case ProdStyle02:{/// 产品未到期（可赎回）
            _moneyBackBtn.jobsResetTitle(Internationalization(@"我要赎回"));
            _moneyBackBtn.jobsResetBaseBackgroundColor(JobsWhiteColor);
            [_moneyBackBtn jobsSetBtntitleFont:UIFontWeightRegularSize(14) btnTitleCor:JobsCor(@"#EA2918")];
            [_moneyBackBtn layerBorderCor:JobsCor(@"#F0D4AD") andBorderWidth:JobsWidth(.5f)];
            _moneyBackBtn.userInteractionEnabled = YES;

        } break;
        case ProdStyle03:{/// 产品未到期（不可赎回）
            _moneyBackBtn.jobsResetTitle(Internationalization(@"我要赎回"));
            _moneyBackBtn.jobsResetBaseBackgroundColor(JobsCor(@"#D4D4D4"));
            [_moneyBackBtn jobsSetBtntitleFont:UIFontWeightRegularSize(14) btnTitleCor:JobsCor(@"#FFFFFF")];
            [_moneyBackBtn layerBorderCor:JobsCor(@"#DDDDDD") andBorderWidth:JobsWidth(.5f)];
            _moneyBackBtn.userInteractionEnabled = NO;
        } break;
            
        default:
            break;
    }return _moneyBackBtn;
}

@end
