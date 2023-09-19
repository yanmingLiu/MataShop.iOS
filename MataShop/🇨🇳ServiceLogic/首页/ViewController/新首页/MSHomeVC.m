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
@property(nonatomic,strong)WMZBannerView *bannerView;
@property(nonatomic,strong)BaiShaETProjMarqueeView *marqueeView;
@property(nonatomic,strong)MS3rdShopLinkView *shopLinkView;
@property(nonatomic,strong)MSHomeGoodsView *homeGoodsView;

@property(nonatomic,strong)MSHomePopupView *popupView;
//@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
//@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <UIImage *>*dataMutArr;
/// Data
//@property(nonatomic,strong)NSMutableArray <MSProdShowModel *>*cvCellDataMutArr;
@property(nonatomic,strong)NSArray *__block dataArr;
//@property(nonatomic,assign)CGFloat __block ddfd;

@end

@implementation MSHomeVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)loadView{
    [super loadView];
    ISLogin = self.isLogin;
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = UIColor.redColor;

    self.searchBoardView.alpha = 1;
    self.bannerParam.wDataSet(self.dataMutArr);
    [self.bannerView updateUI];
    self.marqueeView.alpha = 1;
    self.homeGoodsView.alpha = 1;
//    self.shopLinkView.alpha = 1;
//
//    self.collectionView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self updateStatusBarCor:JobsOrangeColor];/// 在具体子类实现，不要写在父类
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    /// 首页弹框
//    [jobsGetMainWindow() popupWithView:[self jobsPopView:BaiShaETProjPopupView11.class
//                                           viewModel:UIViewModel.new]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
#pragma mark —— UICollectionViewCell 部署策略
////见 @interface NSObject (JobsDeployCellConfig)
//#pragma mark —— UICollectionViewDataSource
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
//                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    MSProdShowCVCell *cell = [MSProdShowCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
//    [cell richElementsInCellWithModel:self.cvCellDataMutArr[indexPath.row]];
//    return cell;
//}
//
//- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
//     numberOfItemsInSection:(NSInteger)section {
//    return self.cvCellDataMutArr.count;
//}
//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//viewForSupplementaryElementOfKind:(NSString *)kind
//atIndexPath:(NSIndexPath *)indexPath {
//    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
//        MSHomeCollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:MSHomeCollectionReusableView.class
//                                                                                                             forIndexPath:indexPath];
//
//        [headerView richElementsInViewWithModel:nil];
//        return headerView;
//    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
//        ReturnBaseCollectionReusableView
//    }else ReturnBaseCollectionReusableView;
//}
//#pragma mark —— UICollectionViewDelegate
///// 允许选中时，高亮
//-(BOOL)collectionView:(UICollectionView *)collectionView
//shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//    return YES;
//}
///// 高亮完成后回调
//-(void)collectionView:(UICollectionView *)collectionView
//didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//}
///// 由高亮转成非高亮完成时的回调
//-(void)collectionView:(UICollectionView *)collectionView
//didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//}
///// 设置是否允许选中
//-(BOOL)collectionView:(UICollectionView *)collectionView
//shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//    return YES;
//}
///// 设置是否允许取消选中
//-(BOOL)collectionView:(UICollectionView *)collectionView
//shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//    return YES;
//}
///// 选中操作
//- (void)collectionView:(UICollectionView *)collectionView
//didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//    /**
//     滚动到指定位置
//     _collectionView.contentOffset = CGPointMake(0,-100);
//     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
//     */
//}
///// 取消选中操作
//-(void)collectionView:(UICollectionView *)collectionView
//didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s", __FUNCTION__);
//}
//#pragma mark —— UICollectionViewDelegateFlowLayout
///// header 大小
//- (CGSize)collectionView:(UICollectionView *)collectionView
//layout:(UICollectionViewLayout *)collectionViewLayout
//referenceSizeForHeaderInSection:(NSInteger)section {
//    return [MSHomeCollectionReusableView collectionReusableViewSizeWithModel:nil];
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout *)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return [MSProdShowCVCell cellSizeWithModel:nil];
//}
///// 定义的是元素垂直之间的间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout *)collectionViewLayout
//minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return JobsWidth(13);
//}
///// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
//- (CGFloat)collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout *)collectionViewLayout
//minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return JobsWidth(13);
//}
///// 内间距
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
//                       layout:(UICollectionViewLayout *)collectionViewLayout
//       insetForSectionAtIndex:(NSInteger)section {
//    return jobsSameEdgeInset(JobsWidth(13));
//}
#pragma mark —— lazyLoad
-(MSSearchBoardView *)searchBoardView{
    if (!_searchBoardView) {
        _searchBoardView = [MSSearchBoardView.alloc initWithSize:[MSSearchBoardView viewSizeWithModel:nil]];
        _searchBoardView.backgroundColor = RGB_COLOR(234, 41, 24);
        [_searchBoardView richElementsInViewWithModel:nil];
        [self.view addSubview:_searchBoardView];
        [_searchBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSSearchBoardView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsStatusBarHeightByAppleIncData());
        }];
        [self.view layoutIfNeeded];
    }return _searchBoardView;
}

