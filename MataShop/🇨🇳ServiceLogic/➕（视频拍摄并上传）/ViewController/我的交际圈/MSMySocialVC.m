//
//  MSMySocialVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMySocialVC.h"

@interface MSMySocialVC ()
/// UI
@property(nonatomic,strong)MSMySocialTitleView *mySocialTitleView;

@end

@implementation MSMySocialVC

-(void)dealloc{
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
    self.view.backgroundColor = JobsWhiteColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.mySocialTitleView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
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
-(MSMySocialTitleView *)mySocialTitleView{
    if(!_mySocialTitleView){
        _mySocialTitleView = MSMySocialTitleView.new;
        [_mySocialTitleView richElementsInViewWithModel:nil];
        [self.view addSubview:_mySocialTitleView];
        [_mySocialTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view);
            make.size.mas_equalTo([MSMySocialTitleView viewSizeWithModel:nil]);
        }];
    }return _mySocialTitleView;
}

@end
