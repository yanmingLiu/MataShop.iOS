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
@property(nonatomic,strong)WMZBannerView *bannerView;
@property(nonatomic,strong)JXCategoryImageView *categoryView;
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <UIImage *>*dataMutArr;
@property(nonatomic,strong)NSArray *__block dataArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*imageNames;
@property(nonatomic,strong)NSMutableArray <NSString *>*selectedImageNames;

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
//    self.marqueeView.alpha = 1;
    
//    self.bannerParam.wDataSet(self.dataMutArr);
//    [self.bannerView updateUI];
//
//
//    self.categoryView.alpha = 1;
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
    return self.imageNames.count;
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
            make.top.equalTo(self.bannerView.mas_bottom).offset(JobsWidth(10));
        }];
    }return _marqueeView;
}

-(WMZBannerParam *)bannerParam{
    if (!_bannerParam) {
        _bannerParam = BannerParam()
        //自定义视图必传
        .wMyCellClassNameSet(CasinoBannerCell.class.description)
        .wMyCellSet(^UICollectionViewCell *(NSIndexPath *indexPath,
                                            UICollectionView *collectionView,
                                            id model,
                                            UIImageView *bgImageView,
                                            NSArray *dataArr) {
            //自定义视图
            CasinoBannerCell *cell = [CasinoBannerCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            NSString *urlStr = @"";
//            if (![NSString isNullString:self.dataArr[indexPath.item].url] &&
//                ![NSString isNullString:self.readUserInfo.resourcesAddress] ) {
//                urlStr = [self.readUserInfo.resourcesAddress stringByAppendingString:self.dataArr[indexPath.item].url];
//            }
            [cell.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]
                                        placeholderImage:self.dataMutArr[indexPath.item]];
            return cell;
        })
        .wEventClickSet(^(id anyID, NSInteger index) {
            NSLog(@"点击 %@ %ld",anyID,index);
        })
        .wEventCenterClickSet(^(id anyID, NSInteger index,BOOL isCenter,UICollectionViewCell *cell) {
            NSLog(@"判断居中点击");
        })
        .wFrameSet(CGRectMake(0,
                              0,
                              [CasinoBannerCell cellSizeWithModel:nil].width,
                              [CasinoBannerCell cellSizeWithModel:nil].height))
        //图片铺满
        .wImageFillSet(YES)
        //循环滚动
        .wRepeatSet(YES)
        //自动滚动时间
        .wAutoScrollSecondSet(3)
        //自动滚动
        .wAutoScrollSet(YES)
        //cell的位置
        .wPositionSet(BannerCellPositionCenter)
        //分页按钮的选中的颜色
        .wBannerControlSelectColorSet(UIColor.whiteColor)
        //分页按钮的未选中的颜色
        .wBannerControlColorSet(UIColor.lightGrayColor)
        //分页按钮的圆角
        .wBannerControlImageRadiusSet(5)
        //自定义圆点间距
        .wBannerControlSelectMarginSet(3)
        //隐藏分页按钮
        .wHideBannerControlSet(NO)
        //能否拖动
        .wCanFingerSlidingSet(YES);
    }return _bannerParam;
}

-(WMZBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [WMZBannerView.alloc initConfigureWithModel:self.bannerParam];
        [self.view addSubview:_bannerView];
    }return _bannerView;
}

-(NSMutableArray<UIImage *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        [_dataMutArr addObject:JobsIMG(@"滚动广告的临时占位图")];
        [_dataMutArr addObject:JobsIMG(@"Banner-1")];
        [_dataMutArr addObject:JobsIMG(@"Banner-2")];
        [_dataMutArr addObject:JobsIMG(@"Banner-3")];
    }return _dataMutArr;
}

-(JXCategoryImageView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryImageView.new;
        _categoryView.backgroundColor = UIColor.clearColor;
        _categoryView.delegate = self;

        _categoryView.imageNames = self.imageNames;
        _categoryView.selectedImageNames = self.selectedImageNames;
        
        //_categoryView.imageInfoArray = @[@"彩票_已选择",@"电子_已选择",@"棋牌_已选择",@"全部游戏_已选择",@"体育_已选择",@"真人直播_已选择"];
        //@[JobsIMG(@"彩票_已选择"),JobsIMG(@"电子_已选择"),JobsIMG(@"棋牌_已选择"),JobsIMG(@"全部游戏_已选择"),JobsIMG(@"体育_已选择"),JobsIMG(@"真人直播_已选择")];
        //_categoryView.selectedImageInfoArray = @[@"彩票_已选择",@"电子_已选择",@"棋牌_已选择",@"全部游戏_已选择",@"体育_已选择",@"真人直播_已选择"];
        
        _categoryView.imageSize = CGSizeMake(JobsWidth(30), JobsWidth(30));
        _categoryView.imageCornerRadius = JobsWidth(1);
        _categoryView.imageZoomEnabled = YES;
        _categoryView.imageZoomScale = 1.3;

        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.contentScrollView = self.listContainerView.scrollView;//
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchBoardView.mas_bottom).offset(0);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        }];
        [self.view layoutIfNeeded];
    }return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.indicatorColor = JobsWhiteColor;
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
            make.top.equalTo(self.searchBoardView.mas_bottom).offset(listContainerViewDefaultOffset);
            make.left.right.bottom.equalTo(self.view);
            
        }];
        [self.view layoutIfNeeded];
    }return _listContainerView;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        [_childVCMutArr addObject:BaseViewController.new];// 全部游戏
        [_childVCMutArr addObject:BaseViewController.new];// 真人
        [_childVCMutArr addObject:BaseViewController.new];// 体育
        [_childVCMutArr addObject:BaseViewController.new];// 电子
        [_childVCMutArr addObject:BaseViewController.new];// 棋牌
        [_childVCMutArr addObject:BaseViewController.new];// 彩票
    }return _childVCMutArr;
}

-(NSMutableArray<NSString *> *)imageNames{
    if (!_imageNames) {
        _imageNames = NSMutableArray.array;
        [_imageNames addObject:@"全部游戏_未选择"];
        [_imageNames addObject:@"真人直播_未选择"];
        [_imageNames addObject:@"体育_未选择"];
        [_imageNames addObject:@"电子_未选择"];
        [_imageNames addObject:@"棋牌_未选择"];
        [_imageNames addObject:@"彩票_未选择"];
    }return _imageNames;
}

-(NSMutableArray<NSString *> *)selectedImageNames{
    if (!_selectedImageNames) {
        _selectedImageNames = NSMutableArray.array;
        [_selectedImageNames addObject:@"全部游戏_已选择"];
        [_selectedImageNames addObject:@"真人直播_已选择"];
        [_selectedImageNames addObject:@"体育_已选择"];
        [_selectedImageNames addObject:@"电子_已选择"];
        [_selectedImageNames addObject:@"棋牌_已选择"];
        [_selectedImageNames addObject:@"彩票_已选择"];
    }return _selectedImageNames;
}

@end
