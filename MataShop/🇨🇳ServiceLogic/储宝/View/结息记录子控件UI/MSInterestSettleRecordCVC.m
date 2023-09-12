//
//  MSInterestSettleRecordCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSInterestSettleRecordCVC.h"

@interface MSInterestSettleRecordCVC ()
/// UI
@property(nonatomic,strong)JobsUpDownLab *prodNameLab;/// 产品名
@property(nonatomic,strong)JobsUpDownLab *prodDailyRateLab;/// 日利率 或者 昨日结息
@property(nonatomic,strong)JobsUpDownLab *prodInterestSettledAllLab;/// 总结息 或 预计收益
@property(nonatomic,strong)JobsUpDownLab *prodEarnedIncomeLab;/// 已获收益
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UITextView *prodTipsTextView;
@property(nonatomic,strong)BaseButton *moneyBackBtn;/// 我要提现  或者 我要赎回
/// Data
@property(nonatomic,strong)JobsUpDownLabModel *prodNameModel;/// 产品名
@property(nonatomic,strong)JobsUpDownLabModel *prodDailyRateModel;/// 日利率 或者 昨日结息
@property(nonatomic,strong)JobsUpDownLabModel *prodInterestSettledAllModel;/// 总结息 或 预计收益
@property(nonatomic,strong)JobsUpDownLabModel *prodEarnedIncomeLabModel;/// 已获收益
@property(nonatomic,strong)MSInterestSettleRecordModel *interestSettleRecordModel;

@end

