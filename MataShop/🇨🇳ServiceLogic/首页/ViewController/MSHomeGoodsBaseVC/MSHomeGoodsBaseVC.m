//
//  MSHomeGoodsBaseVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/20/23.
//

#import "MSHomeGoodsBaseVC.h"

@interface MSHomeGoodsBaseVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <MSProdShowModel *>*cvCellDataMutArr;

@end

@implementation MSHomeGoodsBaseVC

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
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.collectionView.alpha = 1;
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
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [MSProdShowCVCell cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(7);
}
/// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(7);
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(JobsWidth(12));
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
            make.edges.equalTo(self.view);
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
