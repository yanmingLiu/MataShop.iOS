//
//  MSOrderVC.m
//  MataShop
//
//  Created by Jobs Hi on 10/9/23.
//

#import "MSOrderVC.h"

@interface MSOrderVC ()
/// UI
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)JXCategoryTitleView *categoryView;/// 文字
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*popViewTitleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;
@property(nonatomic,strong)BRStringPickerViewModel *stringPickerViewModel;

@end

@implementation MSOrderVC

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
    self.viewModel.textModel.text = Internationalization(@"订单");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = JobsWhiteColor;/// self.gk_navBackgroundColor 和 self.view.backgroundColor
//    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsWhiteColor;
    [self setGKNav];
//    [self setGKNavBackBtn];
    self.gk_navRightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:self.rightBtn];
    self.gk_navLeftBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:self.leftBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.categoryView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateStatusBarCor:JobsWhiteColor];// 在具体子类实现，不要写在父类
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
///【点击的结果】点击选中的情况才会调用该方法。传递didClickSelectedItemAt事件给listContainerView
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}
///【点击选中或者滚动选中的结果】点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView
didSelectedItemAtIndex:(NSInteger)index {
    
}
///【滚动选中的结果】滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{
    
}
/// 传递scrolling事件给listContainerView，必须调用！！！
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
-(UIButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                                 titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:JobsIMG(@"筛选")
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:nil
                                                       subTitle:nil
                                                      titleFont:nil
                                                   subTitleFont:nil
                                                       titleCor:nil
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:UIColor.whiteColor
                                                   imagePadding:JobsWidth(0)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeNone
                                     contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                       contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                  contentInsets:jobsSameDirectionalEdgeInsets(0)
                                              cornerRadiusValue:JobsWidth(0)
                                                roundingCorners:UIRectCornerAllCorners
                                           roundingCornersRadii:CGSizeZero
                                                 layerBorderCor:nil
                                                    borderWidth:JobsWidth(0)
                                                  primaryAction:nil
                                                clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            self.stringPickerView.alpha = 1;
            [self makeStringPickerViewWithModel:self.stringPickerViewModel
                                    pickerStyle:nil
                                      doneBlock:^{
                NSLog(@"");
            }
                                    resultBlock:^(id data) {
                NSLog(@"");
            }];
            return nil;
        }];
    }return _leftBtn;
}

-(BRStringPickerViewModel *)stringPickerViewModel{
    if(!_stringPickerViewModel){
        _stringPickerViewModel = BRStringPickerViewModel.new;
        _stringPickerViewModel.pickerMode = BRStringPickerComponentSingle;
        _stringPickerViewModel.title = Internationalization(@"筛选");
        _stringPickerViewModel.dataSourceArr = self.popViewTitleMutArr;
        _stringPickerViewModel.selectIndex = 2;
    }return _stringPickerViewModel;
}

-(UIButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                                  titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:JobsIMG(@"客服")
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:nil
                                                        subTitle:nil
                                                       titleFont:nil
                                                    subTitleFont:nil
                                                        titleCor:nil
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:UIColor.whiteColor
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
                                                  imagePlacement:NSDirectionalRectEdgeNone
                                      contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                        contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                   contentInsets:jobsSameDirectionalEdgeInsets(0)
                                               cornerRadiusValue:JobsWidth(0)
                                                 roundingCorners:UIRectCornerAllCorners
                                            roundingCornersRadii:CGSizeZero
                                                  layerBorderCor:nil
                                                     borderWidth:JobsWidth(0)
                                                   primaryAction:nil
                                                 clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastMsg:Internationalization(@"客服")];
            return nil;
        }];
//        _rightBtn.size = CGSizeMake(JobsWidth(50), JobsWidth(50));
    }return _rightBtn;
}

-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.delegate = self;
        _categoryView.backgroundColor = UIColor.whiteColor;
        _categoryView.titleSelectedColor = JobsCor(@"#DD0000");
        _categoryView.titleColor = JobsCor(@"#666666");
        _categoryView.titleFont = UIFontWeightMediumSize(16);
        _categoryView.titleSelectedFont = UIFontWeightSemiboldSize(16);
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.contentScrollView = self.listContainerView.scrollView;//
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        }];
        [self.view layoutIfNeeded];
    }return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.indicatorColor = HEXCOLOR(0xFFEABA);
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
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(listContainerViewDefaultOffset);
            make.left.right.bottom.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
        
        /// ❤️在需要的地方写❤️
        NSNumber *currentIndex = [self.listContainerView valueForKey:@"currentIndex"];
        NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);
        
    }return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:Internationalization(@"全部")];
        [_titleMutArr addObject:Internationalization(@"待付款")];
        [_titleMutArr addObject:Internationalization(@"待发货")];
        [_titleMutArr addObject:Internationalization(@"待收货")];
        [_titleMutArr addObject:Internationalization(@"评价")];
    }return _titleMutArr;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        [_childVCMutArr addObject:MSOrderAllVC.new];/// 订单.全部
        [_childVCMutArr addObject:MSOrderDueVC.new];/// 订单.待付款
        [_childVCMutArr addObject:MSOrderWaitSentVC.new];/// 订单.待发货
        [_childVCMutArr addObject:MSOrderWaitReceivedVC.new];/// 订单.待收货
        [_childVCMutArr addObject:MSOrderEvaluateVC.new];/// 订单.评价
    }return _childVCMutArr;
}

-(MSOrderFilterView *)orderFilterView{
    if(!_orderFilterView){
        _orderFilterView = MSOrderFilterView.new;
        _orderFilterView.size = [MSOrderFilterView viewSizeWithModel:nil];
        [_orderFilterView richElementsInViewWithModel:self.popViewTitleMutArr];
        @jobs_weakify(self)
        [_orderFilterView actionObjectBlock:^(UIButton *data) {
            @jobs_strongify(self)
            if([data.titleForNormalState isKindOfClass:NSString.class]){
                if (data.titleForNormalState.isEqualToString(self.popViewTitleMutArr[0])) {
        
                }else if (data.titleForNormalState.isEqualToString(self.popViewTitleMutArr[1])){
        
                }else if (data.titleForNormalState.isEqualToString(self.popViewTitleMutArr[2])){
                    
                }else{}
            }
            [self.orderFilterView tf_hide];
            [self.orderFilterView.class destroySingleton];
        }];
    }return _orderFilterView;
}

-(NSMutableArray<NSString *> *)popViewTitleMutArr{
    if(!_popViewTitleMutArr){
        _popViewTitleMutArr = NSMutableArray.array;
        [_popViewTitleMutArr addObject:Internationalization(@"商城订单")];
        [_popViewTitleMutArr addObject:Internationalization(@"信用分订单")];
        [_popViewTitleMutArr addObject:Internationalization(@"课程订单")];
    }return _popViewTitleMutArr;
}

@end
