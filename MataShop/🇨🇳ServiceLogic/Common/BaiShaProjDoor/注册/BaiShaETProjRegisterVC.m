//
//  BaiShaETProjRegisterVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/12.
//

#import "BaiShaETProjRegisterVC.h"

@interface BaiShaETProjRegisterVC ()

@end

@implementation BaiShaETProjRegisterVC

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
    self.bgImage = JobsIMG(@"登录注册背景板");/// 仅在loadView中配置有效
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsWhiteColor;
    self.titleLab.alpha = 1;

    
    
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

@end
