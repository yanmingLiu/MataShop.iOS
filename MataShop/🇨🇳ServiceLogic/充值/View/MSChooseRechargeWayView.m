//
//  MSChooseRechargeWayView.m
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "MSChooseRechargeWayView.h"

@interface MSChooseRechargeWayView ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *submitBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MSChooseRechargeWayView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chooseRechargeWayViewOnceToken = 0;
    static_chooseRechargeWayView = nil;
}

static MSChooseRechargeWayView *static_chooseRechargeWayView = nil;
static dispatch_once_t static_chooseRechargeWayViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chooseRechargeWayViewOnceToken, ^{
        static_chooseRechargeWayView = MSChooseRechargeWayView.new;
    });return static_chooseRechargeWayView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
//        self.tableView.alpha = 1;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
                            @selector(languageSwitchNotification:),
                            LanguageSwitchNotification,
                            nil);
        //        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    JobsLock(self.size = [MSChooseRechargeWayView viewSizeWithModel:nil];)
//    self.tableView.alpha = 1;
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.size = [MSChooseRechargeWayView viewSizeWithModel:nil];
    self.tableView.alpha = 1;
    self.submitBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(375), JobsWidth(532));
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

-(void)tableView:(UITableView *)tableView 
             btn:(UIButton *)btn{
    for (JobsBtnStyleTBVCell *cell in tableView.visibleCells) {
        cell.getRightBtn.selected = NO;
        cell.getRightBtn.jobsResetBtnImage(JobsIMG(@"未选中支付方式"));
    }
    btn.selected = !btn.selected;
    btn.jobsResetBtnImage(btn.selected ? JobsIMG(@"已选中支付方式") : JobsIMG(@"未选中支付方式"));
    UIViewModel *vm = (UIViewModel *)btn.data;
    [self jobsToastMsg:vm.buttonModel.normalTitle];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBtnStyleTBVCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self tableView:tableView btn:cell.getRightBtn];
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
    return [JobsBtnStyleTBVCell cellHeightWithModel:nil];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBtnStyleTBVCell *cell = [JobsBtnStyleTBVCell cellStyleDefaultWithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.indexPath = indexPath;
    cell.getLeftBtn.enabled = NO;
    cell.getRightBtn.enabled = NO;
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    [cell actionObjectBlock:^(id  _Nullable data) {
        
    }];return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return [BaseTableViewHeaderFooterView heightForHeaderInSection:nil];
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    BaseTableViewHeaderFooterView *headerView = BaseTableViewHeaderFooterView.jobsInitWithReuseIdentifier;
    {
        UILabel *titleLab = UILabel.new;
        titleLab.textColor = JobsCor(@"#333333");
        titleLab.font = UIFontWeightBoldSize(18);
        titleLab.text = Internationalization(@"选择支付方式");
        [headerView.contentView addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(headerView.contentView).insets(jobsSameEdgeInset(5));
        }];
    }
    headerView.section = section;// 不写这一句有悬浮
    [headerView richElementsInViewWithModel:nil];
    @jobs_weakify(self)
    [headerView actionObjectBlock:^(id data) {
        @jobs_strongify(self)
    }];return headerView;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStyleGrouped;
        _tableView.backgroundColor = JobsCor(@"#FFFFFF");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        [self dataLinkByTableView:_tableView];
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerHeaderFooterViewClass:MSCommentTableHeaderFooterView.class];
        [_tableView registerTableViewClass];
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
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
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBtnStyleTBVCell.class
//                                                                  cellHeight:[JobsBtnStyleTBVCell cellHeightWithModel:nil]];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(JobsWidth(0));
            make.centerX.equalTo(self);
            make.width.mas_equalTo(JobsMainScreen_WIDTH());
            make.height.mas_equalTo([JobsBtnStyleTBVCell cellHeightWithModel:nil] * self.dataMutArr.count + JobsWidth(65));
        }];
        [self layoutIfNeeded];
        NSLog(@"");
    }return _tableView;
}

