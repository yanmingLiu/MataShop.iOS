//
//  MSDoorVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import "MSDoorVC.h"

@interface MSDoorVC ()
/// UI
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)JobsUpDownLab *titleLab;
/// Data
@property(nonatomic,strong)JobsUpDownLabModel *titleModel;

@end

@implementation MSDoorVC

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
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
//    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
//    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsCor(@"#FFFFFF");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.logoImageView.alpha = 1;
    self.titleLab.alpha = 1;
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
-(UIImageView *)logoImageView{
    if(!_logoImageView){
        _logoImageView = UIImageView.new;
        /// 添加阴影效果
        _logoImageView.layer.shadowColor = UIColor.blackColor.CGColor; // 阴影颜色
        _logoImageView.layer.shadowOpacity = 0.5; // 阴影不透明度
        _logoImageView.layer.shadowRadius = 5.0; // 阴影半径
        _logoImageView.layer.shadowOffset = CGSizeMake(0, 4); // 阴影偏移量
        
        _logoImageView.image = JobsIMG(@"Logo");
        [self.view addSubview:_logoImageView];
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(100)));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsWidth(70));
        }];
    }return _logoImageView;
}

-(JobsUpDownLab *)titleLab{
    if(!_titleLab){
        _titleLab = JobsUpDownLab.new;
        _titleLab.backgroundColor = JobsRedColor;
        [self.view addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.logoImageView.mas_bottom).offset(JobsWidth(20));
        }];
        [self.view layoutIfNeeded];
        [_titleLab richElementsInViewWithModel:self.titleModel];
    }return _titleLab;
}

-(JobsUpDownLabModel *)titleModel{
    if (!_titleModel) {
        _titleModel = JobsUpDownLabModel.new;
    }
    
    _titleModel.upLabText = Internationalization(@"欢迎来到Mata商城") ;
    _titleModel.upLabTextAlignment = NSTextAlignmentCenter;
    _titleModel.upLabFont = JobsFontBold(26);
    _titleModel.upLabTextCor = JobsCor(@"#333333");
    _titleModel.upLabBgCor = JobsClearColor;
    
    _titleModel.downLabText = Internationalization(@"登陆探索更多潮玩惊喜");
    _titleModel.downLabTextAlignment = NSTextAlignmentCenter;
    _titleModel.downLabFont = JobsFontRegular(12);
    _titleModel.downLabTextCor = JobsCor(@"#666666");
    _titleModel.downLabBgCor = JobsClearColor;

    _titleModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _titleModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _titleModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _titleModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _titleModel.space = JobsWidth(10);
    
    return _titleModel;
}

@end
