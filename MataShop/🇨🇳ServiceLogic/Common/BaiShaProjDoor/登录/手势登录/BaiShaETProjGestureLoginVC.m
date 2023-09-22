//
//  BaiShaETProjGestureLoginVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import "BaiShaETProjGestureLoginVC.h"

@interface BaiShaETProjGestureLoginVC ()

@property(nonatomic,strong)UIButton *accAndPasswordEntryBtn;

@end

@implementation BaiShaETProjGestureLoginVC

- (void)dealloc{
//    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.bgImage = [UIImage imageWithColor:UIColor.whiteColor];/// 仅在loadView中配置有效
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
//    [self setGKNav];
//    [self setGKNavBackBtn];
    
//    self.titleLab.alpha = 1;
    [self 重定义父类控件的距离];
    self.accAndPasswordEntryBtn.alpha = 1;
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
#pragma mark —— 私有方法
-(void)重定义父类控件的距离{
    UIImageView *headIcon = self.valueForKeyBlock(@"headIcon");
    ZLGestureLockIndicator *gestureLockIndicator = self.valueForKeyBlock(@"gestureLockIndicator");
    UILabel *statusLabel = self.valueForKeyBlock(@"statusLabel");
    UILabel *nameLabel = self.valueForKeyBlock(@"nameLabel");
    
    CGFloat offset = JobsWidth(170);
    
    headIcon.y += JobsWidth(offset);
    gestureLockIndicator.y += JobsWidth(offset);
    statusLabel.y += JobsWidth(offset);
    nameLabel.y += JobsWidth(offset);
}
#pragma mark —— lazyLoad
-(UIButton *)accAndPasswordEntryBtn{
    if (!_accAndPasswordEntryBtn) {
        _accAndPasswordEntryBtn = UIButton.new;
        _accAndPasswordEntryBtn.normalTitle = Internationalization(@"账号密码登录");
        _accAndPasswordEntryBtn.titleFont = UIFontWeightBoldSize(16);
        _accAndPasswordEntryBtn.normalTitleColor = HEXCOLOR(0xAE8330);
        @jobs_weakify(self)
        [_accAndPasswordEntryBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"账号密码登录");
//            [self JobsTestPopView:@"账号密码登录"];
        }];
        [self.view addSubview:_accAndPasswordEntryBtn];
        [_accAndPasswordEntryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(JobsWidth(-49));
            make.centerX.equalTo(self.view);
        }];
        [_accAndPasswordEntryBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _accAndPasswordEntryBtn;
}

@end
