//
//  MSWalletViewController.m
//  MataShop
//
//  Created by Mac on 2023/10/21.
//

#import "MSWalletViewController.h"
#import "MSWalletHeadView.h"
#import "MSWalletRecordVCViewController.h"/// 交易记录
#import "MSWalletContentView.h"
@interface MSWalletViewController ()
@property (nonatomic,strong) MSWalletHeadView *headView;
@property (nonatomic,strong) MSWalletRecordVCViewController *recordVC;
@property (nonatomic,strong) MSWalletContentView *contentView;
@end

@implementation MSWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
    self.viewModel.textModel.text = Internationalization(@"钱包充值");
    self.viewModel.textModel.textCor = JobsWhiteColor;
    self.view.backgroundColor =JobsCor(@"#f7f7f7");
    self.gk_navigationBar.jobsVisible = NO;
    [self setGKNav];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(165)));
        make.top.equalTo(self.gk_navigationBar.mas_top);
        make.centerX.equalTo(self.view);
    }];
    [self._recordVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(JobsMainScreen_WIDTH());
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(10);
        make.bottom.mas_equalTo(JobsTabBarHeightByBottomSafeArea(nil));
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(180);
        make.top.mas_equalTo(self.headView.mas_bottom).offset(-50);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
}

-(MSWalletHeadView *)headView{
    if (!_headView) {
        _headView = [[MSWalletHeadView alloc] init];
        [self.view addSubview:_headView];
        @jobs_weakify(self);
        _headView.objectBlock = ^(id  _Nullable data) {
            @jobs_strongify(self);
            [self.navigationController popViewControllerAnimated:YES];
        };
    }
    return _headView;
}
-(MSWalletRecordVCViewController *)_recordVC{
    if (!_recordVC) {
        _recordVC = [MSWalletRecordVCViewController new];
        [self.view addSubview:_recordVC.view];
    }
    return _recordVC;
}
- (MSWalletContentView *)contentView{
    if (!_contentView) {
        _contentView = [[MSWalletContentView alloc] init];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
