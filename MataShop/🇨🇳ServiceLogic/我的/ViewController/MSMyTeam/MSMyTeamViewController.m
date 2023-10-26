//
//  MSMyTeamViewController.m
//  MataShop
//
//  Created by Mac on 2023/10/25.
//

#import "MSMyTeamViewController.h"
#import "MSMyTeamHeadView.h"
@interface MSMyTeamViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) MSMyTeamHeadView *headView;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MSMyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
//    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
//    self.viewModel.textModel.text = Internationalization(@"钱包充值");
    self.viewModel.textModel.textCor = JobsWhiteColor;
    self.view.backgroundColor =JobsCor(@"#f7f7f7");
    self.gk_navigationBar.jobsVisible = NO;
    [self setGKNav];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(240)));
        make.top.equalTo(self.gk_navigationBar.mas_top);
        make.centerX.equalTo(self.view);
    }];
}

-(MSMyTeamHeadView *)headView{
    if (!_headView) {
        _headView = [[MSMyTeamHeadView alloc] init];
        [self.view addSubview:_headView];
        @jobs_weakify(self);
        _headView.objectBlock = ^(id  _Nullable data) {
            @jobs_strongify(self);
            [self.navigationController popViewControllerAnimated:YES];
        };
    }
    return _headView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                               style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
@end
