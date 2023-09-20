//
//  BaiShaETProjVerifyLoginVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import "BaiShaETProjVerifyLoginVC.h"

@interface BaiShaETProjVerifyLoginVC ()

@property(nonatomic,strong)JobsUpDownLab *titleLab;
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyle_7 *选择区号并输入手机号;
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyle_9 *获取并输入手机验证码;
@property(nonatomic,strong)UIButton *checkNowBtn;

@end

@implementation BaiShaETProjVerifyLoginVC

@synthesize bgImageView = _bgImageView;

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
//    [self setGKNav];
//    [self setGKNavBackBtn];
    
    self.bgImageView.alpha = 1;
    self.titleLab.alpha = 1;
    self.选择区号并输入手机号.alpha = 1;
    self.获取并输入手机验证码.alpha = 1;
    self.checkNowBtn.alpha = 1;
    
    self.separateLab.alpha = 1;
    self.联系客服.alpha = 1;
    self.立即注册.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = UIImageView.new;
        _bgImageView.image = JobsIMG(@"IP地址");
        _bgImageView.userInteractionEnabled = YES;
        [self.view addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsWidth(86));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(95)));
        }];
    }return _bgImageView;
}

-(JobsUpDownLab *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsUpDownLab.new;
        [self.view addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImageView.mas_bottom).offset(JobsWidth(24));
            make.centerX.equalTo(self.view);
        }];
        
        {
            JobsUpDownLabModel *upDownLabModel = JobsUpDownLabModel.new;
            upDownLabModel.upLabText = Internationalization(@"登入異常");
            upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(20)
                                                weight:UIFontWeightBold];
            upDownLabModel.upLabTextCor = UIColor.blackColor;
            upDownLabModel.upLabBgCor = UIColor.clearColor;
            
            upDownLabModel.downLabText = Internationalization(@"您登入的不是常用IP, 請驗證手機號碼");
            upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(16)
                                                  weight:UIFontWeightRegular];
            upDownLabModel.downLabTextCor = HEXCOLOR(0xB0B0B0);
            upDownLabModel.downLabBgCor = UIColor.clearColor;
            
            upDownLabModel.space = JobsWidth(12);
            
            upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
            upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
            upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            
            [_titleLab richElementsInViewWithModel:upDownLabModel];
        }
    }return _titleLab;
}

-(JobsAppDoorInputViewBaseStyle_7 *)选择区号并输入手机号{
    if (!_选择区号并输入手机号) {
        _选择区号并输入手机号 = JobsAppDoorInputViewBaseStyle_7.new;
        [self.view addSubview:_选择区号并输入手机号];
        @jobs_weakify(self)
        [_选择区号并输入手机号 actionObjectBlock:^(JobsAppDoorInputViewTFModel *data) {
            @jobs_strongify(self)
//            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
//                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
//                self.newsWithdrawPassword = model.resString;
//            }
        }];
        
        [self.view addSubview:_选择区号并输入手机号];
        [_选择区号并输入手机号 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(inputSize());
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(72));
        }];
        
        _选择区号并输入手机号.layer.cornerRadius = JobsWidth(52 / 2);
        _选择区号并输入手机号.layer.borderColor = HEXCOLOR(0xEEE2C8).CGColor;
        
        JobsAppDoorInputViewBaseStyleModel *配置选择区号并输入手机号 = JobsAppDoorInputViewBaseStyleModel.new;
        配置选择区号并输入手机号.leftViewIMG = JobsIMG(@"小手机图标");
        配置选择区号并输入手机号.placeHolderStr = Internationalization(@"请输入您的手机号");
//        配置选择区号并输入手机号.placeholderColor = HEXCOLOR(0xC4C4C4);
        配置选择区号并输入手机号.placeholderFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
        配置选择区号并输入手机号.isShowDelBtn = YES;
        配置选择区号并输入手机号.isShowSecurityBtn = NO;
        配置选择区号并输入手机号.returnKeyType = UIReturnKeyDone;
        配置选择区号并输入手机号.keyboardAppearance = UIKeyboardAppearanceAlert;
        配置选择区号并输入手机号.leftViewMode = UITextFieldViewModeAlways;
        配置选择区号并输入手机号.moveDistance = JobsWidth(60);
        配置选择区号并输入手机号.titleStrCor = 配置选择区号并输入手机号.placeholderColor = HEXCOLOR_ALPHA(0xC4C4C4,1.f);
//        配置选择区号并输入手机号.background = JobsIMG(@"设置弹出框输入框背景图");
        [_选择区号并输入手机号 richElementsInViewWithModel:配置选择区号并输入手机号];
        
    }return _选择区号并输入手机号;
}

-(JobsAppDoorInputViewBaseStyle_9 *)获取并输入手机验证码{
    if (!_获取并输入手机验证码) {
        _获取并输入手机验证码 = [JobsAppDoorInputViewBaseStyle_9.alloc initWithSize:inputSize()];
        _获取并输入手机验证码.countDownBtnWidth = JobsWidth(80);
        _获取并输入手机验证码.textFieldWidth = JobsWidth(220);
        @jobs_weakify(self)
        [_获取并输入手机验证码 actionObjectBlock:^(JobsAppDoorInputViewTFModel *data) {
            @jobs_strongify(self)
//            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
//                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
//                self.newsWithdrawPassword = model.resString;
//            }
        }];
        
        [self.view addSubview:_获取并输入手机验证码];
        [_获取并输入手机验证码 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(_获取并输入手机验证码.thisViewSize);
            make.top.equalTo(self.选择区号并输入手机号.mas_bottom).offset(JobsWidth(32));
        }];
        
        _获取并输入手机验证码.layer.cornerRadius = JobsWidth(52 / 2);
        _获取并输入手机验证码.layer.borderColor = HEXCOLOR(0xEEE2C8).CGColor;
        
        JobsAppDoorInputViewBaseStyleModel *配置验证码输入 = JobsAppDoorInputViewBaseStyleModel.new;
        配置验证码输入.leftViewIMG = JobsIMG(@"安全");
        配置验证码输入.placeHolderStr = Internationalization(@"請輸入驗證碼");
        配置验证码输入.placeholderFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
        配置验证码输入.isShowDelBtn = YES;
        配置验证码输入.isShowSecurityBtn = NO;
        配置验证码输入.returnKeyType = UIReturnKeyDone;
        配置验证码输入.keyboardAppearance = UIKeyboardAppearanceAlert;
        配置验证码输入.leftViewMode = UITextFieldViewModeAlways;
        配置验证码输入.titleStrCor = 配置验证码输入.placeholderColor = HEXCOLOR_ALPHA(0xC4C4C4,1.f);
//        配置验证码输入.fieldEditorOffset = JobsWidth(80);
        [_获取并输入手机验证码 richElementsInViewWithModel:配置验证码输入];
        
    }return _获取并输入手机验证码;
}

-(UIButton *)checkNowBtn{
    if (!_checkNowBtn) {
        _checkNowBtn = UIButton.new;
        _checkNowBtn.normalTitle = Internationalization(@"立即验证");
        _checkNowBtn.normalBackgroundImage = JobsIMG(@"立即验证");
        [self.view addSubview:_checkNowBtn];
        [_checkNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(40)));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.获取并输入手机验证码.mas_bottom).offset(JobsWidth(36));
        }];
        @jobs_weakify(self)
        [_checkNowBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [self JobsTestPopView:Internationalization(@"立即验证")];
        }];
    }return _checkNowBtn;
}

@end



