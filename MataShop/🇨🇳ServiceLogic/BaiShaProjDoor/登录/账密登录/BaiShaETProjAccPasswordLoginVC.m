//
//  BaiShaETProjAccPasswordLoginVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import "BaiShaETProjAccPasswordLoginVC.h"

@interface BaiShaETProjAccPasswordLoginVC ()
/// UI
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyle_3 *用户名输入框;
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyle_3 *密码输入框;
@property(nonatomic,strong)UIButton *rememberPasswordBtn;
@property(nonatomic,strong)UIButton *forgetPasswordBtn;
@property(nonatomic,strong)UIButton *立即试玩按钮;
@property(nonatomic,strong)UIButton *登入按钮;
/// Data

@end

@implementation BaiShaETProjAccPasswordLoginVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.bgImage = JobsIMG(@"登录注册背景板");/// 仅在loadView中配置有效
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsWhiteColor;
    self.titleLab.alpha = 1;
    self.用户名输入框.alpha = 1;
    self.密码输入框.alpha = 1;
    self.rememberPasswordBtn.alpha = 1;
    self.forgetPasswordBtn.alpha = 1;
    self.立即试玩按钮.alpha = 1;
    self.登入按钮.alpha = 1;
    
    self.separateLab.alpha = 1;
    self.联系客服.alpha = 1;
    self.立即注册.alpha = 1;

//    [self setGKNav];
//    [self setGKNavBackBtn];
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
-(JobsAppDoorInputViewBaseStyle_3 *)用户名输入框{
    if (!_用户名输入框) {
        _用户名输入框 = JobsAppDoorInputViewBaseStyle_3.new;
        @jobs_weakify(self)
        [_用户名输入框 actionObjectBlock:^(JobsAppDoorInputViewTFModel *data) {
            @jobs_strongify(self)
//            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
//                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
//                self.confirmWithdrawPassword = model.resString;
//            }
        }];
        
        [self.view addSubview:_用户名输入框];
        [_用户名输入框 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(inputSize());
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(85));
        }];
        
        _用户名输入框.layer.cornerRadius = inputSize().height / 2;
        _用户名输入框.layer.borderWidth = 1.f;
        _用户名输入框.layer.borderColor = HEXCOLOR(0xEEE2C8).CGColor;
        
        JobsAppDoorInputViewBaseStyleModel *配置用户名输入框 = JobsAppDoorInputViewBaseStyleModel.new;
        配置用户名输入框.leftViewIMG = JobsIMG(@"用户名");
        配置用户名输入框.placeHolderStr = Internationalization(@"请输入您的用户名");
        配置用户名输入框.placeholderFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
        配置用户名输入框.placeholderColor = HEXCOLOR(0xC4C4C4);
        配置用户名输入框.placeHolderOffset = JobsWidth(35);
        配置用户名输入框.leftViewOffsetX = JobsWidth(10);
        配置用户名输入框.isShowDelBtn = YES;
        配置用户名输入框.isShowSecurityBtn = NO;
        配置用户名输入框.returnKeyType = UIReturnKeyDone;
        配置用户名输入框.keyboardAppearance = UIKeyboardAppearanceAlert;
        配置用户名输入框.leftViewMode = UITextFieldViewModeAlways;
        配置用户名输入框.moveDistance = JobsWidth(40);
        配置用户名输入框.titleStrCor = 配置用户名输入框.placeholderColor = HEXCOLOR(0x524740);
        配置用户名输入框.background = JobsIMG(@"设置弹出框输入框背景图");
        配置用户名输入框.animationColor = HEXCOLOR(0xF2CC78);

        [_用户名输入框 richElementsInViewWithModel:配置用户名输入框];
    }return _用户名输入框;
}

-(JobsAppDoorInputViewBaseStyle_3 *)密码输入框{
    if (!_密码输入框) {
        _密码输入框 = JobsAppDoorInputViewBaseStyle_3.new;
        @jobs_weakify(self)
        [_密码输入框 actionObjectBlock:^(JobsAppDoorInputViewTFModel *data) {
            @jobs_strongify(self)
//            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
//                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
//                self.confirmWithdrawPassword = model.resString;
//            }
        }];
        
        [self.view addSubview:_密码输入框];
        [_密码输入框 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(inputSize());
            make.top.equalTo(self.用户名输入框.mas_bottom).offset(JobsWidth(30));
        }];
        
        _密码输入框.layer.cornerRadius = inputSize().height / 2;
        _密码输入框.layer.borderWidth = 1.f;
        _密码输入框.layer.borderColor = HEXCOLOR(0xEEE2C8).CGColor;
        
        JobsAppDoorInputViewBaseStyleModel *配置密码输入框 = JobsAppDoorInputViewBaseStyleModel.new;
        配置密码输入框.leftViewIMG = JobsIMG(@"密码锁");
        配置密码输入框.placeHolderStr = Internationalization(@"请输入你的密码");
        配置密码输入框.placeholderFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
        配置密码输入框.placeholderColor = HEXCOLOR(0xC4C4C4);
        配置密码输入框.placeHolderOffset = JobsWidth(35);
        配置密码输入框.leftViewOffsetX = JobsWidth(10);
        配置密码输入框.isShowDelBtn = YES;
        配置密码输入框.isShowSecurityBtn = YES;
        配置密码输入框.returnKeyType = UIReturnKeyDone;
        配置密码输入框.keyboardAppearance = UIKeyboardAppearanceAlert;
        配置密码输入框.leftViewMode = UITextFieldViewModeAlways;
        配置密码输入框.moveDistance = JobsWidth(40);
        配置密码输入框.titleStrCor = 配置密码输入框.placeholderColor = HEXCOLOR(0x524740);
        配置密码输入框.background = JobsIMG(@"设置弹出框输入框背景图");
        配置密码输入框.selectedSecurityBtnIMG = JobsIMG(@"睁眼");
        配置密码输入框.unSelectedSecurityBtnIMG = JobsIMG(@"闭眼");// 默认
        配置密码输入框.animationColor = HEXCOLOR(0xF2CC78);
        
        [_密码输入框 richElementsInViewWithModel:配置密码输入框];
    }return _密码输入框;
}

