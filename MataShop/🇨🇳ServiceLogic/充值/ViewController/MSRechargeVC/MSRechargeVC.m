//
//  MSRechargeVC.m
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "MSRechargeVC.h"

@interface MSRechargeVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout2;
@property(nonatomic,strong)UICollectionView *collectionView2;
@property(nonatomic,strong)UILabel *tiplab;
@property(nonatomic,strong)UIButton *submitBtn;
@property(nonatomic,weak)ZYTextField *textField;
/// Data
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIViewModel *>*>*dataMutArr1;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr2;

@end

@implementation MSRechargeVC

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
    self.viewModel.bgCor = JobsCor(@"#F5F5F5");
    
    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsCor(@"#F5F5F5");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    
    self.collectionView2.alpha = 1;
    
    self.tiplab.alpha = 1;
    self.submitBtn.alpha = 1;
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
/// 依据btn的点击状态配置btn
-(void)setCellBtn:(UIButton *)btn
   collectionView:(nonnull UICollectionView *)collectionView{
    if (collectionView.tag == 1) {
        btn.jobsResetBtnlayerBorderCor(btn.selected ? JobsCor(@"#EA2819") : JobsClearColor);
        btn.jobsResetBtnBgCor(JobsClearColor);
    }else if (collectionView.tag == 2) {
        btn.jobsResetBtnlayerBorderCor(btn.selected ? JobsClearColor : JobsCor(@"#AAAAAA"));
        btn.jobsResetBtnBgCor(btn.selected ? JobsCor(@"EA2918") : JobsClearColor);
        btn.jobsResetBtnTitleCor(btn.selected ? JobsCor(@"#FFFFFF") : JobsCor(@"#333333"));
    }
}
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
    return self.dataMutArr1.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if(indexPath.section){
        JobsBtnStyleCVCell *cell = [JobsBtnStyleCVCell cellWithCollectionView:collectionView 
                                                                 forIndexPath:indexPath];
        
        [cell richElementsInCellWithModel:self.dataMutArr2[indexPath.row]];
        [cell.getBtn layerBorderCor:JobsCor(@"#AAAAAA")
             andBorderWidth:JobsWidth(0.5f)];
        
        cell.getBtn.enabled = YES;
        @jobs_weakify(self)
        [cell actionObjectBlock:^(UIButton *_Nullable data){
            @jobs_strongify(self)
            UIViewModel *viewModel = (UIViewModel *)data.data;
            /// 获取点击的Btn值
            [self jobsToastMsg:viewModel.textModel.text];
            for (JobsBtnStyleCVCell *collectionViewCell in collectionView.visibleCells) {
                if([collectionViewCell isKindOfClass:JobsBtnStyleCVCell.class]){
                    collectionViewCell.getBtn.selected = NO;
                    [self setCellBtn:collectionViewCell.getBtn collectionView:collectionView];
                }
            }
            data.selected = !data.selected;
            [self setCellBtn:data collectionView:collectionView];
            self.textField.text = viewModel.textModel.text;
        }];return cell;
    }else{
        JobsTextFieldStyleCVCell *cell = [JobsTextFieldStyleCVCell cellWithCollectionView:collectionView
                                                                             forIndexPath:indexPath];
        [cell richElementsInCellWithModel:nil];
        self.textField = cell.getTextField;
        @jobs_weakify(self)
        [cell actionObjectBlock:^(ZYTextField *_Nullable data){
            @jobs_strongify(self)

        }];return cell;
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    if (section) {
        return self.dataMutArr2.count;
    }return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        JobsHeaderFooterView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:JobsHeaderFooterView.class
                                                                                        forIndexPath:indexPath];
        [headerView richElementsInViewWithModel:self.dataMutArr1[indexPath.section]];
        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        ReturnBaseCollectionReusableFooterView
    }else ReturnBaseCollectionReusableHeaderView
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
/// header 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(JobsWidth(345), JobsWidth(18 + 22 * 2));
}

- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section){
        return CGSizeMake(JobsWidth(JobsWidth(72)), JobsWidth(46));
    }else{
        return [JobsTextFieldStyleCVCell cellSizeWithModel:nil];
    }
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(16);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(14);
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(JobsWidth(15));
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout2{
    if (!_layout2) {
        _layout2 = UICollectionViewFlowLayout.new;
        _layout2.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout2;
}

-(UICollectionView *)collectionView2{
    if (!_collectionView2) {
        _collectionView2 = [UICollectionView.alloc initWithFrame:CGRectZero
                                            collectionViewLayout:self.layout2];
        _collectionView2.backgroundColor = RGB_SAMECOLOR(246);
        [self dataLinkByCollectionView:_collectionView2];
        
        _collectionView2.showsVerticalScrollIndicator = NO;
        _collectionView2.showsHorizontalScrollIndicator = NO;
        _collectionView2.bounces = NO;///设置为NO，使得collectionView只能上拉，不能下拉
    
        [_collectionView2 registerCollectionViewClass];
        [_collectionView2 registerCollectionViewCellClass:JobsTextFieldStyleCVCell.class];
        [_collectionView2 registerCollectionViewCellClass:JobsBtnStyleCVCell.class];
        
        {
            _collectionView2.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                      titleStr:Internationalization(@"暂无数据")
                                                                     detailStr:Internationalization(@"")];
            
            _collectionView2.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _collectionView2.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _collectionView2.ly_emptyView.titleLabFont = UIFontWeightMediumSize(16);
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
//            _collectionView2.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
//                                                                               cellSizeArray:sizeArray
//                                                                             animatedCountArray:@[@(1)]];
//
//            [_collectionView2.tabAnimated addHeaderViewClass:JobsBtnStyleCVCell.class
//                                                   viewSize:[JobsBtnStyleCVCell collectionReusableViewSizeWithModel:nil]
//                                                  toSection:0];
//
//            _collectionView2.tabAnimated.containNestAnimation = YES;
//            _collectionView2.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            _collectionView2.tabAnimated.canLoadAgain = YES;
//            [_collectionView2 tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_collectionView2];
        [_collectionView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(0));
            make.width.mas_equalTo(JobsWidth(351));
            make.height.mas_equalTo(JobsWidth(18 + 22 * 2) * 2 + JobsWidth(100) + JobsWidth(56) * (self.dataMutArr2.count / 4));
        }];
    }return _collectionView2;
}

-(UILabel *)tiplab{
    if(!_tiplab){
        _tiplab = UILabel.new;
        _tiplab.text = Internationalization(@"财务上班时间为:10:00-22:00\n请在规定时间内提现,由此给您带来的不便,敬请谅解!");
        _tiplab.textAlignment = NSTextAlignmentLeft;
        _tiplab.font = UIFontWeightRegularSize(12);
        _tiplab.textColor = JobsCor(@"#666666");
        [self.view addSubview:_tiplab];
        [_tiplab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(JobsMainScreen_WIDTH() - JobsWidth(27 * 2));
            make.left.equalTo(self.view).offset(JobsWidth(27));
            make.top.equalTo(self.collectionView2.mas_bottom).offset(JobsWidth(12));
        }];
        [_tiplab makeLabelByShowingType:UILabelShowingType_05];
    }return _tiplab;
}

-(UIButton *)submitBtn{
    if(!_submitBtn){
        @jobs_weakify(self)
        _submitBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                                   titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:nil
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:Internationalization(@"提交")
                                                         subTitle:nil
                                                        titleFont:UIFontWeightSemiboldSize(18)
                                                     subTitleFont:nil
                                                         titleCor:JobsCor(@"#FFFFFF")
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:JobsCor(@"#EA2918")
                                                     imagePadding:JobsWidth(0)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeNone
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(8)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                                  clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self jobsToastMsg:Internationalization(@"确认提交")];
            return nil;
        }];
        [self.view addSubview:_submitBtn];
        [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(335), JobsWidth(50)));
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(JobsWidth(-40));
        }];
    }return _submitBtn;
}

-(NSMutableArray<NSMutableArray<UIViewModel *> *> *)dataMutArr1{
    if(!_dataMutArr1){
        _dataMutArr1 = NSMutableArray.array;
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"充值金额");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightSemiboldSize(18);
            viewModel.textModel.textCor = JobsCor(@"#333333");
            viewModel.textModel.labelShowingType = UILabelShowingType_03;
            viewModel.subTextModel.text = @"";
            [mutArr addObject:viewModel];
            [_dataMutArr1 addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"快速选择金额(元)");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightSemiboldSize(18);
            viewModel.textModel.textCor = JobsCor(@"#333333");
            viewModel.textModel.labelShowingType = UILabelShowingType_03;
            viewModel.subTextModel.text = @"";
            [mutArr addObject:viewModel];
            [_dataMutArr1 addObject:mutArr];
        }
    }return _dataMutArr1;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr2{
    if (!_dataMutArr2) {
        _dataMutArr2 = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"200");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"500");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"1000");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"2000");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"5000");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"10000");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"20000");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"50000");
            viewModel.bgCor = JobsClearColor;
            viewModel.textModel.font = UIFontWeightRegularSize(16);
            [_dataMutArr2 addObject:viewModel];
        }
    }return _dataMutArr2;
}

@end
