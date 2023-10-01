//
//  MSChuBaoView1.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView1.h"

@interface MSChuBaoView1 ()
/// UI
@property(nonatomic,strong)UIImageView *imgV;
//@property(nonatomic,strong)JobsUpDownLab *titleLab;// 我的余额
@property(nonatomic,strong)BaseButton *rechargeBtn;// 充值
@property(nonatomic,strong)BaseButton *withdrawBtn;// 提现
/// Data
//@property(nonatomic,strong)JobsUpDownLabModel *titleLabModel;// 我的余额Data

@end

@implementation MSChuBaoView1
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoView1OnceToken = 0;
    static_chuBaoView1 = nil;
}

static MSChuBaoView1 *static_chuBaoView1 = nil;
static dispatch_once_t static_chuBaoView1OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoView1OnceToken, ^{
        static_chuBaoView1 = MSChuBaoView1.new;
    });return static_chuBaoView1;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
        self.userInteractionEnabled = YES;
        self.image = JobsIMG(@"0B2D074D-A661-4476-8536-E2D7EA4E41D3");
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
                        @selector(languageSwitchNotification:),
                        LanguageSwitchNotification,
                        nil);
//        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    MakeDataNull
    self.imgV.alpha = 1;
//    self.titleLab.alpha = 1;
    self.withdrawBtn.alpha = 1;
    self.rechargeBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(92));
}
#pragma mark —— lazyLoad
-(UIImageView *)imgV{
    if(!_imgV){
        _imgV = UIImageView.new;
        _imgV.image = JobsIMG(@"FAFB4239-814A-436E-8C3B-3B18D88B1D53");
        [self addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(23), JobsWidth(23)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(16));
        }];
    }return _imgV;
}

//-(JobsUpDownLab *)titleLab{
//    if(!_titleLab){
//        _titleLab = JobsUpDownLab.new;
//        [self addSubview:_titleLab];
//        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.imgV.mas_right).offset(JobsWidth(8));
//            make.top.equalTo(self).offset(JobsWidth(24));
//        }];
//        [_titleLab richElementsInViewWithModel:self.titleLabModel];
//        [self layoutIfNeeded];
//    }return _titleLab;
//}

-(BaseButton *)withdrawBtn{
    if (!_withdrawBtn) {
        _withdrawBtn = BaseButton.new;
        _withdrawBtn.backgroundColor = RGBA_COLOR(136, 79, 2, 1);
        _withdrawBtn.normalTitle = Internationalization(@"提现");
        _withdrawBtn.titleFont = UIFontWeightBoldSize(12);
        _withdrawBtn.normalTitleColor =  JobsWhiteColor;
        [self addSubview:_withdrawBtn];
        [_withdrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
        [_withdrawBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        
        @jobs_weakify(self)
        [_withdrawBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"提现")];
            return nil;
        }];
        
    }return _rechargeBtn;
}

-(BaseButton *)rechargeBtn{
    if (!_rechargeBtn) {
        _rechargeBtn = BaseButton.new;
        _rechargeBtn.backgroundColor = JobsWhiteColor;
        _rechargeBtn.normalTitle = Internationalization(@"充值");
        _rechargeBtn.titleFont = UIFontWeightBoldSize(12);
        _rechargeBtn.normalTitleColor = RGBA_COLOR(136, 79, 2, 1);
        [self addSubview:_rechargeBtn];
        [_rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-104));
        }];
        [_rechargeBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        [_rechargeBtn layerBorderCor:RGBA_COLOR(136, 79, 2, 1) andBorderWidth:1];
        @jobs_weakify(self)
        [_rechargeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self forceComingToPushVC:MSTopUpVC.new requestParams:@""];
            return nil;
        }];
        
    }return _rechargeBtn;
}

//-(JobsUpDownLabModel *)titleLabModel{
//    if (!_titleLabModel) {
//        _titleLabModel = JobsUpDownLabModel.new;
//    }
//    
//    _titleLabModel.upLabText = Internationalization(@"我的余额") ;
//    _titleLabModel.upLabTextAlignment = NSTextAlignmentCenter;
//    _titleLabModel.upLabFont = JobsFontRegular(12);
//    _titleLabModel.upLabTextCor = RGBA_COLOR(51, 51, 51, 1);
//    _titleLabModel.upLabBgCor = JobsClearColor;
//    
//    _titleLabModel.downLabText = Internationalization(@"324324");
//    _titleLabModel.downLabTextAlignment = NSTextAlignmentCenter;
//    _titleLabModel.downLabFont = JobsFontBold(16);
//    _titleLabModel.downLabTextCor = RGBA_COLOR(236, 86, 40, 1);
//    _titleLabModel.downLabBgCor = JobsClearColor;
//
//    _titleLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _titleLabModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    _titleLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    _titleLabModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    
//    _titleLabModel.space = JobsWidth(3);
//    
//    return _titleLabModel;
//}

@end
