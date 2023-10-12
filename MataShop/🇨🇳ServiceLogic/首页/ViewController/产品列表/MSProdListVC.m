//
//  MSProdListVC.m
//  MataShop
//
//  Created by Jobs Hi on 10/8/23.
//

#import "MSProdListVC.h"

@interface MSProdListVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <MSProdShowModel *>*cvCellDataMutArr;

@end

@implementation MSProdListVC

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
    self.viewModel.textModel.text = Internationalization(@"产品列表");
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
    self.collectionView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateStatusBarCor:JobsCor(@"#EA2D19")];/// 在具体子类实现，不要写在父类
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
    MSProdListCVCell *cell = [MSProdListCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
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
    return [MSProdListCVCell cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(7);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
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
//                MSProdListCVCell.class
//            ];
//            NSArray *sizeArray = @[
//                [NSValue valueWithCGSize:[MSProdListCVCell cellSizeWithModel:nil]],
//            ];
//
//            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
//                                                                              cellSizeArray:sizeArray
//                                                                         animatedCountArray:@[@(1),@(1),@(1),@(1)]];
//
//            [_collectionView.tabAnimated addHeaderViewClass:MSProdListCVCell.class
//                                                   viewSize:[MSProdListCVCell cellSizeWithModel:nil]
//                                                  toSection:0];
//            _collectionView.tabAnimated.containNestAnimation = YES;
//            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            _collectionView.tabAnimated.canLoadAgain = YES;
//            [_collectionView tab_startAnimation];// 开启动画
//        }

        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(13));
        }];
    }return _collectionView;
}

-(NSMutableArray<MSProdShowModel *> *)cvCellDataMutArr{
    if (!_cvCellDataMutArr) {
        _cvCellDataMutArr = NSMutableArray.array;

        {
            MSProdShowModel *model = MSProdShowModel.new;
            
            model.prodIMG = JobsIMG(@"商品占位图1");/// 商品图
            model.prodIMGURL = @"";/// 商品图URL
            model.prodTitle = Internationalization(@"纯之素 一次性抽取式全棉加厚洗脸巾卸…");/// 商品名
            model.prodSubTitle = Internationalization(@"宿迁千毛美装商城…");
            model.prodPrice = @"￥6".resetStringByFontAndTailStrings(@"",Internationalization(@"到手价"));/// 商品折扣价(实际卖价)
            model.prodSubPrice = @"￥126";/// 商品原价
            model.prodSales = [NSString stringWithFormat:@"%dw+已付款",2];/// 商品销量
            
            [_cvCellDataMutArr addObject:model];
        }

        {
            MSProdShowModel *model = MSProdShowModel.new;
            
            model.prodIMG = JobsIMG(@"商品占位图1");/// 商品图
            model.prodIMGURL = @"";/// 商品图URL
            model.prodTitle = Internationalization(@"纯之素 一次性抽取式全棉加厚洗脸巾卸…");/// 商品名
            model.prodSubTitle = Internationalization(@"宿迁千毛美装商城…");
            model.prodPrice = @"￥6".resetStringByFontAndTailStrings(@"",Internationalization(@"到手价"));/// 商品折扣价(实际卖价)
            model.prodSubPrice = @"￥126";/// 商品原价
            model.prodSales = [NSString stringWithFormat:@"%dw+已付款",2];/// 商品销量
            
            [_cvCellDataMutArr addObject:model];
        }

        {
            MSProdShowModel *model = MSProdShowModel.new;
            
            model.prodIMG = JobsIMG(@"商品占位图1");/// 商品图
            model.prodIMGURL = @"";/// 商品图URL
            model.prodTitle = Internationalization(@"纯之素 一次性抽取式全棉加厚洗脸巾卸…");/// 商品名
            model.prodSubTitle = Internationalization(@"宿迁千毛美装商城…");
            model.prodPrice = @"￥6".resetStringByFontAndTailStrings(@"",Internationalization(@"到手价"));/// 商品折扣价(实际卖价)
            model.prodSubPrice = @"￥126";/// 商品原价
            model.prodSales = [NSString stringWithFormat:@"%dw+已付款",2];/// 商品销量
            
            [_cvCellDataMutArr addObject:model];
        }

        {
            MSProdShowModel *model = MSProdShowModel.new;
            
            model.prodIMG = JobsIMG(@"商品占位图1");/// 商品图
            model.prodIMGURL = @"";/// 商品图URL
            model.prodTitle = Internationalization(@"纯之素 一次性抽取式全棉加厚洗脸巾卸…");/// 商品名
            model.prodSubTitle = Internationalization(@"宿迁千毛美装商城…");
            model.prodPrice = @"￥6".resetStringByFontAndTailStrings(@"",Internationalization(@"到手价"));/// 商品折扣价(实际卖价)
            model.prodSubPrice = @"￥126";/// 商品原价
            model.prodSales = [NSString stringWithFormat:@"%dw+已付款",2];/// 商品销量
            
            [_cvCellDataMutArr addObject:model];
        }
    }return _cvCellDataMutArr;
}

@end
