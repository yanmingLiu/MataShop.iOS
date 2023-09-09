//
//  BaiShaETProjInfoBoardView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjInfoBoardView.h"

@interface BaiShaETProjInfoBoardView (){
    CGSize userRankLabSize;
}
/// UI
@property(nonatomic,strong)UILabel *userNameLab;
@property(nonatomic,strong)UILabel *userRankLab;
@property(nonatomic,strong)UIButton *rechargeBtn;
@property(nonatomic,strong)UIButton *withdrawalBtn;
@property(nonatomic,strong)UIButton *refreshBtn;
@property(nonatomic,strong)UIColor *cor;
/// Data

@end

@implementation BaiShaETProjInfoBoardView

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_InfoBoardViewOnceToken = 0;
    static_infoBoardView = nil;
}

static BaiShaETProjInfoBoardView *static_infoBoardView = nil;
static dispatch_once_t static_InfoBoardViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_InfoBoardViewOnceToken, ^{
        static_infoBoardView = BaiShaETProjInfoBoardView.new;
    });return static_infoBoardView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
        userRankLabSize = CGSizeMake(JobsWidth(43), JobsWidth(20));
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        userRankLabSize = CGSizeMake(JobsWidth(43), JobsWidth(20));
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
        userRankLabSize = CGSizeMake(JobsWidth(43), JobsWidth(20));
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = UIColor.whiteColor;
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.userNameLab.alpha = 1;
    self.userRankLab.alpha = 1;
    self.withdrawalBtn.alpha = 1;
    self.rechargeBtn.alpha = 1;
    self.refreshBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(102));
}
#pragma mark —— lazyLoad
-(UILabel *)userNameLab{
    if (!_userNameLab) {
        _userNameLab = UILabel.new;
        _userNameLab.text = Internationalization(@"sdefvgbfcxcx");
        [self addSubview:_userNameLab];
        [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(16));
            make.top.equalTo(self).offset(JobsWidth(26));
            make.height.mas_equalTo(JobsWidth(14));
        }];
        [_userNameLab makeLabelByShowingType:UILabelShowingType_03];
    }return _userNameLab;
}

-(UILabel *)userRankLab{
    if (!_userRankLab) {
        _userRankLab = UILabel.new;
        _userRankLab.backgroundColor = self.cor;
        _userRankLab.textColor = HEXCOLOR(0xAE8330);
        _userRankLab.text = Internationalization(@"VIP 0");
        _userRankLab.font = UIFontWeightRegularSize(14);
        [self addSubview:_userRankLab];
        [_userRankLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.userNameLab);
            make.left.equalTo(self.userNameLab.mas_right).offset(JobsWidth(12));
        }];
    }return _userRankLab;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        _refreshBtn = UIButton.new;
        _refreshBtn.normalTitle = Internationalization(@"0.00");
        _refreshBtn.titleFont = UIFontWeightBoldSize(20);
        _refreshBtn.normalTitleColor = HEXCOLOR(0x3D4A58);
        _refreshBtn.normalImage = JobsIMG(@"首页_刷新按钮");
        [self addSubview:_refreshBtn];
        [_refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(20)));
            make.top.equalTo(self.userNameLab.mas_bottom).offset(JobsWidth(12));
            make.left.equalTo(self.userNameLab);
        }];
        [self layoutIfNeeded];
        [_refreshBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleLeft imageTitleSpace:JobsWidth(14)];
        @jobs_weakify(self)
        [_refreshBtn btnClickEventBlock:^(id data) {
            @jobs_strongify(self)
            [self JobsTestPopView:@"首页刷新"];
        }];
    }return _refreshBtn;
}

-(UIButton *)withdrawalBtn{
    if (!_withdrawalBtn) {
        _withdrawalBtn = UIButton.new;
        _withdrawalBtn.normalTitle = Internationalization(@"取款");
        _withdrawalBtn.titleFont = UIFontWeightBoldSize(12);
        _withdrawalBtn.normalTitleColor = HEXCOLOR(0xB0B0B0);
        _withdrawalBtn.normalImage = JobsIMG(@"首页_取款按钮");
        [self addSubview:_withdrawalBtn];
        [_withdrawalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(60)));
            make.top.equalTo(self.userNameLab);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
//        [self layoutIfNeeded];
        [_withdrawalBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:JobsWidth(8)];
        @jobs_weakify(self)
        [_withdrawalBtn btnClickEventBlock:^(id data) {
            @jobs_strongify(self)
//            [self forceComingToPushVC:BaiShaETProjWithdrawalsVC.new requestParams:UIViewModel.new];
        }];
    }return _withdrawalBtn;
}

-(UIButton *)rechargeBtn{
    if (!_rechargeBtn) {
        _rechargeBtn = UIButton.new;
        _rechargeBtn.normalTitle = Internationalization(@"充值");
        _rechargeBtn.titleFont = UIFontWeightBoldSize(12);
        _rechargeBtn.normalTitleColor = HEXCOLOR(0xB0B0B0);
        _rechargeBtn.normalImage = JobsIMG(@"首页_充值按钮");
        [self addSubview:_rechargeBtn];
        [_rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(60)));
            make.top.equalTo(self.userNameLab);
            make.right.equalTo(self).offset(JobsWidth(-68));
        }];
//        [self layoutIfNeeded];
        [_rechargeBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:JobsWidth(8)];
        @jobs_weakify(self)
        [_rechargeBtn btnClickEventBlock:^(id data) {
            @jobs_strongify(self)
//            [self forceComingToPushVC:BaiShaETProjTopupVC.new requestParams:UIViewModel.new];
        }];
    }return _rechargeBtn;
}

-(UIColor *)cor{
    if (!_cor) {
        _cor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xFFEABA),HEXCOLOR(0xF2CD7A)]]
                                   startPoint:CGPointZero
                                     endPoint:CGPointZero
                                       opaque:NO
                               targetViewRect:CGRectMake(0, 0, userRankLabSize.width, userRankLabSize.height)];
    }return _cor;
}

@end