-(WMZBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [WMZBannerView.alloc initConfigureWithModel:self.bannerParam];
        [_bannerView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
        [self.view addSubview:_bannerView];
    }return _bannerView;
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
            
            [cell.backgroundImageView sd_setImageWithURL:urlStr.jobsUrl
                                        placeholderImage:self.dataMutArr[indexPath.item]];
            return cell;
        })
        .wEventClickSet(^(id anyID, NSInteger index) {
            NSLog(@"点击 %@ %ld",anyID,index);
        })
        .wEventCenterClickSet(^(id anyID,
                                NSInteger index,
                                BOOL isCenter,
                                UICollectionViewCell *cell) {
            NSLog(@"判断居中点击");
        })
        .wFrameSet(CGRectMake((JobsMainScreen_WIDTH() - [CasinoBannerCell cellSizeWithModel:nil].width) / 2,
                              JobsStatusBarHeightByAppleIncData() + ([MSSearchBoardView viewSizeWithModel:nil]).height,
                              [CasinoBannerCell cellSizeWithModel:nil].width,
                              [CasinoBannerCell cellSizeWithModel:nil].height))
        //图片铺满
        .wImageFillSet(YES)
        //循环滚动
        .wRepeatSet(YES)
        //自动滚动时间
        .wAutoScrollSecondSet(5)
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

-(NSMutableArray<UIImage *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        [_dataMutArr addObject:JobsIMG(@"创业招募令")];
        [_dataMutArr addObject:JobsIMG(@"商品广告图4")];
        [_dataMutArr addObject:JobsIMG(@"创业招募令")];
        [_dataMutArr addObject:JobsIMG(@"商品广告图4")];
    }return _dataMutArr;
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

-(MSHomeGoodsView *)homeGoodsView{
    if(!_homeGoodsView){
        _homeGoodsView = MSHomeGoodsView.new;
        _homeGoodsView.backgroundColor = JobsGreenColor;
        [self.view addSubview:_homeGoodsView];
        
        [self.view layoutIfNeeded];
        _homeGoodsView.x = 0;
        _homeGoodsView.y = 初始位置;// 锚点1（最低点）
        _homeGoodsView.size = [_homeGoodsView viewSizeWithModel:nil];
        [_homeGoodsView richElementsInViewWithModel:nil];
        
        @jobs_weakify(self)
        [_homeGoodsView actionObjectBlock:^(MSHomeGoodsView *data) {
            NSLog(@"sss = %f",self->_homeGoodsView.y);
            @jobs_strongify(self)
            /// 向下滑动为正
            if(data.jobsPoint.y > 0){
                /// 滑动向下 + y超过下限 = 回到原点（没有动画）
                if(self->_homeGoodsView.y >= 初始位置){
                    self->_homeGoodsView.y = 初始位置;
                }
                /// 滑动向下 + y在上下限之间  = 回到原点（最低点）
                if(self->_homeGoodsView.y <= 初始位置 &&
                    self->_homeGoodsView.y >= 终点位置){
                    [UIView animateWithDuration:0.3
                                     animations:^{
                        self->_homeGoodsView.y = 初始位置;
                    }];
                }
            }
            /// 向上滑动为负
            if(data.jobsPoint.y < 0){
                /// 滑动向上 + y在上下限之间 = 抵达顶点（最高点）
                if(self->_homeGoodsView.y <= 初始位置 && self->_homeGoodsView.y >= 终点位置){
                    [UIView animateWithDuration:0.3
                                     animations:^{
                        self->_homeGoodsView.y = 终点位置;// 锚点2（最高点）
                    }];
                }
                /// 滑动向上 + y超过上限 = 抵达顶点（最高点）（没有动画）
                if(self->_homeGoodsView.y < 终点位置){
                    self->_homeGoodsView.y = 终点位置;// 锚点2（最高点）
                }
            }
        }];
    }return _homeGoodsView;
}

//-(MS3rdShopLinkView *)shopLinkView{
//    if(!_shopLinkView){
//        _shopLinkView = MS3rdShopLinkView.new;
//        [_shopLinkView richElementsInViewWithModel:nil];
//        [self.view addSubview:_shopLinkView];
//        [_shopLinkView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo([MS3rdShopLinkView viewSizeWithModel:nil]);
//            make.centerX.equalTo(self.view);
//            make.top.equalTo(self.marqueeView.mas_bottom);
//        }];
//    }return _shopLinkView;
//}

