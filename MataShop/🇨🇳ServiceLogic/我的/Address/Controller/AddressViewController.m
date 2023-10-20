//
//  AddressViewController.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "AddressViewController.h"
#import "AddressCell.h"
#import "AddressViewModel.h"
#import "AddressBottomView.h"

@interface AddressViewController () 
<UITableViewDataSource,
UITableViewDelegate,
AddressCellDelegate>

@property(nonatomic, strong) AddressBottomView *bottomView;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) AddressViewModel *vm;

@end

static CGFloat const bottomH = 49;

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupData];
}

#pragma mark - setupUI

- (void)setupUI {
    self.view.backgroundColor = UIColor.whiteColor;

    self.viewModel.bgCor = UIColor.clearColor;
    self.viewModel.textModel.text = @"收货地址";
    [self setGKNav];
    [self setGKNavBackBtn];

    [self setupListView];
    [self setupAddressBottomView];
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
    [self.tableView registerClass:[AddressCell class] forCellReuseIdentifier:[AddressCell reuseIdentifier]];
    [self.view addSubview:self.tableView];


    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-bottomH);
        make.top.equalTo(self.view).offset(GK_STATUSBAR_NAVBAR_HEIGHT);
    }];

    self.tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"img_empty_shop"
                                                            titleStr:Internationalization(@"暂无数据")
                                                           detailStr:Internationalization(@"")];

    self.tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
    self.tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
    self.tableView.ly_emptyView.titleLabFont = UIFontWeightLightSize(16);
}

- (void)setupAddressBottomView {
    self.bottomView = [[AddressBottomView alloc] init];
    [self.bottomView.addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bottomView];

    CGFloat bottomPadding = GK_SAFEAREA_BTM > 0 ? 0 : 16;
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-bottomPadding);
        make.height.mas_equalTo(bottomH);
    }];
}

#pragma mark - setupData

- (void)setupData {
    self.vm = [[AddressViewModel alloc] init];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:[AddressCell reuseIdentifier] forIndexPath:indexPath];
    cell.delegate = self;
    [cell fill:self.vm.datas[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - AddressCellDelegate


- (void)onTapDefault:(AddressItemViewModel *)viewModel {
    // MARK: - TODO api
    for (AddressItemViewModel *item in self.vm.datas) {
        item.isDefault = NO;
    }
    viewModel.isDefault = YES;
    [self.tableView reloadData];
}

- (void)onTapDelete:(AddressItemViewModel *)viewModel {
    // MARK: - TODO api
    for (AddressItemViewModel *item in self.vm.datas) {
        if (viewModel.id == item.id) {
            [self.vm.datas removeObject:item];
            break;
        }
    }
    [self.tableView reloadData];
}

- (void)onTapEdit:(AddressItemViewModel *)viewModel {
    // MARK: - TODO api

}

#pragma mark - Actions

- (void)addAction {
    // MARK: - TODO api
    __weak typeof(self) wSelf = self;
    [self.vm addAddress:^{
        [wSelf.tableView reloadData];
    }];
}


@end
