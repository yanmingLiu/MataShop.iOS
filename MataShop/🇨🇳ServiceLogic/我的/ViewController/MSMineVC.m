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
@property(nonatomic,strong)MSMineView2 *view2;
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
    
//    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
//    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//    self.viewModel.textModel.text = Internationalization(@"消息详情页");
//    self.viewModel.textModel.font = notoSansBold(16);
//
//    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsCor(@"#F5F5F5");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    
    self.view1.alpha = 1;
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

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
////    [self forceComingToPushVC:JobsCommentVC.new requestParams:nil];
////    [self forceComingToPushVC:MSPersonalDataVC.new requestParams:nil];
//    [self forceComingToPushVC:MSDoorVC.new requestParams:nil];
//}
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




@end