-(UIButton *)submitBtn{
    if(!_submitBtn){
        @jobs_weakify(self)
        _submitBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                                   titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:nil
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:Internationalization(@"提交")
                                                         subTitle:nil
                                                        titleFont:UIFontWeightSemiboldSize(18)
                                                     subTitleFont:nil
                                                         titleCor:JobsCor(@"#FFFFFF")
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:JobsCor(@"#EA2918")
                                                     imagePadding:JobsWidth(0)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeNone
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(8)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                                  clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self jobsToastMsg:Internationalization(@"提交")];
            return nil;
        }];
        [self addSubview:_submitBtn];
        [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(335), JobsWidth(50)));
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(JobsWidth(-40));
        }];
    }return _submitBtn;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            {
                UIButtonModel *buttonModel = UIButtonModel.new;
                buttonModel.normalTitle = Internationalization(@"微信（限额 100-999）");
                buttonModel.normalImage = JobsIMG(@"微信充值");
                buttonModel.selectedImage = JobsIMG(@"微信充值");
                buttonModel.titleFont = UIFontWeightMediumSize(16);
                buttonModel.normalTitleColor = JobsCor(@"#333333");
                viewModel.buttonModel = buttonModel;
            }
            
            {
                UIButtonModel *subButtonModel = UIButtonModel.new;
                subButtonModel.normalTitle = Internationalization(@"");
                subButtonModel.normalImage = JobsIMG(@"未选中支付方式");
                subButtonModel.selectedImage = JobsIMG(@"已选中支付方式");
                subButtonModel.titleFont = UIFontWeightMediumSize(16);
                subButtonModel.normalTitleColor = JobsCor(@"#333333");
                subButtonModel.selected = YES;/// 默认选择的支付方式
                viewModel.subButtonModel = subButtonModel;
            }
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            
            {
                UIButtonModel *buttonModel = UIButtonModel.new;
                buttonModel.normalTitle = Internationalization(@"支付宝（限额 200-1500）");
                buttonModel.normalImage = JobsIMG(@"支付宝充值");
                buttonModel.selectedImage = JobsIMG(@"支付宝充值");
                buttonModel.titleFont = UIFontWeightMediumSize(16);
                buttonModel.normalTitleColor = JobsCor(@"#333333");
                viewModel.buttonModel = buttonModel;
            }
            
            {
                UIButtonModel *subButtonModel = UIButtonModel.new;
                subButtonModel.normalTitle = Internationalization(@"");
                subButtonModel.normalImage = JobsIMG(@"未选中支付方式");
                subButtonModel.selectedImage = JobsIMG(@"已选中支付方式");
                viewModel.subButtonModel = subButtonModel;
            }
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            {
                UIButtonModel *buttonModel = UIButtonModel.new;
                buttonModel.normalTitle = Internationalization(@"银联支付（限额 1000-5000）");
                buttonModel.normalImage = JobsIMG(@"银行卡充值");
                buttonModel.selectedImage = JobsIMG(@"银行卡充值");
                buttonModel.titleFont = UIFontWeightMediumSize(16);
                buttonModel.normalTitleColor = JobsCor(@"#333333");
                viewModel.buttonModel = buttonModel;
            }
            
            {
                UIButtonModel *subButtonModel = UIButtonModel.new;
                subButtonModel.normalTitle = Internationalization(@"");
                subButtonModel.normalImage = JobsIMG(@"未选中支付方式");
                subButtonModel.selectedImage = JobsIMG(@"已选中支付方式");
                viewModel.subButtonModel = subButtonModel;
            }
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            {
                UIButtonModel *buttonModel = UIButtonModel.new;
                buttonModel.normalTitle = Internationalization(@"云闪付");
                buttonModel.normalImage = JobsIMG(@"云闪付");
                buttonModel.selectedImage = JobsIMG(@"云闪付");
                buttonModel.titleFont = UIFontWeightMediumSize(16);
                buttonModel.normalTitleColor = JobsCor(@"#333333");
                viewModel.buttonModel = buttonModel;
            }
            
            {
                UIButtonModel *subButtonModel = UIButtonModel.new;
                subButtonModel.normalTitle = Internationalization(@"");
                subButtonModel.normalImage = JobsIMG(@"未选中支付方式");
                subButtonModel.selectedImage = JobsIMG(@"已选中支付方式");
                viewModel.subButtonModel = subButtonModel;
            }
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            {
                UIButtonModel *buttonModel = UIButtonModel.new;
                buttonModel.normalTitle = Internationalization(@"客服代充（推荐）");
                buttonModel.normalImage = JobsIMG(@"客服代充");
                buttonModel.selectedImage = JobsIMG(@"客服代充");
                buttonModel.titleFont = UIFontWeightMediumSize(16);
                buttonModel.normalTitleColor = JobsCor(@"#333333");
                viewModel.buttonModel = buttonModel;
            }
            
            {
                UIButtonModel *subButtonModel = UIButtonModel.new;
                subButtonModel.normalTitle = Internationalization(@"");
                subButtonModel.normalImage = JobsIMG(@"未选中支付方式");
                subButtonModel.selectedImage = JobsIMG(@"已选中支付方式");
                viewModel.subButtonModel = subButtonModel;
            }
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            {
                UIButtonModel *buttonModel = UIButtonModel.new;
                buttonModel.normalTitle = Internationalization(@"USDT（推荐）");
                buttonModel.normalImage = JobsIMG(@"USDT充值");
                buttonModel.selectedImage = JobsIMG(@"USDT充值");
                buttonModel.titleFont = UIFontWeightMediumSize(16);
                buttonModel.normalTitleColor = JobsCor(@"#333333");
                viewModel.buttonModel = buttonModel;
            }
            
            {
                UIButtonModel *subButtonModel = UIButtonModel.new;
                subButtonModel.normalTitle = Internationalization(@"");
                subButtonModel.normalImage = JobsIMG(@"未选中支付方式");
                subButtonModel.selectedImage = JobsIMG(@"已选中支付方式");
                viewModel.subButtonModel = subButtonModel;
            }
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

@end