//-(UICollectionViewFlowLayout *)layout{
//    if (!_layout) {
//        _layout = UICollectionViewFlowLayout.new;
//        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    }return _layout;
//}
//
//-(MSHomeCollectionView *)collectionView{
//    if (!_collectionView) {
//        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
//                                           collectionViewLayout:self.layout];
//        _collectionView.backgroundColor = RGB_SAMECOLOR(245);
//        [self dataLinkByCollectionView:_collectionView];
//        _collectionView.showsVerticalScrollIndicator = NO;
////        _collectionView.contentInset = jobsSameEdgeInset(JobsWidth(13));
//        [_collectionView registerCollectionViewClass];
//
//        {
//            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
//            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
//            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
//            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
//            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中...");
//            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");
//
//            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
//            refreshConfigFooter.stateIdleTitle = Internationalization(@"上拉加载更多");
//            refreshConfigFooter.pullingTitle = Internationalization(@"上拉加载更多");
//            refreshConfigFooter.refreshingTitle = Internationalization(@"上拉加载更多");
//            refreshConfigFooter.willRefreshTitle = Internationalization(@"加载数据中...");
//            refreshConfigFooter.noMoreDataTitle = Internationalization(@"上拉加载更多");
//
//            self.refreshConfigHeader = refreshConfigHeader;
//            self.refreshConfigFooter = refreshConfigFooter;
//
//            _collectionView.mj_header = self.mjRefreshNormalHeader;
//            _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
//
//            _collectionView.mj_footer = self.mjRefreshAutoNormalFooter;
//        }
//
//        {
//            _collectionView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
//                                                                     titleStr:Internationalization(@"暂无数据")
//                                                                    detailStr:Internationalization(@"")];
//
//            _collectionView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
//            _collectionView.ly_emptyView.contentViewOffset = JobsWidth(-180);
//            _collectionView.ly_emptyView.titleLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightMedium];
//        }
//
////        {
////            NSArray *classArray = @[
////                MSProdShowCVCell.class
////            ];
////            NSArray *sizeArray = @[
////                [NSValue valueWithCGSize:[MSProdShowCVCell cellSizeWithModel:nil]],
////            ];
////
////            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
////                                                                              cellSizeArray:sizeArray
////                                                                         animatedCountArray:@[@(1),@(1),@(1),@(1)]];
////
////            [_collectionView.tabAnimated addHeaderViewClass:MSProdShowCVCell.class
////                                                   viewSize:[MSProdShowCVCell cellSizeWithModel:nil]
////                                                  toSection:0];
////            _collectionView.tabAnimated.containNestAnimation = YES;
////            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
////            _collectionView.tabAnimated.canLoadAgain = YES;
////            [_collectionView tab_startAnimation];// 开启动画
////        }
//
//        [self.view addSubview:_collectionView];
//        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(JobsMainScreen_WIDTH());
//            make.centerX.equalTo(self.view);
//            make.top.equalTo(self.shopLinkView.mas_bottom);
//            make.bottom.equalTo(self.view);
//        }];
//    }return _collectionView;
//}

//-(NSMutableArray<MSProdShowModel *> *)cvCellDataMutArr{
//    if (!_cvCellDataMutArr) {
//        _cvCellDataMutArr = NSMutableArray.array;
//
//        {
//            MSProdShowModel *model = MSProdShowModel.new;
//            model.prodIMG = JobsIMG(@"商品占位图1");
//            model.prodIMGURL = @"";
//            model.prodName = Internationalization(@"天然羊羔毛外套");
//            model.prodPrice = @"￥ 8549.33";
//            [_cvCellDataMutArr addObject:model];
//        }
//
//        {
//            MSProdShowModel *model = MSProdShowModel.new;
//            model.prodIMG = JobsIMG(@"商品占位图1");
//            model.prodIMGURL = @"";
//            model.prodName = Internationalization(@"幻龙无线");
//            model.prodPrice = @"￥ 333.33";
//            [_cvCellDataMutArr addObject:model];
//        }
//
//        {
//            MSProdShowModel *model = MSProdShowModel.new;
//            model.prodIMG = JobsIMG(@"商品占位图1");
//            model.prodIMGURL = @"";
//            model.prodName = Internationalization(@"杰士邦");
//            model.prodPrice = @"￥ 555.33";
//            [_cvCellDataMutArr addObject:model];
//        }
//
//        {
//            MSProdShowModel *model = MSProdShowModel.new;
//            model.prodIMG = JobsIMG(@"商品占位图1");
//            model.prodIMGURL = @"";
//            model.prodName = Internationalization(@"蛋糕");
//            model.prodPrice = @"￥ 1111.33";
//            [_cvCellDataMutArr addObject:model];
//        }
//    }return _cvCellDataMutArr;
//}

@end


