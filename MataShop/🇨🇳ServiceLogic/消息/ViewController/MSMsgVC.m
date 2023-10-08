//
//  MSMsgVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSMsgVC.h"

@interface MSMsgVC ()

@end

@implementation MSMsgVC

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
    
    //    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
    //    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    //    self.viewModel.textModel.text = Internationalization(@"消息详情页");
    //    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    //
    //    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
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


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self forceComingToPushVC:MSDoorVC.new requestParams:nil];
//    [self forceComingToPushVC:MSSignInVC.new requestParams:@""];//签到
//    [self forceComingToPushVC:MSRedEnvelopeDetailVC.new requestParams:@""];//助力红包
//    [jobsGetMainWindow() popupWithView:[self jobsPopView:MSPayView.class viewModel:UIViewModel.new]];//zhifu 
}
#pragma mark —— lazyLoad

@end
