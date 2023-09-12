//
//  MSInterestSettleRecordVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSInterestSettleRecordVC.h"

@interface MSInterestSettleRecordVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MSInterestSettleRecordVC

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
    @jobs_weakify(self)
    MSInterestSettleRecordCVC *cell = [MSInterestSettleRecordCVC cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 1;
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
    return [MSInterestSettleRecordCVC cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(12);
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
    return jobsSameEdgeInset(6);
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
            MSInterestSettleRecordModel *prodSelectModel = MSInterestSettleRecordModel.new;
            {
                prodSelectModel.prodName = Internationalization(@"日日盈");
                prodSelectModel.prodPrice = @"￥888.99";
                prodSelectModel.prodInterestSettledYesterday = @"3445.33";
                prodSelectModel.prodInterestSettledAll = @"456";
                prodSelectModel.prodTimeTips = Internationalization(@"购买时间：2023.2.4 23:44:20");
                prodSelectModel.prodStyle = ProdStyle01;
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.data = prodSelectModel;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            MSInterestSettleRecordModel *prodSelectModel = MSInterestSettleRecordModel.new;
            {
                prodSelectModel.prodName = Internationalization(@"周宝");
                prodSelectModel.prodPrice = @"￥888.99";
                prodSelectModel.prodDailyRate = @"3.33%";
                prodSelectModel.prodExpectedIncome = @"456";
                prodSelectModel.prodTimeTips = Internationalization(@"购买时间：2023.2.4 23:44:20\n到期释放时间：2023.1.23");
                prodSelectModel.prodStyle = ProdStyle02;
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.data = prodSelectModel;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            MSInterestSettleRecordModel *prodSelectModel = MSInterestSettleRecordModel.new;
            {
                prodSelectModel.prodName = Internationalization(@"月月舒");
                prodSelectModel.prodPrice = @"￥888.99";
                prodSelectModel.prodDailyRate = @"3.33%";
                prodSelectModel.prodExpectedIncome = @"456";
                prodSelectModel.prodEarnedIncome = @"3444";
                prodSelectModel.prodTimeTips = Internationalization(@"购买时间：2023.2.4 23:44:20\n到期释放时间：2023.1.23");
                prodSelectModel.prodStyle = ProdStyle03;
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.data = prodSelectModel;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            MSInterestSettleRecordModel *prodSelectModel = MSInterestSettleRecordModel.new;
            {
                prodSelectModel.prodName = Internationalization(@"半年享");
                prodSelectModel.prodPrice = @"￥888.99";
                prodSelectModel.prodDailyRate = @"3.33%";
                prodSelectModel.prodExpectedIncome = @"456";
                prodSelectModel.prodEarnedIncome = @"3444";
                prodSelectModel.prodTimeTips = Internationalization(@"购买时间：2023.2.4 23:44:20\n到期释放时间：2023.1.23");
                prodSelectModel.prodStyle = ProdStyle02;
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.data = prodSelectModel;
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

@end
