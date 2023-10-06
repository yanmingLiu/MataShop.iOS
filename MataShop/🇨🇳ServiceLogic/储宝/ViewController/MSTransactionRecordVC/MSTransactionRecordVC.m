//
//  MSTransactionRecordVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSTransactionRecordVC.h"

@interface MSTransactionRecordVC ()
/// UI
@property(nonatomic,strong)JXCategoryTitleView *categoryView;
@property(nonatomic,strong)JXCategoryIndicatorBackgroundView *categoryBgView;
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;

@end

@implementation MSTransactionRecordVC

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
    self.categoryView.alpha = 1;
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
#pragma mark —— JXCategoryTitleViewDataSource
//// 如果将JXCategoryTitleView嵌套进UITableView的cell，每次重用的时候，JXCategoryTitleView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该代理方法返回给JXCategoryTitleView。
//// 如果实现了该方法就以该方法返回的宽度为准，不触发内部默认的文字宽度计算。
//- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView
//               widthForTitle:(NSString *)title{
//
//    return 10;
//}
#pragma mark —— JXCategoryListContainerViewDelegate
/**
 返回list的数量

 @param listContainerView 列表的容器视图
 @return list的数量
 */
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
    return self.titleMutArr.count;
}
/**
 根据index初始化一个对应列表实例，需要是遵从`JXCategoryListContentViewDelegate`协议的对象。
 如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIView即可。
 如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIViewController即可。

 @param listContainerView 列表的容器视图
 @param index 目标下标
 @return 遵从JXCategoryListContentViewDelegate协议的list实例
 */
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView
                                          initListForIndex:(NSInteger)index{
    return self.childVCMutArr[index];
}
#pragma mark —— JXCategoryViewDelegate
///【点击的结果】点击选中的情况才会调用该方法。传递didClickSelectedItemAt事件给listContainerView
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}
///【点击选中或者滚动选中的结果】点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView
didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"");
}
///【滚动选中的结果】滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"");
}
/// 传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
scrollingFromLeftIndex:(NSInteger)leftIndex
        toRightIndex:(NSInteger)rightIndex
               ratio:(CGFloat)ratio {
    NSLog(@"");
}
#pragma mark —— lazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.backgroundColor = JobsCor(@"#ECECEC");
        _categoryView.titleSelectedColor = JobsWhiteColor;
        _categoryView.titleColor = JobsCor(@"#333333");
        _categoryView.titleFont = UIFontWeightSemiboldSize(12);
        _categoryView.titleSelectedFont = UIFontWeightSemiboldSize(12);
        _categoryView.delegate = self;
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.categoryBgView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(0);
        _categoryView.cellWidth = JobsWidth(72);
        _categoryView.titleLabelMaskEnabled = YES;
        _categoryView.listContainer = self.listContainerView;
        
        [_categoryView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
        [_categoryView layerBorderCor:JobsClearColor andBorderWidth:1];
        
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(JobsWidth(16));
            make.centerX.equalTo(self.view);
            make.size.mas_offset(CGSizeMake(JobsWidth(216), JobsWidth(28)));
        }];
        [self.view layoutIfNeeded];
    }return _categoryView;
}

-(JXCategoryIndicatorBackgroundView *)categoryBgView{
    if (!_categoryBgView) {
        _categoryBgView = JXCategoryIndicatorBackgroundView.new;
        _categoryBgView.indicatorHeight = JobsWidth(30);
        _categoryBgView.indicatorWidthIncrement = 0;
        _categoryBgView.indicatorWidth = JobsWidth(76);
        _categoryBgView.indicatorColor = JobsCor(@"#333333");
        _categoryBgView.indicatorCornerRadius = 0;
    }return _categoryBgView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        [self.view addSubview:_listContainerView];
        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(-JobsWidth(10));
            make.left.right.bottom.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
    }return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if(!_titleMutArr){
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:Internationalization(@"充值")];
        [_titleMutArr addObject:Internationalization(@"提现")];
        [_titleMutArr addObject:Internationalization(@"购买")];
    }return _titleMutArr;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if(!_childVCMutArr){
        _childVCMutArr = NSMutableArray.array;
        [_childVCMutArr addObject:MSChuBaoTopUpVC.new];/// 储宝.充值
        [_childVCMutArr addObject:MSChuBaoWithdrawVC.new];/// 储宝.提现
        [_childVCMutArr addObject:MSChuBaoBuyVC.new];/// 储宝.购买
    }return _childVCMutArr;
}

@end
