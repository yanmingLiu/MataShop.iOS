//
//  SettingViewController.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "SettingViewController.h"
#import "ClearCacheTool.h"
#import "SettingCell.h"

@interface SettingViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *datas;
@property(nonatomic, strong) NSString *cacheSize;

@end


@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupData];
    [self loadData];
}

#pragma mark - setupUI

- (void)setupUI {
    self.view.backgroundColor = UIColor.whiteColor;

    self.viewModel.bgCor = UIColor.clearColor;
    self.viewModel.textModel.text = @"设置";
    [self setGKNav];
    [self setGKNavBackBtn];

    [self setupListView];
}

- (void)setupListView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleInsetGrouped)];
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableView.backgroundColor = JobsCor(@"#F7F7F7");
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 66;
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];

    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    }
    [self.tableView registerClass:[SettingCell class] forCellReuseIdentifier:[SettingCell reuseIdentifier]];
    [self.view addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.top.equalTo(self.view).offset(GK_STATUSBAR_NAVBAR_HEIGHT);
    }];
}

#pragma mark - setupData

- (void)setupData {
    self.datas = @[
        @"关于我们",
        @"清理缓存",
    ];
}

- (void)loadData {
    self.cacheSize = [ClearCacheTool getCacheSize];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:[SettingCell reuseIdentifier] forIndexPath:indexPath];
    cell.textLabel.text = self.datas[indexPath.row];
    cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 1) {
        cell.detailTextLabel.text = self.cacheSize;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    switch (indexPath.row) {
        case 0:
            [self pushAboutUs];
            break;
        case 1:
            [self clearCache];
            break;

        default:
            break;
    }
}

#pragma mark - Actions

- (void)pushAboutUs {

}

- (void)clearCache {
    [ClearCacheTool cleanCacheFinish:^{
        [WHToast showMessage:@"清理缓存成功!" duration:1.0 finishHandler:nil];
        [self loadData];
    }];
}

@end
