//
//  MSMyInfoVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/27/23.
//

#import "MSMyInfoVC.h"

@interface MSMyInfoVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIViewModel *>*>*dataMutArr;

@end

@implementation MSMyInfoVC

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
    
    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = Internationalization(@"个人信息");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.tableView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    [self updateStatusBarCor:JobsOrangeColor];/// 在具体子类实现，不要写在父类
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
    //    [self restoreStatusBarCor];
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
    return self.dataMutArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 0){
        return [MSMyInfoStyle1TBVCell cellHeightWithModel:nil];
    }else if (indexPath.section == 1 && indexPath.row == self.dataMutArr[indexPath.section].count - 1){
        return [MSMyInfoStyle3TBVCell cellHeightWithModel:nil];
    }else{
        return [MSMyInfoStyle2TBVCell cellHeightWithModel:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 0){
        MSMyInfoStyle1TBVCell *cell = [MSMyInfoStyle1TBVCell cellStyleDefaultWithTableView:tableView];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.indexPath = indexPath;
        [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section][indexPath.row]];
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == self.dataMutArr[indexPath.section].count - 1){
        MSMyInfoStyle3TBVCell *cell = [MSMyInfoStyle3TBVCell cellStyleDefaultWithTableView:tableView];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.indexPath = indexPath;
        [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section][indexPath.row]];
        return cell;
    }else{
        MSMyInfoStyle2TBVCell *cell = [MSMyInfoStyle2TBVCell cellStyleDefaultWithTableView:tableView];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.indexPath = indexPath;
        [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section][indexPath.row]];
        return cell;
    }
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
        [_tableView registerHeaderFooterViewClass:MSCommentTableHeaderFooterView.class];
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
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.navigationBar.mas_bottom).offset(JobsWidth(10));
        }];
    }return _tableView;
}

-(NSMutableArray<NSMutableArray<UIViewModel *> *> *)dataMutArr{
    if(!_dataMutArr){
        _dataMutArr = NSMutableArray.array;
        {
            NSMutableArray *arr = NSMutableArray.array;
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"头像");
            viewModel.image = JobsIMG(@"用户默认头像");
            [arr addObject:viewModel];
            [_dataMutArr addObject:arr];
        }
        
        {
            NSMutableArray *arr = NSMutableArray.array;
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"昵称");
                viewModel.subTextModel.text = Internationalization(@"请输入昵称");
                [arr addObject:viewModel];
            }
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"QQ");
                viewModel.subTextModel.text = Internationalization(@"请输入绑定QQ");
                [arr addObject:viewModel];
            }
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"微信");
                viewModel.subTextModel.text = Internationalization(@"请输入绑定微信");
                [arr addObject:viewModel];
            }
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"真实姓名");
                viewModel.subTextModel.text = Internationalization(@"请输入真实姓名");
                [arr addObject:viewModel];
            }
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"身份证号码");
                viewModel.subTextModel.text = Internationalization(@"请输入身份证号码");
                [arr addObject:viewModel];
            }
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"联系电话");
                viewModel.subTextModel.text = Internationalization(@"请输入手机号");
                [arr addObject:viewModel];
            }
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"个性签名");
                viewModel.subTextModel.text = Internationalization(@"简单介绍下自己吧");
                [arr addObject:viewModel];
            }
            [_dataMutArr addObject:arr];
        }
    }return _dataMutArr;
}

@end
