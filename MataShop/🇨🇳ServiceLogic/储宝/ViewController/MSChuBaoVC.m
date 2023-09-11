//
//  MSChuBaoVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoVC.h"

@interface MSChuBaoVC ()
/// UI
@property(nonatomic,strong)BaseButton *aboutBtn;
@property(nonatomic,strong)MSChuBaoView1 *chuBaoView1;
@property(nonatomic,strong)MSChuBaoView2 *chuBaoView2;
@property(nonatomic,strong)MSChuBaoAdMarqueeView *marqueeView;
/// Data

@end

@implementation MSChuBaoVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    self.viewModel.backBtnTitleModel.text = @"";
    self.viewModel.textModel.textCor = RGBA_COLOR(51, 51, 51, 1);
    self.viewModel.textModel.text = Internationalization(@"储宝");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    self.viewModel.bgImage = JobsIMG(@"0B2D074D-A661-4476-8536-E2D7EA4E41D3");
    
    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:self.aboutBtn];
    self.gk_navigationBar.jobsVisible = YES;
    
    self.chuBaoView1.alpha = 1;
    self.chuBaoView2.alpha = 1;
    self.marqueeView.alpha = 1;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad
-(BaseButton *)aboutBtn{
    if (!_aboutBtn) {
        _aboutBtn = BaseButton.new;
        _aboutBtn.backgroundColor = JobsClearColor;
        _aboutBtn.normalTitle = Internationalization(@"关于储宝");
        _aboutBtn.normalTitleColor = RGBA_COLOR(51, 51, 51, 1);
        _aboutBtn.titleFont = UIFontWeightRegularSize(14);
        @jobs_weakify(self)
        [_aboutBtn btnClickEventBlock:^(id data) {
            @jobs_strongify(self)
            [WHToast toastErrMsg:Internationalization(@"关于储宝")];
        }];
    }return _aboutBtn;
}

-(MSChuBaoView1 *)chuBaoView1{
    if(!_chuBaoView1){
        _chuBaoView1 = MSChuBaoView1.new;
        [self.view addSubview:_chuBaoView1];
        [_chuBaoView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSChuBaoView1 viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.navigationBar.mas_bottom).offset(JobsWidth(5));
        }];
        [_chuBaoView1 richElementsInViewWithModel:nil];
    }return _chuBaoView1;
}

-(MSChuBaoView2 *)chuBaoView2{
    if(!_chuBaoView2){
        _chuBaoView2 = MSChuBaoView2.new;
        [self.view addSubview:_chuBaoView2];
        [_chuBaoView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSChuBaoView2 viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.chuBaoView1.mas_bottom).offset(JobsWidth(5));
        }];
        [_chuBaoView2 richElementsInViewWithModel:nil];
    }return _chuBaoView2;
}

-(MSChuBaoAdMarqueeView *)marqueeView{
    if (!_marqueeView) {
        _marqueeView = [MSChuBaoAdMarqueeView.alloc initWithSize:[MSChuBaoAdMarqueeView viewSizeWithModel:nil]];
        [_marqueeView richElementsInViewWithModel:nil];
        [self.view addSubview:_marqueeView];
        [_marqueeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSChuBaoAdMarqueeView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.chuBaoView2.mas_bottom).offset(JobsWidth(12));
        }];
    }return _marqueeView;
}

@end
