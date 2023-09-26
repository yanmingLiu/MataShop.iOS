//
//  MSProdSelectCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSProdSelectCVCell.h"

@interface MSProdSelectCVCell ()
/// UI
//@property(nonatomic,strong)JobsUpDownLab *prodNameLab;
//@property(nonatomic,strong)JobsUpDownLab *prodDailyRateLab;
//@property(nonatomic,strong)JobsUpDownLab *prodRemainsLab;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UITextView *prodTipsTextView;
@property(nonatomic,strong)BaseButton *recommendedBuyBtn;
@property(nonatomic,strong)BaseButton *buyBtn;
/// Data
//@property(nonatomic,strong)JobsUpDownLabModel *prodNameModel;//
//@property(nonatomic,strong)JobsUpDownLabModel *prodDailyRateModel;//
//@property(nonatomic,strong)JobsUpDownLabModel *prodRemainsModel;//
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
    self.backgroundColor = self.contentView.backgroundColor = RGBA_COLOR(210, 213, 224, 0.2);
    if([model isKindOfClass:UIViewModel.class]){
        self.prodSelectModel = model.data;
//        self.prodNameModel.upLabText = self.prodSelectModel.prodName;/// 产品名
//        self.prodNameModel.downLabText = self.prodSelectModel.prodPrice;/// 产品价格
//        self.prodDailyRateModel.downLabText = self.prodSelectModel.prodDailyRate;/// 产品日利率
//        self.prodRemainsModel.downLabText = self.prodSelectModel.prodNum;/// 产品剩余
        
//        self.prodTipsLab.text = self.prodSelectModel.prodTips;/// 产品细节说明
    }
    
//    self.prodNameLab.alpha = 1;
//    self.prodRemainsLab.alpha = 1;
//    self.prodDailyRateLab.alpha = 1;
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
//-(JobsUpDownLab *)prodNameLab{
//    if(!_prodNameLab){
//        _prodNameLab = JobsUpDownLab.new;
//        [self.contentView addSubview:_prodNameLab];
//        [_prodNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView).offset(JobsWidth(20));
//            make.top.equalTo(self.contentView).offset(JobsWidth(12));
//        }];
//    }
//    [_prodNameLab richElementsInViewWithModel:self.prodNameModel];
//    [self layoutIfNeeded];
//    return _prodNameLab;
//}

//-(JobsUpDownLab *)prodRemainsLab{
//    if(!_prodRemainsLab){
//        _prodRemainsLab = JobsUpDownLab.new;
//        [self.contentView addSubview:_prodRemainsLab];
//        [_prodRemainsLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView).offset(JobsWidth(192));
//            make.top.equalTo(self.contentView).offset(JobsWidth(12));
//        }];
//    }
//    [_prodRemainsLab richElementsInViewWithModel:self.prodRemainsModel];
//    [self layoutIfNeeded];
//    return _prodRemainsLab;
//}
//
//-(JobsUpDownLab *)prodDailyRateLab{
//    if(!_prodDailyRateLab){
//        _prodDailyRateLab = JobsUpDownLab.new;
//        [self.contentView addSubview:_prodDailyRateLab];
//        [_prodDailyRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView).offset(JobsWidth(112));
//            make.top.equalTo(self.contentView).offset(JobsWidth(12));
//        }];
//    }
//    [_prodDailyRateLab richElementsInViewWithModel:self.prodDailyRateModel];
//    [self layoutIfNeeded];
//    return _prodDailyRateLab;
//}

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
        _buyBtn = BaseButton.new;
        _buyBtn.normalTitle = Internationalization(@"我要购买");
        _buyBtn.backgroundColor = RGBA_COLOR(136, 79, 2, 1);
        _buyBtn.normalTitleColor = JobsWhiteColor;
        _buyBtn.titleFont = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_buyBtn];
        [_buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
        [_buyBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        @jobs_weakify(self)
        [_buyBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"我要购买")];
        }];
    }return _recommendedBuyBtn;
}