-(UIButton *)rememberPasswordBtn{
    if (!_rememberPasswordBtn) {
        _rememberPasswordBtn = UIButton.new;
        _rememberPasswordBtn.selected = YES;
        [_rememberPasswordBtn handelAdjustsImageWhenHighlighted];
        _rememberPasswordBtn.normalImage = JobsIMG(@"按钮未选中");
        _rememberPasswordBtn.selectedImage = JobsIMG(@"按钮已选中");
        _rememberPasswordBtn.normalTitle = Internationalization(@"記住密碼");
        _rememberPasswordBtn.titleFont = UIFontWeightRegularSize(14);
        _rememberPasswordBtn.normalTitleColor = HEXCOLOR(0x757575);
        [self.view addSubview:_rememberPasswordBtn];
        [_rememberPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.密码输入框.mas_bottom).offset(JobsWidth(16));
            make.left.equalTo(self.view).offset(JobsWidth(40));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(14 + 12 + 56), JobsWidth(14)));
        }];
        @jobs_weakify(self)
        [_rememberPasswordBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"记住密码");
            x.selected = !x.selected;
            [self JobsTestPopView:@"记住密码"];
        }];
        [_rememberPasswordBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleLeft
                                              imageTitleSpace:JobsWidth(5)];
    }return _rememberPasswordBtn;
}

-(UIButton *)forgetPasswordBtn{
    if (!_forgetPasswordBtn) {
        _forgetPasswordBtn = UIButton.new;
        [_forgetPasswordBtn handelAdjustsImageWhenHighlighted];
        _forgetPasswordBtn.normalImage = JobsIMG(@"按钮未选中");
        _forgetPasswordBtn.selectedImage = JobsIMG(@"按钮已选中");
        _forgetPasswordBtn.normalTitle = Internationalization(@"忘记密碼");
        _forgetPasswordBtn.titleFont = UIFontWeightRegularSize(14);
        _forgetPasswordBtn.normalTitleColor = HEXCOLOR(0x757575);
        [self.view addSubview:_forgetPasswordBtn];
        [_forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.密码输入框.mas_bottom).offset(JobsWidth(16));
            make.right.equalTo(self.view).offset(JobsWidth(-40));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(14 + 12 + 56), JobsWidth(14)));
        }];
        @jobs_weakify(self)
        [_forgetPasswordBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"忘记密碼");
            x.selected = !x.selected;
            [self JobsTestPopView:@"忘记密碼"];
        }];
        [_forgetPasswordBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleLeft
                                            imageTitleSpace:JobsWidth(5)];
    }return _forgetPasswordBtn;
}

-(UIButton *)立即试玩按钮{
    if (!_立即试玩按钮) {
        _立即试玩按钮 = UIButton.new;
        [_立即试玩按钮 handelAdjustsImageWhenHighlighted];
        _立即试玩按钮.normalBackgroundImage = JobsIMG(@"立即试玩按钮");
        _立即试玩按钮.selectedBackgroundImage = JobsIMG(@"立即试玩按钮");
        _立即试玩按钮.normalTitle = Internationalization(@"立即试玩");
        _立即试玩按钮.normalTitleColor = HEXCOLOR(0xAE8330);
        _立即试玩按钮.titleFont = UIFontWeightRegularSize(18);
        [self.view addSubview:_立即试玩按钮];
        [_立即试玩按钮 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.rememberPasswordBtn.mas_bottom).offset(JobsWidth(32));
            make.left.equalTo(self.view).offset(JobsWidth(16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(135), JobsWidth(40)));
        }];
        [_立即试玩按钮 btnClickEventBlock:^(UIButton *x) {
            NSLog(@"立即试玩");
            x.selected = !x.selected;
            [self JobsTestPopView:@"立即试玩"];
        }];
    }return _立即试玩按钮;
}

-(UIButton *)登入按钮{
    if (!_登入按钮) {
        _登入按钮 = UIButton.new;
        [_登入按钮 handelAdjustsImageWhenHighlighted];
        _登入按钮.normalBackgroundImage = JobsIMG(@"登入按钮");
        _登入按钮.selectedBackgroundImage = JobsIMG(@"登入按钮");
        _登入按钮.normalTitle = Internationalization(@"登入按钮");
        _登入按钮.normalTitleColor = UIColor.blackColor;
        _登入按钮.titleFont = UIFontWeightRegularSize(18);
        [self.view addSubview:_登入按钮];
        [_登入按钮 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.rememberPasswordBtn.mas_bottom).offset(JobsWidth(32));
            make.right.equalTo(self.view).offset(JobsWidth(-16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(190), JobsWidth(40)));
        }];
        @jobs_weakify(self)
        [_登入按钮 btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"登入按钮");
            x.selected = !x.selected;
            [self JobsTestPopView:@"登入按钮"];
        }];
    }return _立即试玩按钮;
}

@end
