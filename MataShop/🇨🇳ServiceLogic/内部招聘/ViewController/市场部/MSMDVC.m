//
//  MSMDVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "MSMDVC.h"

@interface MSMDVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <MSInternalRecruitmentModel *>*dataMutArr;

@end

@implementation MSMDVC

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
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *CVCell = nil;
    if(indexPath.row){
        MSInternalRecruitmentCVCell2 *cell = [MSInternalRecruitmentCVCell2 cellWithCollectionView:collectionView forIndexPath:indexPath];
        [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section]];
        CVCell = cell;
    }else{
        MSInternalRecruitmentCVCell1 *cell = [MSInternalRecruitmentCVCell1 cellWithCollectionView:collectionView forIndexPath:indexPath];
        [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section]];
        CVCell = cell;
    }return CVCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 2;
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
    if(indexPath.row){
        return [MSInternalRecruitmentCVCell2 cellSizeWithModel:self.dataMutArr[indexPath.row]];
    }else return [MSInternalRecruitmentCVCell1 cellSizeWithModel:self.dataMutArr[indexPath.row]];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(0);
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

-(NSMutableArray<MSInternalRecruitmentModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            MSInternalRecruitmentModel *model = MSInternalRecruitmentModel.new;
            model.titleName = Internationalization(@"销售员");/// 职位名称
            NSMutableArray *detailMutArr = NSMutableArray.array;
            {
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"职位（数字资产）");
                    detailModel.value = Internationalization(@"300");
                    [detailMutArr addObject:detailModel];
                }

                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"直招补贴奖励");
                    detailModel.value = Internationalization(@"16%");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"红包助力返点比例");
                    detailModel.value = Internationalization(@"100%");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"助力红包金额");
                    detailModel.value = Internationalization(@"10元");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"间招补贴奖励");
                    detailModel.value = Internationalization(@"递减至50%");
                    [detailMutArr addObject:detailModel];
                }

                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"数字资产释放期限（5年）");
                    detailModel.value = Internationalization(@"每日0.58%");
                    [detailMutArr addObject:detailModel];
                }

                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"职别招聘Mata值（锁仓配额）");
                    detailModel.value = Internationalization(@"6000Mata值");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"KPI招聘考核标准（60Mata值）");
                    detailModel.value = Internationalization(@"90/日");
                    [detailMutArr addObject:detailModel];
                }
            }
            model.detailMutArr = detailMutArr;
            [_dataMutArr addObject:model];
        }
        
        {
            MSInternalRecruitmentModel *model = MSInternalRecruitmentModel.new;
            model.titleName = Internationalization(@"销售主管");/// 职位名称
            NSMutableArray *detailMutArr = NSMutableArray.array;
            {
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"职位（数字资产）");
                    detailModel.value = Internationalization(@"300");
                    [detailMutArr addObject:detailModel];
                }

                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"直招补贴奖励");
                    detailModel.value = Internationalization(@"16%");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"红包助力返点比例");
                    detailModel.value = Internationalization(@"100%");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"助力红包金额");
                    detailModel.value = Internationalization(@"10元");
                    [detailMutArr addObject:detailModel];
                }
                
                {
                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
                    detailModel.title = Internationalization(@"间招补贴奖励");
                    detailModel.value = Internationalization(@"递减至50%");
                    [detailMutArr addObject:detailModel];
                }

//                {
//                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
//                    detailModel.title = Internationalization(@"数字资产释放期限（5年）");
//                    detailModel.value = Internationalization(@"每日0.58%");
//                    [detailMutArr addObject:detailModel];
//                }
//
//                {
//                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
//                    detailModel.title = Internationalization(@"职别招聘Mata值（锁仓配额）");
//                    detailModel.value = Internationalization(@"6000Mata值");
//                    [detailMutArr addObject:detailModel];
//                }
//
//                {
//                    MSInternalRecruitmentDetailModel *detailModel = MSInternalRecruitmentDetailModel.new;
//                    detailModel.title = Internationalization(@"KPI招聘考核标准（60Mata值）");
//                    detailModel.value = Internationalization(@"90/日");
//                    [detailMutArr addObject:detailModel];
//                }
            }
            model.detailMutArr = detailMutArr;
            [_dataMutArr addObject:model];
        }
    }return _dataMutArr;
}

@end
