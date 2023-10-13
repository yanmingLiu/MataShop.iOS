//
//  MSBankCardTopUpVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSBankCardTopUpVC.h"

@interface MSBankCardTopUpVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MSBankCardTopUpVC

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
    
    self.view.backgroundColor = JobsCor(@"#F5F5F5");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    
    self.collectionView.alpha = 1;
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
    @jobs_weakify(self)
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
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JobsBtnStyleCVCell *cell = [JobsBtnStyleCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr.count;
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
    return CGSizeMake(JobsWidth(JobsWidth(60)), JobsWidth(84));
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(30);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = RGB_SAMECOLOR(246);
        [self dataLinkByCollectionView:_collectionView];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;///设置为NO，使得collectionView只能上拉，不能下拉
    
        [_collectionView registerCollectionViewClass];
        [_collectionView registerCollectionViewCellClass:JobsBtnStyleCVCell.class];
        
        {
            _collectionView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                     titleStr:Internationalization(@"暂无数据")
                                                                    detailStr:Internationalization(@"")];
            
            _collectionView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _collectionView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _collectionView.ly_emptyView.titleLabFont = UIFontWeightMediumSize(16);
        }
        
//        {
//            
//            NSArray *classArray = @[
//                JobsBtnStyleCVCell.class
//            ];
//            NSArray *sizeArray = @[
//                [NSValue valueWithCGSize:[JobsBtnStyleCVCell cellSizeWithModel:nil]]
//            ];
//            
//            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
//                                                                              cellSizeArray:sizeArray
//                                                                         animatedCountArray:@[@(1)]];
//            
//            [_collectionView.tabAnimated addHeaderViewClass:JobsBtnStyleCVCell.class
//                                                   viewSize:[JobsBtnStyleCVCell collectionReusableViewSizeWithModel:nil]
//                                                  toSection:0];
//            
//            _collectionView.tabAnimated.containNestAnimation = YES;
//            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            _collectionView.tabAnimated.canLoadAgain = YES;
//            [_collectionView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsWidth(20));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(335), JobsWidth(84)));
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(@"银行卡充值");
            viewModel.textModel.text = Internationalization(@"银行卡1");
            viewModel.imageTitleSpace = JobsWidth(6);
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(@"银行卡充值");
            viewModel.textModel.text = Internationalization(@"银行卡2");
            viewModel.imageTitleSpace = JobsWidth(6);
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(@"银行卡充值");
            viewModel.textModel.text = Internationalization(@"银行卡3");
            viewModel.imageTitleSpace = JobsWidth(6);
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(@"银行卡充值");
            viewModel.textModel.text = Internationalization(@"银行卡4");
            viewModel.imageTitleSpace = JobsWidth(6);
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(@"银行卡充值");
            viewModel.textModel.text = Internationalization(@"银行卡5");
            viewModel.imageTitleSpace = JobsWidth(6);
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(@"银行卡充值");
            viewModel.textModel.text = Internationalization(@"银行卡6");
            viewModel.imageTitleSpace = JobsWidth(6);
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}


@end
