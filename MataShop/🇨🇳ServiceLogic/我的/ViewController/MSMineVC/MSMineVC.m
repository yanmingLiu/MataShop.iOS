//
//  MSMineVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSMineVC.h"

@interface MSMineVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIViewModel *>*>*dataMutArr;

@end

@implementation MSMineVC

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
    
    self.view.backgroundColor = JobsCor(@"#E81C12");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    
    self.collectionView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateStatusBarCor:JobsCor(@"#E81C12")];/// 在具体子类实现，不要写在父类
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
//            [self endRefreshing:self.collectionView];
//        }else{
//            [self endRefreshingWithNoMoreData:self.collectionView];
//        }
//        /// 在reloadData后做的操作，因为reloadData刷新UI是在主线程上，那么就在主线程上等待
//        @jobs_weakify(self)
//        [self getMainQueue:^{
//            @jobs_strongify(self)
//            [CollectionViewAnimationKit showWithAnimationType:XSCollectionViewAnimationTypeFall
//                                               collectionView:self.collectionView];
//        }];
//    }];
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MSMineView6CVCell *cell = [MSMineView6CVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section][indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr[section].count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
viewForSupplementaryElementOfKind:(NSString *)kind
atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        switch (indexPath.section) {
            case 0:{
                MSMineCollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:MSMineCollectionReusableView.class
                                                                                       forIndexPath:indexPath];
                [headerView richElementsInViewWithModel:nil];
                return headerView;
            }break;
            case 1:
            case 2:{
                JobsHeaderFooterView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:JobsHeaderFooterView.class
                                                                                                forIndexPath:indexPath];
                headerView.backgroundColor = JobsCor(@"#F5F5F5");
                [headerView richElementsInViewWithModel:self.dataMutArr.data];
                return headerView;
            }break;
            default:
                ReturnBaseCollectionReusableHeaderView
                break;
        }
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        BaseCollectionReusableView *footerView = [collectionView UICollectionElementKindSectionFooterClass:BaseCollectionReusableView.class forIndexPath:indexPath];
        footerView.backgroundColor = JobsCor(@"#F5F5F5");
        return footerView;
    }else ReturnBaseCollectionReusableHeaderView;
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewModel *viewModel = self.dataMutArr[indexPath.section][indexPath.item];
    [self jobsToastMsg:viewModel.textModel.text];
    
    {
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"钱包"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"我的店铺"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"我的团队"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"信用分数"))){
            
        }
    }
    
    {
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"培训课程"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"我的课件"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"店铺数据"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"实名认证"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"邀请好友"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"分享二维码"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"每日签到"))){
            [self forceComingToPushVC:MSSignInVC.new requestParams:@""];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"邀请领红包"))){
            [self forceComingToPushVC:MSRedEnvelopeDetailVC.new requestParams:@""];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"共享收益"))){
            [self forceComingToPushVC:MSChuBaoVC.new requestParams:@""];
        }
    }
    
    {
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"个人资料"))){
            [self forceComingToPushVC:MSPersonalDataVC.new requestParams:nil];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"意见反馈"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"消息通知"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"收货地址"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"修改密码"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"设置"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"购物车"))){
            
        }
    }
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
/// header 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:{
            return [MSMineCollectionReusableView collectionReusableViewSizeWithModel:nil];
        }break;
        case 1:
        case 2:{
            return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(5));
        }break;
        default:
            return CGSizeZero;
            break;
    }
}
/// Footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(5));
}

- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.cls = self.class;
    return [MSMineView6CVCell cellSizeWithModel:viewModel];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(12);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(15);
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(JobsWidth(6), JobsWidth(15), JobsWidth(6), JobsWidth(15));
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsCor(@"#FFFFFF");
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        [_collectionView registerCollectionViewClass];
        [_collectionView registerCollectionViewCellClass:MSMineView6CVCell.class];
        [_collectionView registerCollectionElementKindSectionHeaderClass:MSMineCollectionReusableView.class];
        [_collectionView registerCollectionElementKindSectionFooterClass:JobsHeaderFooterView.class];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _collectionView;
}

-(NSMutableArray<NSMutableArray<UIViewModel *> *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            NSMutableArray *mutArr = NSMutableArray.array;

            {
                NSMutableArray *headerViewDataMutArr = NSMutableArray.array;
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"1");
                viewModel.textModel.textCor = JobsBlackColor;
                viewModel.textModel.font = UIFontWeightBoldSize(16);
                [headerViewDataMutArr addObject:viewModel];
                mutArr.data = headerViewDataMutArr;
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"钱包");
                viewModel.image = JobsIMG(@"钱包");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的店铺");
                viewModel.image = JobsIMG(@"我的店铺");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的团队");
                viewModel.image = JobsIMG(@"我的团队");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"信用分数");
                viewModel.image = JobsIMG(@"信用分数");
                [mutArr addObject:viewModel];
            }
            
            [_dataMutArr addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            
            {
                NSMutableArray *headerViewDataMutArr = NSMutableArray.array;
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"小助手");
                viewModel.textModel.textCor = JobsBlackColor;
                viewModel.textModel.font = UIFontWeightBoldSize(16);
                [headerViewDataMutArr addObject:viewModel];
                mutArr.data = headerViewDataMutArr;
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"培训课程");
                viewModel.image = JobsIMG(@"培训课程");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的店铺");
                viewModel.image = JobsIMG(@"我的店铺");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的课件");
                viewModel.image = JobsIMG(@"我的课件");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"店铺数据");
                viewModel.image = JobsIMG(@"店铺数据");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"实名认证");
                viewModel.image = JobsIMG(@"实名认证");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"邀请好友");
                viewModel.image = JobsIMG(@"邀请好友");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"分享二维码");
                viewModel.image = JobsIMG(@"分享二维码");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"每日签到");
                viewModel.image = JobsIMG(@"每日签到");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"邀请领红包");
                viewModel.image = JobsIMG(@"邀请领红包");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"共享收益");
                viewModel.image = JobsIMG(@"共享收益");
                [mutArr addObject:viewModel];
            }
            
            [_dataMutArr addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            
            {
                NSMutableArray *headerViewDataMutArr = NSMutableArray.array;
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"服务功能");
                viewModel.textModel.textCor = JobsBlackColor;
                viewModel.textModel.font = UIFontWeightBoldSize(16);
                [headerViewDataMutArr addObject:viewModel];
                mutArr.data = headerViewDataMutArr;
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"个人资料");
                viewModel.image = JobsIMG(@"个人资料");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"意见反馈");
                viewModel.image = JobsIMG(@"意见反馈");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"消息通知");
                viewModel.image = JobsIMG(@"消息通知");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"店铺数据");
                viewModel.image = JobsIMG(@"店铺数据");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"收货地址");
                viewModel.image = JobsIMG(@"收货地址");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"修改密码");
                viewModel.image = JobsIMG(@"修改密码");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"设置");
                viewModel.image = JobsIMG(@"设置");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"购物车");
                viewModel.image = JobsIMG(@"购物车");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"订单");
                viewModel.image = JobsIMG(@"订单");
                [mutArr addObject:viewModel];
            }
            
            [_dataMutArr addObject:mutArr];
        }
    }return _dataMutArr;
}

@end
