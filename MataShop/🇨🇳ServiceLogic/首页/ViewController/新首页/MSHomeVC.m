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
/// Data
@property(nonatomic,strong)NSArray *__block dataArr;
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <UIImage *>*dataMutArr;

@end

@implementation MSHomeVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    [NSNotificationCenter.defaultCenter removeObserver:self];
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
    self.shopLinkView.alpha = 1;
    self.homeGoodsView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self updateStatusBarCor:JobsOrangeColor];/// 在具体子类实现，不要写在父类
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    /// 首页弹框
    [jobsGetMainWindow() popupWithView:[self jobsPopView:MSHomePopupView.class
                                               viewModel:UIViewModel.new]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法

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

-(MS3rdShopLinkView *)shopLinkView{
    if(!_shopLinkView){
        _shopLinkView = MS3rdShopLinkView.new;
        [self.view addSubview:_shopLinkView];
        [_shopLinkView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MS3rdShopLinkView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.marqueeView.mas_bottom).offset(JobsWidth(16));
        }];
        [_shopLinkView richElementsInViewWithModel:nil];
    }return _shopLinkView;
}

-(MSHomeGoodsView *)homeGoodsView{
    if(!_homeGoodsView){
        _homeGoodsView = MSHomeGoodsView.new;
        _homeGoodsView.backgroundColor = UIColor.whiteColor;
        [self.view addSubview:_homeGoodsView];
        
        [self.view layoutIfNeeded];
        _homeGoodsView.x = 0;
        _homeGoodsView.y = 初始位置;// 锚点1（最低点）
        _homeGoodsView.size = [_homeGoodsView viewSizeWithModel:nil];
        [_homeGoodsView richElementsInViewWithModel:nil];
//        [_homeGoodsView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
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
                NSLog(@"jjj = %f",初始位置);///
                NSLog(@"mmm = %f",self->_homeGoodsView.y);///
                NSLog(@"uuu = %f",终点位置);///
                /// 滑动向下 + y在上下限之间  = 回到原点（最低点）
                if(self->_homeGoodsView.y <= 初始位置){
//                if(self->_homeGoodsView.y <= 初始位置 && self->_homeGoodsView.y >= 终点位置){
                    [UIView animateWithDuration:0.3
                                     animations:^{
                        self->_homeGoodsView.y = 初始位置;
                    }];
                }
            }
            /// 向上滑动为负
            if(data.jobsPoint.y < 0){
                NSLog(@"ddd = %f",初始位置);/// 320.480000
                NSLog(@"fff = %f",self->_homeGoodsView.y);/// 320.480011
                NSLog(@"ggg = %f",终点位置);/// 96.906667
                /// 滑动向上 + y在上下限之间 = 抵达顶点（最高点）
                if(self->_homeGoodsView.y >= 终点位置){
//                if(self->_homeGoodsView.y <= 初始位置 && self->_homeGoodsView.y >= 终点位置){
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

@end