-(BaseButton *)recommendedBuyBtn{
    if (!_recommendedBuyBtn) {
        _recommendedBuyBtn = BaseButton.new;
        _recommendedBuyBtn.normalTitle = Internationalization(@"推荐购买");
        _recommendedBuyBtn.normalTitleColor = RGBA_COLOR(136, 79, 2, 1);
        _recommendedBuyBtn.titleFont = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_recommendedBuyBtn];
        [_recommendedBuyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.left.equalTo(self.contentView).offset(JobsWidth(154));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-16));
        }];
        [_recommendedBuyBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        [_recommendedBuyBtn layerBorderCor:RGBA_COLOR(136, 79, 2, 1) andBorderWidth:JobsWidth(1)];
        @jobs_weakify(self)
        [_recommendedBuyBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"推荐购买")];
        }];
    }return _recommendedBuyBtn;
}

//-(JobsUpDownLabModel *)prodNameModel{
//    if (!_prodNameModel) {
//        _prodNameModel = JobsUpDownLabModel.new;
//    }
//
////    _prodNameModel.upLabText = Internationalization(@"暂无数据");/// 产品名
//    _prodNameModel.upLabTextAlignment = NSTextAlignmentCenter;
//    _prodNameModel.upLabFont = JobsFontRegular(12);
//    _prodNameModel.upLabTextCor = JobsBlackColor;
//    _prodNameModel.upLabBgCor = JobsClearColor;
//    
////    _prodNameModel.downLabText = Internationalization(@"暂无数据");
//    _prodNameModel.downLabTextAlignment = NSTextAlignmentCenter;
//    _prodNameModel.downLabFont = JobsFontBold(16);
//    _prodNameModel.downLabTextCor = RGBA_COLOR(236, 86, 40, 1);
//    _prodNameModel.downLabBgCor = JobsClearColor;
//
//    _prodNameModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _prodNameModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    _prodNameModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _prodNameModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    
//    _prodNameModel.space = JobsWidth(3);
//    
//    return _prodNameModel;
//}
//
//-(JobsUpDownLabModel *)prodDailyRateModel{
//    if (!_prodDailyRateModel) {
//        _prodDailyRateModel = JobsUpDownLabModel.new;
//    }
//    
//    _prodDailyRateModel.upLabText = Internationalization(@"日利率：") ;
//    _prodDailyRateModel.upLabTextAlignment = NSTextAlignmentCenter;
//    _prodDailyRateModel.upLabFont = JobsFontRegular(12);
//    _prodDailyRateModel.upLabTextCor = RGBA_COLOR(102, 102, 102, 1);
//    _prodDailyRateModel.upLabBgCor = JobsClearColor;
//    
////    _prodDailyRateModel.downLabText = Internationalization(@"暂无数据");
//    _prodDailyRateModel.downLabTextAlignment = NSTextAlignmentCenter;
//    _prodDailyRateModel.downLabFont = JobsFontBold(16);
//    _prodDailyRateModel.downLabTextCor = JobsBlackColor;
//    _prodDailyRateModel.downLabBgCor = JobsClearColor;
//
//    _prodDailyRateModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _prodDailyRateModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    _prodDailyRateModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _prodDailyRateModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    
//    _prodDailyRateModel.space = JobsWidth(3);
//    
//    return _prodDailyRateModel;
//}
//
//-(JobsUpDownLabModel *)prodRemainsModel{
//    if (!_prodRemainsModel) {
//        _prodRemainsModel = JobsUpDownLabModel.new;
//    }
//    
//    _prodRemainsModel.upLabText = Internationalization(@"剩余:") ;
//    _prodRemainsModel.upLabTextAlignment = NSTextAlignmentCenter;
//    _prodRemainsModel.upLabFont = JobsFontRegular(12);
//    _prodRemainsModel.upLabTextCor = RGBA_COLOR(102, 102, 102, 1);
//    _prodRemainsModel.upLabBgCor = JobsClearColor;
//    
////    _prodRemainsModel.downLabText = Internationalization(@"暂无数据");
//    _prodRemainsModel.downLabTextAlignment = NSTextAlignmentCenter;
//    _prodRemainsModel.downLabFont = JobsFontBold(16);
//    _prodRemainsModel.downLabTextCor = JobsBlackColor;
//    _prodRemainsModel.downLabBgCor = JobsClearColor;
//
//    _prodRemainsModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _prodRemainsModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    _prodRemainsModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _prodRemainsModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    
//    _prodRemainsModel.space = JobsWidth(3);
//    
//    return _prodRemainsModel;
//}

@end
