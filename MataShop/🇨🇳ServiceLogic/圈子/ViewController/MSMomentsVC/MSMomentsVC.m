//
//  MSMomentsVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSMomentsVC.h"

@interface MSMomentsVC ()
/// UI
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MSMomentsVC

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
    
//    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
    self.viewModel.textModel.textCor = JobsWhiteColor;
    self.viewModel.textModel.text = Internationalization(@"活动圈子");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    self.viewModel.bgCor = JobsCor(@"#E92014");
//    self.viewModel.bgImage = JobsIMG(@"活动圈子背景图");
//
//    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navRightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:self.rightBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.imageView.alpha = 1;
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
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSLog(@"ddd = %ld",indexPath.section);
    
    switch (indexPath.section) {/// 更多圈子
        case 0:{
            MSMoreMomentsCVCell *cell = [MSMoreMomentsCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section]];
            return cell;
        }break;
        case 1:{/// 热门话题
            MSHotTopicCVCell *cell = [MSHotTopicCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section]];
            return cell;
        }break;
        case 2:{/// 最新动态
            MSLastDynamicCVCell *cell = [MSLastDynamicCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            NSMutableArray <MSLastDynamicModel *>*dataMutArr = self.dataMutArr[indexPath.section].data;
            [cell richElementsInCellWithModel:dataMutArr[indexPath.section]];
            return cell;
        }break;
        default:
            return JobsBaseCollectionViewCell.new;
            break;
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    switch (section) {/// 更多圈子
        case 0:{
            return 1;
        }break;
        case 1:{/// 热门话题
            return 1;
        }break;
        case 2:{/// 最新动态
            NSMutableArray *dataArr = (NSMutableArray *)self.dataMutArr[section].data;
            return dataArr.count;
        }break;
        default:
            return 0;
            break;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        MSMomentsCollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:MSMomentsCollectionReusableView.class
                                                                                                   forIndexPath:indexPath];
        
        [headerView richElementsInViewWithModel:self.dataMutArr[indexPath.section]];
        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        return [collectionView UICollectionElementKindSectionFooterClass:BaseCollectionReusableView.class forIndexPath:indexPath];
    }else ReturnBaseCollectionReusableHeaderView;
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
    id d = self.dataMutArr[indexPath.section].data[indexPath.item];
    [self forceComingToPushVC:MSMomentsDetailVC.new requestParams:self.dataMutArr[indexPath.section].data];
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
/// header 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return section ? [MSMomentsCollectionReusableView collectionReusableViewSizeWithModel:nil] : CGSizeZero;
}
/// Footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    if(section == 2){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(0));
    }else{
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(10));
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {/// 更多圈子
        case 0:{
            return [MSMoreMomentsCVCell cellSizeWithModel:nil];
        }break;
        case 1:{/// 热门话题
            return [MSHotTopicCVCell cellSizeWithModel:nil];
        }break;
        case 2:{/// 最新动态
            return [MSLastDynamicCVCell cellSizeWithModel:self.dataMutArr[indexPath.section].data];
        }break;
        default:
            return CGSizeZero;
            break;
    }
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if(section == 2){
        return JobsWidth(0);
    }else{
        return JobsWidth(12);
    }
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
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        _imageView.image = JobsIMG(@"活动圈子背景图");
        [self.view addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(100)));
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.centerX.equalTo(self.view);
        }];
    }return _imageView;
}

