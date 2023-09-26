//
//  MSPromotionIncentiveVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSPromotionIncentiveVC.h"

@interface MSPromotionIncentiveVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MSPromotionIncentiveVC

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
#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    MSPromotionIncentiveModel *promotionIncentiveModel = (MSPromotionIncentiveModel *)self.dataMutArr[section].data;
    return 1;
//    return promotionIncentiveModel.incentiveDetailModelMutArr.count + 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    @jobs_weakify(self)
    MSPromotionIncentiveModel *promotionIncentiveModel = (MSPromotionIncentiveModel *)self.dataMutArr[indexPath.section].data;
    promotionIncentiveModel.indexPath = indexPath;
    MSPromotionIncentiveCVCell *cell = [MSPromotionIncentiveCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    
    if(indexPath.row){
        MSPromotionIncentiveDetailModel *incentiveDetailModel = (MSPromotionIncentiveDetailModel *)[promotionIncentiveModel.incentiveDetailModelMutArr objectAtIndex:indexPath.row - 1];
        incentiveDetailModel.indexPath = indexPath;
        [cell richElementsInCellWithModel:promotionIncentiveModel.incentiveDetailModelMutArr[indexPath.row - 1]];
    }else{
        MSPromotionIncentiveDetailModel *incentiveDetailModel = (MSPromotionIncentiveDetailModel *)[promotionIncentiveModel.incentiveDetailModelMutArr objectAtIndex:indexPath.row];
        incentiveDetailModel.indexPath = indexPath;
        [cell richElementsInCellWithModel:promotionIncentiveModel.incentiveDetailModelMutArr[indexPath.row]];
    }return cell;
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
    return [MSPromotionIncentiveCVCell cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(0);
}
/// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return section ? jobsSameEdgeInset(6) : jobsSameEdgeInset(12);
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
        _collectionView.backgroundColor = HEXCOLOR(0xFCFBFB);
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerCollectionViewClass];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, JobsWidth(288), 0);
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");

            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = Internationalization(@"");
            refreshConfigFooter.pullingTitle = Internationalization(@"");
            refreshConfigFooter.refreshingTitle = Internationalization(@"");
            refreshConfigFooter.willRefreshTitle = Internationalization(@"");
            refreshConfigFooter.noMoreDataTitle = Internationalization(@"");

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
            _collectionView.ly_emptyView.titleLabFont = UIFontWeightRegularSize(16);
        }
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self.view);
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            MSPromotionIncentiveModel *promotionIncentiveModel = MSPromotionIncentiveModel.new;
            {
                NSMutableArray *dataMutArr = NSMutableArray.array;
                {
                    MSPromotionIncentiveDetailModel *incentiveDetailModel = MSPromotionIncentiveDetailModel.new;
                    incentiveDetailModel.myIncentiveTypeNameStr = Internationalization(@"我的直推奖励");
                    incentiveDetailModel.myIncentiveDetailNameStr = Internationalization(@"我的储宝账户余额 + 推荐购买盈利*5%");
                    incentiveDetailModel.userNameStr = Internationalization(@"下级用户：王老三（购买）");
                    incentiveDetailModel.timeStr = Internationalization(@"2023.2.4 23:44:20");
                    [dataMutArr addObject:incentiveDetailModel];
                }
                
                {
                    MSPromotionIncentiveDetailModel *incentiveDetailModel = MSPromotionIncentiveDetailModel.new;
                    incentiveDetailModel.myIncentiveTypeNameStr = Internationalization(@"我的直推奖励");
                    incentiveDetailModel.myIncentiveDetailNameStr = Internationalization(@"我的储宝账户余额 + 推荐购买盈利*5%");
                    incentiveDetailModel.userNameStr = Internationalization(@"下级用户：王老三（购买）");
                    incentiveDetailModel.timeStr = Internationalization(@"2023.2.4 23:44:20");
                    [dataMutArr addObject:incentiveDetailModel];
                }
                promotionIncentiveModel.incentiveDetailModelMutArr = dataMutArr;

            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.data = promotionIncentiveModel;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            MSPromotionIncentiveModel *promotionIncentiveModel = MSPromotionIncentiveModel.new;
            {
                NSMutableArray *dataMutArr = NSMutableArray.array;
                {
                    MSPromotionIncentiveDetailModel *incentiveDetailModel = MSPromotionIncentiveDetailModel.new;
                    incentiveDetailModel.myIncentiveTypeNameStr = Internationalization(@"我的间推奖励");
                    incentiveDetailModel.myIncentiveDetailNameStr = Internationalization(@"我的储宝账户余额 + 推荐购买盈利*5%");
                    incentiveDetailModel.userNameStr = Internationalization(@"下级用户：王老三（购买）");
                    incentiveDetailModel.timeStr = Internationalization(@"2023.2.4 23:44:20");
                    [dataMutArr addObject:incentiveDetailModel];
                }
                
                {
                    MSPromotionIncentiveDetailModel *incentiveDetailModel = MSPromotionIncentiveDetailModel.new;
                    incentiveDetailModel.myIncentiveTypeNameStr = Internationalization(@"我的间推奖励");
                    incentiveDetailModel.myIncentiveDetailNameStr = Internationalization(@"我的储宝账户余额 + 推荐购买盈利*5%");
                    incentiveDetailModel.userNameStr = Internationalization(@"下级用户：王老三（购买）");
                    incentiveDetailModel.timeStr = Internationalization(@"2023.2.4 23:44:20");
                    [dataMutArr addObject:incentiveDetailModel];
                }
                
                promotionIncentiveModel.incentiveDetailModelMutArr = dataMutArr;
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.data = promotionIncentiveModel;
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

@end
