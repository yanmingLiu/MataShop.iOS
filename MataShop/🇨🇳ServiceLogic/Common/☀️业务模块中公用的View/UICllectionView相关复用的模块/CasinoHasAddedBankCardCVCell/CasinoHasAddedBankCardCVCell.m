//
//  CasinoHasAddedBankCardCVCell.m
//  Casino
//
//  Created by Jobs on 2021/12/18.
//

#import "CasinoHasAddedBankCardCVCell.h"

@interface CasinoHasAddedBankCardCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *bgIMGV;
@property(nonatomic,strong)UIImageView *bankIMGV;
@property(nonatomic,strong)UILabel *bankTitleLab;
@property(nonatomic,strong)UILabel *accNameLab;
@property(nonatomic,strong)UILabel *accLab;
@property(nonatomic,strong)UILabel *defaultTipsLab;
@property(nonatomic,strong)UIButton *settingDefaultBtn;
/// Data
@property(nonatomic,strong)CasinoBoundBankCardModel *boundBankCardModel;

@end

@implementation CasinoHasAddedBankCardCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self richElementsInCellWithModel:nil];
        [self cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:CasinoHasAddedBankCardCVCell.class];
    CasinoHasAddedBankCardCVCell *cell = (CasinoHasAddedBankCardCVCell *)[collectionView collectionViewCellClass:CasinoHasAddedBankCardCVCell.class forIndexPath:indexPath];
    if (!cell) {
        cell = (CasinoHasAddedBankCardCVCell *)[collectionView collectionViewCellClass:CasinoHasAddedBankCardCVCell.class forIndexPath:indexPath];
    }
    
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(15 * 2), JobsWidth(128));
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    
    [_settingDefaultBtn removeFromSuperview];
    _settingDefaultBtn = nil;
    
    [_defaultTipsLab removeFromSuperview];
    _defaultTipsLab = nil;
    
    [_bankIMGV removeFromSuperview];
    _bankIMGV = nil;
    
    [_bankTitleLab removeFromSuperview];
    _bankTitleLab = nil;
    
    [_accNameLab removeFromSuperview];
    _accNameLab = nil;
    
    [_accLab removeFromSuperview];
    _accLab = nil;
    
    if (model) {
        self.viewModel = model;
        self.boundBankCardModel = (CasinoBoundBankCardModel *)self.viewModel.data;
        self.backgroundView = self.bgIMGV;
//        self.settingDefaultBtn.alpha = !self.boundBankCardModel.defaultCard;
//        self.defaultTipsLab.alpha = self.boundBankCardModel.defaultCard;
        self.bankIMGV.alpha = 1;
        self.bankTitleLab.alpha = 1;
        self.accNameLab.alpha = 1;
        self.accLab.alpha = 1;
    }
}
#pragma mark —— 网络请求
/// 根据ID设置默认银行卡
-(void)bankcardSetDefaultBankCardById{
//    DDNetworkingPrepare
//    NSDictionary *parameters = @{
//        @"id":self.boundBankCardModel.ID,// 银行卡ID
//    };
//    
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    @jobs_weakify(self)
//    [DDNetworkingAPI requestApi:NSObject.bankcardSetDefaultBankCardByIdPOST.funcName
//                     parameters:parameters
//                   successBlock:^(DDResponseModel *data) {
//        @jobs_strongify(self)
//        if (data.code == HTTPResponseCodeSuccess) {
//            [WHToast toastSuccessMsg:Internationalization(@"Setting success")];
//            if (self.objectBlock) self.objectBlock(@1);
//        }
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
#pragma mark —— lazyLoad
-(UIImageView *)bgIMGV{
    if (!_bgIMGV) {
        _bgIMGV = UIImageView.new;
        _bgIMGV.image = JobsIMG(@"已经添加银行卡");
        _bgIMGV.frame = self.bounds;
    }return _bgIMGV;
}

-(UILabel *)defaultTipsLab{
    if (!_defaultTipsLab) {
        _defaultTipsLab = UILabel.new;
        _defaultTipsLab.text = Internationalization(@"Default");
        _defaultTipsLab.textAlignment = NSTextAlignmentCenter;
        _defaultTipsLab.textColor = JobsWhiteColor;
        _defaultTipsLab.backgroundColor = HEXCOLOR(0xBC07E);
        _defaultTipsLab.font = UIFontWeightRegularSize(10);
        [self.contentView addSubview:_defaultTipsLab];
        [_defaultTipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(18)));
            make.top.left.equalTo(self.contentView).offset(JobsWidth(0));
        }];
        [self layoutIfNeeded];
        [_defaultTipsLab appointCornerCutToCircleByRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopLeft
                                                       cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return _defaultTipsLab;
}

