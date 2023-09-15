//
//  MSHomeVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSHomeVC.h"

BOOL ISLogin;
@interface MSHomeVC ()
/// UI
@property(nonatomic,strong)MSSearchBoardView *searchBoardView;
@property(nonatomic,strong)BaiShaETProjMarqueeView *marqueeView;
@property(nonatomic,strong)MS3rdShopLinkView *shopLinkView;

@property(nonatomic,strong)MSHomePopupView *popupView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data


@property(nonatomic,strong)NSMutableArray <MSProdShowModel *>*cvCellDataMutArr;
@property(nonatomic,strong)NSArray *__block dataArr;

@end

@implementation MSHomeVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView{
    [super loadView];
    self.bgImage = nil;
    ISLogin = self.isLogin;
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    self.searchBoardView.alpha = 1;
    self.marqueeView.alpha = 1;
    self.shopLinkView.alpha = 1;

    self.collectionView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    /// 首页弹框
//    [getMainWindow() popupWithView:[self jobsPopView:BaiShaETProjPopupView11.class
//                                           viewModel:UIViewModel.new]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
    @jobs_weakify(self)
    [self withdrawBanklist:^(NSArray *data) {
        @jobs_strongify(self)
        if (data.count) {
            [self endRefreshing:self.collectionView];
        }else{
            [self endRefreshingWithNoMoreData:self.collectionView];
        }
    }];
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MSProdShowCVCell *cell = [MSProdShowCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.cvCellDataMutArr[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.cvCellDataMutArr.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
viewForSupplementaryElementOfKind:(NSString *)kind
atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        MSHomeCollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:MSHomeCollectionReusableView.class
                                                                                                             forIndexPath:indexPath];
        
        [headerView richElementsInViewWithModel:nil];
        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        ReturnBaseCollectionReusableView
    }else ReturnBaseCollectionReusableView;
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
    NSLog(@"%s", __FUNCTION__);
    /**
     滚动到指定位置
     _collectionView.contentOffset = CGPointMake(0,-100);
     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
     */
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
    return [MSHomeCollectionReusableView collectionReusableViewSizeWithModel:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [MSProdShowCVCell cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(13);
}
/// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(13);
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(JobsWidth(13));
}
#pragma mark —— lazyLoad
-(MSSearchBoardView *)searchBoardView{
    if (!_searchBoardView) {
        _searchBoardView = [MSSearchBoardView.alloc initWithSize:[MSSearchBoardView viewSizeWithModel:nil]];
        [_searchBoardView richElementsInViewWithModel:nil];
        [self.view addSubview:_searchBoardView];
        [_searchBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSSearchBoardView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsStatusBarHeightByAppleIncData());
        }];
    }return _searchBoardView;
}

-(BaiShaETProjMarqueeView *)marqueeView{
    if (!_marqueeView) {
        _marqueeView = [BaiShaETProjMarqueeView.alloc initWithSize:[BaiShaETProjMarqueeView viewSizeWithModel:nil]];
        [_marqueeView richElementsInViewWithModel:nil];
        [self.view addSubview:_marqueeView];
        [_marqueeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([BaiShaETProjMarqueeView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.searchBoardView.mas_bottom).offset(JobsWidth(10));
        }];
    }return _marqueeView;
}

-(MS3rdShopLinkView *)shopLinkView{
    if(!_shopLinkView){
        _shopLinkView = MS3rdShopLinkView.new;
        [_shopLinkView richElementsInViewWithModel:nil];
        [self.view addSubview:_shopLinkView];
        [_shopLinkView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MS3rdShopLinkView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.marqueeView.mas_bottom);
        }];
    }return _shopLinkView;
}

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
        _collectionView.backgroundColor = RGB_SAMECOLOR(245);
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
//        _collectionView.contentInset = jobsSameEdgeInset(JobsWidth(13));
        [_collectionView registerCollectionViewClass];

        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中...");
            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = Internationalization(@"上拉加载更多");
            refreshConfigFooter.pullingTitle = Internationalization(@"上拉加载更多");
            refreshConfigFooter.refreshingTitle = Internationalization(@"上拉加载更多");
            refreshConfigFooter.willRefreshTitle = Internationalization(@"加载数据中...");
            refreshConfigFooter.noMoreDataTitle = Internationalization(@"上拉加载更多");
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _collectionView.mj_header = self.mjRefreshNormalHeader;
            _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
            
            _collectionView.mj_footer = self.mjRefreshAutoNormalFooter;
        }
        
        {
            _collectionView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                     titleStr:Internationalization(@"暂无数据")
                                                                    detailStr:Internationalization(@"")];
            
            _collectionView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _collectionView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _collectionView.ly_emptyView.titleLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightMedium];
        }
        
//        {
//            NSArray *classArray = @[
//                MSProdShowCVCell.class
//            ];
//            NSArray *sizeArray = @[
//                [NSValue valueWithCGSize:[MSProdShowCVCell cellSizeWithModel:nil]],
//            ];
//            
//            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
//                                                                              cellSizeArray:sizeArray
//                                                                         animatedCountArray:@[@(1),@(1),@(1),@(1)]];
//            
//            [_collectionView.tabAnimated addHeaderViewClass:MSProdShowCVCell.class
//                                                   viewSize:[MSProdShowCVCell cellSizeWithModel:nil]
//                                                  toSection:0];
//            _collectionView.tabAnimated.containNestAnimation = YES;
//            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            _collectionView.tabAnimated.canLoadAgain = YES;
//            [_collectionView tab_startAnimation];// 开启动画
//        }
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(JobsMainScreen_WIDTH());
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.shopLinkView.mas_bottom);
            make.bottom.equalTo(self.view);
        }];
    }return _collectionView;
}

-(NSMutableArray<MSProdShowModel *> *)cvCellDataMutArr{
    if (!_cvCellDataMutArr) {
        _cvCellDataMutArr = NSMutableArray.array;
        
        {
            MSProdShowModel *model = MSProdShowModel.new;
            model.prodIMG = JobsIMG(@"商品占位图1");
            model.prodIMGURL = @"";
            model.prodName = Internationalization(@"天然羊羔毛外套");
            model.prodPrice = @"￥ 8549.33";
            [_cvCellDataMutArr addObject:model];
        }
        
        {
            MSProdShowModel *model = MSProdShowModel.new;
            model.prodIMG = JobsIMG(@"商品占位图1");
            model.prodIMGURL = @"";
            model.prodName = Internationalization(@"幻龙无线");
            model.prodPrice = @"￥ 333.33";
            [_cvCellDataMutArr addObject:model];
        }
        
        {
            MSProdShowModel *model = MSProdShowModel.new;
            model.prodIMG = JobsIMG(@"商品占位图1");
            model.prodIMGURL = @"";
            model.prodName = Internationalization(@"杰士邦");
            model.prodPrice = @"￥ 555.33";
            [_cvCellDataMutArr addObject:model];
        }
        
        {
            MSProdShowModel *model = MSProdShowModel.new;
            model.prodIMG = JobsIMG(@"商品占位图1");
            model.prodIMGURL = @"";
            model.prodName = Internationalization(@"蛋糕");
            model.prodPrice = @"￥ 1111.33";
            [_cvCellDataMutArr addObject:model];
        }
    }return _cvCellDataMutArr;
}

@end