-(UIButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                                  titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:nil
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:Internationalization(@"发布")
                                                        subTitle:nil
                                                       titleFont:UIFontWeightMediumSize(14)
                                                    subTitleFont:nil
                                                        titleCor:JobsCor(@"#FFFFFF")
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:JobsClearColor
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
            [self forceComingToPushVC:MSMyPostDynamicVC.new requestParams:nil];
            return nil;
        }];
    }return _rightBtn;
}

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
        _collectionView.backgroundColor = JobsClearColor;
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        
//        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        //_collectionView.contentOffset = CGPointMake(0, -JobsWidth(250));//
//        [_collectionView setContentOffset:CGPointMake(0, -400) animated:YES];// 这句最快在 viewWillLayoutSubviews 有效
        
        [_collectionView registerCollectionElementKindSectionHeaderClass:MSMomentsCollectionReusableView.class];
        [_collectionView registerCollectionViewClass];
        [_collectionView registerCollectionViewCellClass:MSMoreMomentsCVCell.class];/// 更多圈子
        [_collectionView registerCollectionViewCellClass:MSHotTopicCVCell.class];/// 热门话题
        [_collectionView registerCollectionViewCellClass:MSLastDynamicCVCell.class];/// 最新动态
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = Internationalization(@"");
            refreshConfigFooter.pullingTitle = Internationalization(@"");;
            refreshConfigFooter.refreshingTitle = Internationalization(@"");;
            refreshConfigFooter.willRefreshTitle = Internationalization(@"");;
            refreshConfigFooter.noMoreDataTitle = Internationalization(@"");;
            
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
//                MSMoreMomentsCVCell.class,
//                MSHotTopicCVCell.class,
//                MSLastDynamicCVCell.class,
//            ];
//            NSArray *sizeArray = @[
//                [NSValue valueWithCGSize:[MSMoreMomentsCVCell cellSizeWithModel:nil]],
//                [NSValue valueWithCGSize:[MSHotTopicCVCell cellSizeWithModel:nil]],
//                [NSValue valueWithCGSize:[MSLastDynamicCVCell cellSizeWithModel:nil]]
//            ];
//            
//            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
//                                                                              cellSizeArray:sizeArray
//                                                                         animatedCountArray:@[@(1),@(1),@(1)]];
//            
//            [_collectionView.tabAnimated addHeaderViewClass:MSMomentsCollectionReusableView.class
//                                                   viewSize:[MSMomentsCollectionReusableView collectionReusableViewSizeWithModel:nil]
//                                                  toSection:1];
//            [_collectionView.tabAnimated addHeaderViewClass:MSMomentsCollectionReusableView.class
//                                                   viewSize:[MSMomentsCollectionReusableView collectionReusableViewSizeWithModel:nil]
//                                                  toSection:2];
//
//            _collectionView.tabAnimated.containNestAnimation = YES;
//            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            _collectionView.tabAnimated.canLoadAgain = YES;
//            [_collectionView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(JobsWidth(-15));
            make.bottom.equalTo(self.view).offset(JobsWidth(0));
            make.left.equalTo(self.view).offset(JobsWidth(15));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(30));
        }];
        [_collectionView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *sectionViewModel = UIViewModel.new;
            sectionViewModel.textModel.text = Internationalization(@"");
            NSMutableArray <UIViewModel *>*itemDataMutArr = NSMutableArray.array;
            {
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"更多圈子临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"潮物圈");
                    itemViewModel.subTextModel.text = Internationalization(@"0条动态");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"更多圈子临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"次元圈");
                    itemViewModel.subTextModel.text = Internationalization(@"0条动态");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"更多圈子临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"生物圈");
                    itemViewModel.subTextModel.text = Internationalization(@"0条动态");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"更多圈子临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"恐怖圈");
                    itemViewModel.subTextModel.text = Internationalization(@"0条动态");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"更多圈子");
                    itemViewModel.textModel.text = Internationalization(@"更多圈子");
                    itemViewModel.subTextModel.text = Internationalization(@"更多动态");
                    [itemDataMutArr addObject:itemViewModel];
                }
            }
            sectionViewModel.data = itemDataMutArr;
            [_dataMutArr addObject:sectionViewModel];
        }
        
        {
            UIViewModel *sectionViewModel = UIViewModel.new;
            sectionViewModel.textModel.text = Internationalization(@"热门话题");
            NSMutableArray *itemDataMutArr = NSMutableArray.array;
            {
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"热门话题临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"0001");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"热门话题临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"0002");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"热门话题临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"0003");
                    [itemDataMutArr addObject:itemViewModel];
                }
                
                {
                    UIViewModel *itemViewModel = UIViewModel.new;
                    itemViewModel.image = JobsIMG(@"热门话题临时占位图");
                    itemViewModel.textModel.text = Internationalization(@"0004");
                    [itemDataMutArr addObject:itemViewModel];
                }
            }
            sectionViewModel.data = itemDataMutArr;
            [_dataMutArr addObject:sectionViewModel];
        }
        
        {
            UIViewModel *sectionViewModel = UIViewModel.new;
            sectionViewModel.textModel.text = Internationalization(@"最新动态");
            NSMutableArray <MSLastDynamicModel *>*itemDataMutArr = NSMutableArray.array;
            {
                MSLastDynamicModel *lastDynamicModel = MSLastDynamicModel.new;
//                lastDynamicModel.userImageUrl;/// 用户头像URL
                lastDynamicModel.userImage = JobsIMG(@"最新动态用户头像临时占位图");/// 用户头像Image
                lastDynamicModel.userTitle = @"会飞的鱼1";/// 用户名
                lastDynamicModel.userSubTitle = @"三月营销秘籍上线 为品牌赋能新生态";/// 用户发表的内容
                {
                    NSMutableArray <UIImage *>*imageDataMutArr = NSMutableArray.array;
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    lastDynamicModel.imageDataMutArr = imageDataMutArr;/// 图片数组
                }
                lastDynamicModel.time = @"3-9 12:14";/// 发表时间
                lastDynamicModel.praise = @"123";/// 点赞数
                lastDynamicModel.comments = @"343";/// 评论数
                
                [itemDataMutArr addObject:lastDynamicModel];
            }
            
            {
                MSLastDynamicModel *lastDynamicModel = MSLastDynamicModel.new;
//                lastDynamicModel.userImageUrl;/// 用户头像URL
                lastDynamicModel.userImage = JobsIMG(@"最新动态用户头像临时占位图");/// 用户头像Image
                lastDynamicModel.userTitle = @"会飞的鱼2";/// 用户名
                lastDynamicModel.userSubTitle = @"三月营销秘籍上线 为品牌赋能新生态";/// 用户发表的内容
                {
                    NSMutableArray <UIImage *>*imageDataMutArr = NSMutableArray.array;
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    lastDynamicModel.imageDataMutArr = imageDataMutArr;/// 图片数组
                }
                lastDynamicModel.time = @"3-9 12:14";/// 发表时间
                lastDynamicModel.praise = @"123";/// 点赞数
                lastDynamicModel.comments = @"343";/// 评论数
                
                [itemDataMutArr addObject:lastDynamicModel];
            }
            
            {
                MSLastDynamicModel *lastDynamicModel = MSLastDynamicModel.new;
//                lastDynamicModel.userImageUrl;/// 用户头像URL
                lastDynamicModel.userImage = JobsIMG(@"最新动态用户头像临时占位图");/// 用户头像Image
                lastDynamicModel.userTitle = @"会飞的鱼3";/// 用户名
                lastDynamicModel.userSubTitle = @"三月营销秘籍上线 为品牌赋能新生态";/// 用户发表的内容
                {
                    NSMutableArray <UIImage *>*imageDataMutArr = NSMutableArray.array;
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    [imageDataMutArr addObject:JobsIMG(@"最新动态临时占位图")];
                    lastDynamicModel.imageDataMutArr = imageDataMutArr;/// 图片数组
                }
                lastDynamicModel.time = @"3-9 12:14";/// 发表时间
                lastDynamicModel.praise = @"123";/// 点赞数
                lastDynamicModel.comments = @"343";/// 评论数
                
                [itemDataMutArr addObject:lastDynamicModel];
            }
            sectionViewModel.data = itemDataMutArr;
            [_dataMutArr addObject:sectionViewModel];
        }
    }return _dataMutArr;
}

@end