@implementation MSInterestSettleRecordCVC
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSInterestSettleRecordCVC *cell = (MSInterestSettleRecordCVC *)[collectionView collectionViewCellClass:MSInterestSettleRecordCVC.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSInterestSettleRecordCVC.class];
        cell = (MSInterestSettleRecordCVC *)[collectionView collectionViewCellClass:MSInterestSettleRecordCVC.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = self.contentView.backgroundColor = RGBA_COLOR(210, 213, 224, 0.2);
    if([model isKindOfClass:UIViewModel.class]){
        self.interestSettleRecordModel = model.data;
        
        self.prodNameModel.upLabText = self.interestSettleRecordModel.prodName;/// 产品名
        self.prodNameModel.downLabText = self.interestSettleRecordModel.prodPrice;/// 产品价格
        
        switch (self.interestSettleRecordModel.prodStyle) {
            case ProdStyle01:{/// 产品已到期
                self.prodDailyRateModel.upLabText = Internationalization(@"昨日结息：");
                self.prodDailyRateModel.downLabText = self.interestSettleRecordModel.prodInterestSettledYesterday;/// 昨日结息
                
                self.prodInterestSettledAllModel.upLabText = Internationalization(@"总结息：");
                self.prodInterestSettledAllModel.downLabText = self.interestSettleRecordModel.prodInterestSettledAll;/// 总结息
            } break;
            case ProdStyle02:{/// 产品未到期（可赎回）
                self.prodDailyRateModel.upLabText = Internationalization(@"日利率：");
                self.prodDailyRateModel.downLabText = self.interestSettleRecordModel.prodDailyRate;/// 日利率
                
                self.prodInterestSettledAllModel.upLabText = Internationalization(@"预计收益：");
                self.prodInterestSettledAllModel.downLabText = self.interestSettleRecordModel.prodExpectedIncome;/// 预计收益
            } break;
            case ProdStyle03:{/// 产品未到期（不可赎回）
                self.prodDailyRateModel.upLabText = Internationalization(@"日利率：");
                self.prodDailyRateModel.downLabText = self.interestSettleRecordModel.prodDailyRate;/// 日利率
                
                self.prodInterestSettledAllModel.upLabText = Internationalization(@"预计收益：");
                self.prodInterestSettledAllModel.downLabText = self.interestSettleRecordModel.prodExpectedIncome;/// 预计收益
                
                self.prodEarnedIncomeLabModel.downLabText = self.interestSettleRecordModel.prodEarnedIncome;/// 已获收益
            } break;
                
            default:
                break;
        }
    }
    
    self.prodNameLab.alpha = 1;
    self.prodDailyRateLab.alpha = 1;
    self.prodInterestSettledAllLab.alpha = 1;
    self.prodEarnedIncomeLab.alpha = self.interestSettleRecordModel.prodStyle == ProdStyle03;
    
    self.lineLab.alpha = 1;
    self.prodTipsTextView.alpha = 1;
    self.moneyBackBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(124));
}
#pragma mark —— lazyLoad
-(JobsUpDownLab *)prodNameLab{
    if(!_prodNameLab){
        _prodNameLab = JobsUpDownLab.new;
        [self.contentView addSubview:_prodNameLab];
        [_prodNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
        [_prodNameLab richElementsInViewWithModel:self.prodNameModel];
        [self layoutIfNeeded];
    }return _prodNameLab;
}

-(JobsUpDownLab *)prodDailyRateLab{
    if(!_prodDailyRateLab){
        _prodDailyRateLab = JobsUpDownLab.new;
        [self.contentView addSubview:_prodDailyRateLab];
        [_prodDailyRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(112));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
        [_prodDailyRateLab richElementsInViewWithModel:self.prodDailyRateModel];
        [self layoutIfNeeded];
    }return _prodDailyRateLab;
}

-(JobsUpDownLab *)prodInterestSettledAllLab{
    if(!_prodInterestSettledAllLab){
        _prodInterestSettledAllLab = JobsUpDownLab.new;
        [self.contentView addSubview:_prodInterestSettledAllLab];
        [_prodInterestSettledAllLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(192));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
        [_prodInterestSettledAllLab richElementsInViewWithModel:self.prodInterestSettledAllModel];
        [self layoutIfNeeded];
    }return _prodInterestSettledAllLab;
}

-(JobsUpDownLab *)prodEarnedIncomeLab{
    if(!_prodEarnedIncomeLab){
        _prodEarnedIncomeLab = JobsUpDownLab.new;
        [self.contentView addSubview:_prodEarnedIncomeLab];
        [_prodEarnedIncomeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(263));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
        }];
        [_prodEarnedIncomeLab richElementsInViewWithModel:self.prodEarnedIncomeLabModel];
        [self layoutIfNeeded];
    }return _prodEarnedIncomeLab;
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
        _prodTipsTextView.font = UIFontWeightRegularSize(JobsWidth(9));
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
        _moneyBackBtn = BaseButton.new;
        
        switch (self.interestSettleRecordModel.prodStyle) {
            case ProdStyle01:{/// 产品已到期
                _moneyBackBtn.normalTitle = Internationalization(@"我要提现");
                _moneyBackBtn.userInteractionEnabled = YES;
                _moneyBackBtn.backgroundColor = RGBA_COLOR(136, 79, 2, 1);
                _moneyBackBtn.normalTitleColor = JobsWhiteColor;
            } break;
            case ProdStyle02:{/// 产品未到期（可赎回）
                _moneyBackBtn.normalTitle = Internationalization(@"我要赎回");
                _moneyBackBtn.userInteractionEnabled = YES;
                _moneyBackBtn.backgroundColor = RGBA_COLOR(255, 255, 255, 1);
                _moneyBackBtn.normalTitleColor = RGBA_COLOR(136, 79, 2, 1);
            } break;
            case ProdStyle03:{/// 产品未到期（不可赎回）
                _moneyBackBtn.normalTitle = Internationalization(@"我要赎回");
                _moneyBackBtn.userInteractionEnabled = NO;
                _moneyBackBtn.backgroundColor = RGBA_COLOR(255, 255, 255, 1);
                _moneyBackBtn.normalTitleColor = RGBA_COLOR(221, 221, 221, 1);
            } break;
                
            default:
                break;
        }
        
        _moneyBackBtn.titleFont = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_moneyBackBtn];
        [_moneyBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
        [_moneyBackBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        @jobs_weakify(self)
        [_moneyBackBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"我要")];
        }];
    }return _moneyBackBtn;
}

-(JobsUpDownLabModel *)prodNameModel{
    if (!_prodNameModel) {
        _prodNameModel = JobsUpDownLabModel.new;
    }

//    _prodNameModel.upLabText = Internationalization(@"暂无数据");/// 产品名
    _prodNameModel.upLabTextAlignment = NSTextAlignmentCenter;
    _prodNameModel.upLabFont = JobsFontRegular(12);
    _prodNameModel.upLabTextCor = JobsBlackColor;
    _prodNameModel.upLabBgCor = JobsClearColor;
    
//    _prodNameModel.downLabText = Internationalization(@"暂无数据");
    _prodNameModel.downLabTextAlignment = NSTextAlignmentCenter;
    _prodNameModel.downLabFont = JobsFontBold(16);
    _prodNameModel.downLabTextCor = RGBA_COLOR(236, 86, 40, 1);
    _prodNameModel.downLabBgCor = JobsClearColor;

    _prodNameModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodNameModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _prodNameModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodNameModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _prodNameModel.space = JobsWidth(3);
    
    return _prodNameModel;
}

