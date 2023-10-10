//
//  MSOrderWaitSentVC.m
//  MataShop
//
//  Created by Jobs Hi on 10/9/23.
//

#import "MSOrderWaitSentVC.h"

@interface MSOrderWaitSentVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <MSOrderModel *>*dataMutArr;

@end

@implementation MSOrderWaitSentVC

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsCor(@"#F8F8F8");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.tableView.alpha = 1;
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
#pragma mark —— 一些私有方法
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
//    @jobs_weakify(self)
//    [self withdrawBanklist:^(NSArray *data) {
//        @jobs_strongify(self)
//        if (data.count) {
//            [self endRefreshing:self.tableView];
//        }else{
//            [self endRefreshingWithNoMoreData:self.tableView];
//        }
//        /// 在reloadData后做的操作，因为reloadData刷新UI是在主线程上，那么就在主线程上等待
//        @jobs_weakify(self)
//        [self getMainQueue:^{
//            @jobs_strongify(self)
//        }];
//    }];
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MSOrderTBVCell cellSizeWithModel:nil].height;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSOrderTBVCell *cell = [MSOrderTBVCell cellStyleDefaultWithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.indexPath = indexPath;
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = AppMainCor_02;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        [self dataLinkByTableView:_tableView];
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
        }
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = Internationalization(@"");
            refreshConfigFooter.pullingTitle = Internationalization(@"");;
            refreshConfigFooter.refreshingTitle = Internationalization(@"");;
            refreshConfigFooter.willRefreshTitle = Internationalization(@"");;
            refreshConfigFooter.noMoreDataTitle = Internationalization(@"");;
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                titleStr:Internationalization(@"暂无数据")
                                                               detailStr:Internationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _tableView.ly_emptyView.titleLabFont = UIFontWeightLightSize(16);
        }
        
//        {/// 设置tabAnimated相关属性
//            // 可以不进行手动初始化，将使用默认属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:MSOrderTBVCell.class
//                                                                  cellHeight:[MSOrderTBVCell cellSizeWithModel:nil].height];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];

    }return _tableView;
}

-(NSMutableArray<MSOrderModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            MSOrderModel *orderModel = MSOrderModel.new;
            orderModel.shopName = @"我的小店";
            orderModel.orderState = JobsOrderState_Evaluate;
            orderModel.goodsTitle = @"醒者乐解酒液醒者乐解酒";
            orderModel.goodsSubTitle = @"类型：课程订单";
            orderModel.orderTime = @"下单时间：2023-04-25 09:14:47";
            orderModel.payType = JobsPayType_AppBalance;
            orderModel.orderAmount = @"￥1999";
            [_dataMutArr addObject:orderModel];
        }
        
        {
            MSOrderModel *orderModel = MSOrderModel.new;
            orderModel.shopName = @"你的小店";
            orderModel.orderState = JobsOrderState_WaitReceived;
            orderModel.goodsTitle = @"钥匙扣";
            orderModel.goodsSubTitle = @"类型：课程订单";
            orderModel.orderTime = @"下单时间：2023-04-25 09:14:47";
            orderModel.payType = JobsPayType_MataValue;
            orderModel.orderAmount = @"￥223";
            [_dataMutArr addObject:orderModel];
        }
        
        {
            MSOrderModel *orderModel = MSOrderModel.new;
            orderModel.shopName = @"他的小店";
            orderModel.orderState = JobsOrderState_Due;
            orderModel.goodsTitle = @"大力丸";
            orderModel.goodsSubTitle = @"类型：课程订单";
            orderModel.orderTime = @"下单时间：2023-04-25 09:14:47";
            orderModel.payType = JobsPayType_MataCreditScore;
            orderModel.orderAmount = @"￥3333";
            [_dataMutArr addObject:orderModel];
        }
    }return _dataMutArr;
}


@end
