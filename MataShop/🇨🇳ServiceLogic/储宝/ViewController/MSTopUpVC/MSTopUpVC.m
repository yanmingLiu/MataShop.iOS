//
//  MSTopUpVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSTopUpVC.h"

@interface MSTopUpVC ()
/// UI
@property(nonatomic,strong)JXCategoryTitleView *categoryView;
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;

@end

@implementation MSTopUpVC

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
    self.viewModel.textModel.textCor = RGBA_COLOR(51, 51, 51, 1);
    self.viewModel.textModel.text = Internationalization(@"充值");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
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
#pragma mark JXCategoryTitleViewDataSource
//// 如果将JXCategoryTitleView嵌套进UITableView的cell，每次重用的时候，JXCategoryTitleView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该代理方法返回给JXCategoryTitleView。
//// 如果实现了该方法就以该方法返回的宽度为准，不触发内部默认的文字宽度计算。
//- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView
//               widthForTitle:(NSString *)title{
//
//    return 10;
//}
#pragma mark JXCategoryListContainerViewDelegate
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
#pragma mark JXCategoryViewDelegate
//传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
     [self.listContainerView didClickSelectedItemAtIndex:index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{}
//传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
scrollingFromLeftIndex:(NSInteger)leftIndex
        toRightIndex:(NSInteger)rightIndex
               ratio:(CGFloat)ratio {
    NSLog(@"");
//    [self.listContainerView scrollingFromLeftIndex:leftIndex
//                                      toRightIndex:rightIndex
//                                             ratio:ratio
//                                     selectedIndex:categoryView.selectedIndex];
}
#pragma mark —— lazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.delegate = self;
        _categoryView.backgroundColor = JobsClearColor;
        _categoryView.titleSelectedColor = RGBA_COLOR(51, 51, 51, 1);
        _categoryView.titleColor = RGBA_COLOR(102, 102, 102, 1);
        _categoryView.titleFont = UIFontWeightRegularSize(14);
        _categoryView.titleSelectedFont = UIFontWeightBoldSize(16);
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.contentScrollView = self.listContainerView.scrollView;// 关联cotentScrollView，关联之后才可以互相联动！！!
        _categoryView.indicators = @[self.lineView];
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        }];
        [self.view layoutIfNeeded];
        NSLog(@"");
    }return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.indicatorColor = RGBA_COLOR(247, 181, 0, 1);
        _lineView.indicatorHeight = JobsWidth(4);
        _lineView.indicatorWidthIncrement = JobsWidth(10);
        _lineView.verticalMargin = 0;
    }return _lineView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        [self.view addSubview:_listContainerView];
        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.view);
            make.top.equalTo(self.navigationBar.mas_bottom).offset(listContainerViewDefaultOffset);
            make.left.right.bottom.equalTo(self.view);
            
        }];
        [self.view layoutIfNeeded];
    }return _listContainerView;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        [_childVCMutArr addObject:MSWechatTopUpVC.new];// 微信支付
        [_childVCMutArr addObject:MSAlipayTopUpVC.new];// 支付宝支付
        [_childVCMutArr addObject:MSBankCardTopUpVC.new];// 银行卡支付
    }return _childVCMutArr;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:Internationalization(@"微信")];
        [_titleMutArr addObject:Internationalization(@"支付宝")];
        [_titleMutArr addObject:Internationalization(@"银行卡")];
    }return _titleMutArr;
}

@end