-(JobsUpDownLabModel *)prodDailyRateModel{
    if (!_prodDailyRateModel) {
        _prodDailyRateModel = JobsUpDownLabModel.new;
    }
    
//    _prodDailyRateModel.upLabText = Internationalization(@"日利率：") ;
    _prodDailyRateModel.upLabTextAlignment = NSTextAlignmentCenter;
    _prodDailyRateModel.upLabFont = JobsFontRegular(12);
    _prodDailyRateModel.upLabTextCor = RGBA_COLOR(102, 102, 102, 1);
    _prodDailyRateModel.upLabBgCor = JobsClearColor;
    
//    _prodDailyRateModel.downLabText = Internationalization(@"暂无数据");
    _prodDailyRateModel.downLabTextAlignment = NSTextAlignmentCenter;
    _prodDailyRateModel.downLabFont = JobsFontBold(16);
    _prodDailyRateModel.downLabTextCor = JobsBlackColor;
    _prodDailyRateModel.downLabBgCor = JobsClearColor;

    _prodDailyRateModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodDailyRateModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _prodDailyRateModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodDailyRateModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _prodDailyRateModel.space = JobsWidth(3);
    
    return _prodDailyRateModel;
}

-(JobsUpDownLabModel *)prodInterestSettledAllModel{
    if (!_prodInterestSettledAllModel) {
        _prodInterestSettledAllModel = JobsUpDownLabModel.new;
    }
    
//    _prodInterestSettledAllModel.upLabText = Internationalization(@"剩余:");
    _prodInterestSettledAllModel.upLabTextAlignment = NSTextAlignmentCenter;
    _prodInterestSettledAllModel.upLabFont = JobsFontRegular(12);
    _prodInterestSettledAllModel.upLabTextCor = RGBA_COLOR(102, 102, 102, 1);
    _prodInterestSettledAllModel.upLabBgCor = JobsClearColor;
    
//    _prodInterestSettledAllModel.downLabText = Internationalization(@"暂无数据");
    _prodInterestSettledAllModel.downLabTextAlignment = NSTextAlignmentCenter;
    _prodInterestSettledAllModel.downLabFont = JobsFontBold(16);
    _prodInterestSettledAllModel.downLabTextCor = JobsBlackColor;
    _prodInterestSettledAllModel.downLabBgCor = JobsClearColor;

    _prodInterestSettledAllModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodInterestSettledAllModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _prodInterestSettledAllModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodInterestSettledAllModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _prodInterestSettledAllModel.space = JobsWidth(3);
    
    return _prodInterestSettledAllModel;
}

-(JobsUpDownLabModel *)prodEarnedIncomeLabModel{
    if (!_prodEarnedIncomeLabModel) {
        _prodEarnedIncomeLabModel = JobsUpDownLabModel.new;
    }
    
    _prodEarnedIncomeLabModel.upLabText = Internationalization(@"已获收益:") ;
    _prodEarnedIncomeLabModel.upLabTextAlignment = NSTextAlignmentCenter;
    _prodEarnedIncomeLabModel.upLabFont = JobsFontRegular(12);
    _prodEarnedIncomeLabModel.upLabTextCor = RGBA_COLOR(102, 102, 102, 1);
    _prodEarnedIncomeLabModel.upLabBgCor = JobsClearColor;
    
//    _prodEarnedIncomeLabModel.downLabText = Internationalization(@"暂无数据");
    _prodEarnedIncomeLabModel.downLabTextAlignment = NSTextAlignmentCenter;
    _prodEarnedIncomeLabModel.downLabFont = JobsFontBold(16);
    _prodEarnedIncomeLabModel.downLabTextCor = JobsBlackColor;
    _prodEarnedIncomeLabModel.downLabBgCor = JobsClearColor;

    _prodEarnedIncomeLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodEarnedIncomeLabModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _prodEarnedIncomeLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _prodEarnedIncomeLabModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _prodEarnedIncomeLabModel.space = JobsWidth(3);
    
    return _prodEarnedIncomeLabModel;
}

@end
