//
//  MSMineVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSMineVC.h"

@interface MSMineVC ()
/// UI
@property(nonatomic,strong)MSMineView1 *view1;
@property(nonatomic,strong)MSMineView3 *view3;
@property(nonatomic,strong)MSMineView4 *view4;
@property(nonatomic,strong)MSMineView5 *view5;
/// Data

@end

@implementation MSMineVC

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsCor(@"#F5F5F5");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.view1.alpha = 1;
    self.view3.alpha = 1;
    self.view4.alpha = 1;
    self.view5.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateStatusBarCor:JobsCor(@"#E81C12")];/// 在具体子类实现，不要写在父类
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
-(MSMineView1 *)view1{
    if(!_view1){
        _view1 = MSMineView1.new;
        [self.view addSubview:_view1];
        [_view1 richElementsInViewWithModel:nil];
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSMineView1 viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view);
        }];
    }return _view1;
}

-(MSMineView3 *)view3{
    if(!_view3){
        _view3 = MSMineView3.new;
        [self.view addSubview:_view3];
        [_view3 richElementsInViewWithModel:nil];
        [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSMineView3 viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view1.mas_bottom);
        }];
    }return _view3;
}

-(MSMineView4 *)view4{
    if(!_view4){
        _view4 = MSMineView4.new;
        [self.view addSubview:_view4];
        [_view4 richElementsInViewWithModel:nil];
        [_view4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSMineView4 viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view3.mas_bottom).offset(JobsWidth(5));
        }];
    }return _view4;
}

-(MSMineView5 *)view5{
    if(!_view5){
        _view5 = MSMineView5.new;
        [self.view addSubview:_view5];
        [_view5 richElementsInViewWithModel:nil];
        [_view5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSMineView5 viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view4.mas_bottom).offset(JobsWidth(5));
        }];
    }return _view5;
}

@end
