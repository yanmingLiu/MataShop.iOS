//
//  NotificationViewController.m
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "NotificationViewController.h"
#import "NotificationViewModel.h"
#import "NotificationCell.h"

@interface NotificationViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NotificationViewModel *vm;
@end

@implementation NotificationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupData];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - setupUI

- (void)setupUI {
    self.view.backgroundColor = UIColor.whiteColor;

    self.viewModel.bgCor = UIColor.clearColor;
    self.viewModel.textModel.text = @"消息通知";
    [self setGKNav];
    [self setGKNavBackBtn];

    [self setupListView];
}

- (void)setupListView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = JobsCor(@"#F7F7F7");
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 130;
    [self.tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    }
    [self.tableView registerClass:[NotificationCell class] forCellReuseIdentifier:[NotificationCell reuseIdentifier]];
    [self.view addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(GK_STATUSBAR_NAVBAR_HEIGHT);
    }];

    self.tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"img_empty_shop"
                                                            titleStr:Internationalization(@"暂无数据")
                                                           detailStr:Internationalization(@"")];

    self.tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
    self.tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
    self.tableView.ly_emptyView.titleLabFont = UIFontWeightLightSize(16);

    __weak typeof(self) ws = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws loadData];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [ws loadMoreData];
    }];
}

#pragma mark - setupData

- (void)setupData {
    self.vm = [[NotificationViewModel alloc] init];
}

#pragma mark - load Data

- (void)loadData {
    __weak typeof(self) ws = self;
    [self.vm loadData:^{
        [ws.tableView.mj_header endRefreshing];
        [ws.tableView.mj_footer endRefreshing];
        [ws.tableView reloadData];
    }];
}

- (void)loadMoreData {
    __weak typeof(self) ws = self;
    [self.vm loadMoreData:^{
        [ws.tableView.mj_header endRefreshing];
        [ws.tableView.mj_footer endRefreshing];
        [ws.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:[NotificationCell reuseIdentifier] forIndexPath:indexPath];
    [cell fill:self.vm.datas[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