-(UIImageView *)bankIMGV{
    if (!_bankIMGV) {
        _bankIMGV = UIImageView.new;
//        _bankIMGV.backgroundColor = JobsRedColor;
        NSString *url = [self.readUserInfo.resourcesAddress stringByAppendingString:self.boundBankCardModel.bankLogo];
        [_bankIMGV sd_setImageWithURL:[NSURL URLWithString:url]
                     placeholderImage:JobsIMG(@"银行图标占位切图")];
        [self.contentView addSubview:_bankIMGV];
        [_bankIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(50), JobsWidth(50)));
            make.top.equalTo(self.contentView).offset(JobsWidth(24));
            make.left.equalTo(self.contentView).offset(JobsWidth(23));
        }];
        [_bankIMGV cornerCutToCircleWithCornerRadius:JobsWidth(25)];
    }return _bankIMGV;
}

-(UILabel *)bankTitleLab{
    if (!_bankTitleLab) {
        _bankTitleLab = UILabel.new;
        _bankTitleLab.textColor = HEXCOLOR(0x502600);
        _bankTitleLab.textAlignment = NSTextAlignmentCenter;
        _bankTitleLab.text = self.boundBankCardModel.bankName;
        _bankTitleLab.font = UIFontWeightMediumSize(20);
        [_bankTitleLab labelAutoWidthByFont];
        [self.contentView addSubview:_bankTitleLab];
        [_bankTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankIMGV.mas_right).offset(JobsWidth(21));
            make.top.equalTo(self.contentView).offset(JobsWidth(23));
            make.height.mas_equalTo(JobsWidth(20));
        }];
    }return _bankTitleLab;
}

-(UILabel *)accNameLab{
    if (!_accNameLab) {
        _accNameLab = UILabel.new;
        _accNameLab.textColor = HEXCOLOR(0x502600);
        _accNameLab.font = UIFontWeightRegularSize(12);
        _accNameLab.textAlignment = NSTextAlignmentCenter;
//        _accNameLab.text = self.boundBankCardModel.realName;
        [_accNameLab labelAutoWidthByFont];
        [self.contentView addSubview:_accNameLab];
        [_accNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.left.equalTo(self.bankTitleLab);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }return _accNameLab;
}

-(UILabel *)accLab{
    if (!_accLab) {
        _accLab = UILabel.new;
        _accLab.textColor = HEXCOLOR(0x502600);
        _accLab.font = UIFontWeightRegularSize(18);
        _accLab.textAlignment = NSTextAlignmentCenter;
//        _accLab.text = self.boundBankCardModel.bankAccount.stringValue;
        [_accLab labelAutoWidthByFont];
        [self.contentView addSubview:_accLab];
        [_accLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(22));
            make.right.equalTo(self.contentView).offset(-JobsWidth(44));
            make.bottom.equalTo(self.contentView).offset(-JobsWidth(22));
        }];
    }return _accLab;
}

-(UIButton *)settingDefaultBtn{
    if (!_settingDefaultBtn) {
        _settingDefaultBtn = UIButton.new;
        [_settingDefaultBtn normalTitle: Internationalization(@"Setting Default")];
        _settingDefaultBtn.titleLabel.font = UIFontWeightRegularSize(14);
        [_settingDefaultBtn normalTitleColor:HEXCOLOR(0x502600)];
        _settingDefaultBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        @jobs_weakify(self)
        [_settingDefaultBtn btnClickEventBlock:^(id data) {
            @jobs_strongify(self)
            [self bankcardSetDefaultBankCardById];
        }];
        [_settingDefaultBtn buttonAutoWidthByFont];
        [self.contentView addSubview:_settingDefaultBtn];
        [_settingDefaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(18));
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.centerY.equalTo(self.contentView);
        }];
    }return _settingDefaultBtn;
}

@end
