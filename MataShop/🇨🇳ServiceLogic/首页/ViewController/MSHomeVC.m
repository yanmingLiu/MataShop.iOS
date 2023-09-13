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
@property(nonatomic,strong)MS3rdShopLinkView *shopLinkView;
@property(nonatomic,strong)WMZBannerView *bannerView;
@property(nonatomic,strong)UIImageView *adIMGV1;
@property(nonatomic,strong)UIImageView *adIMGV2;
@property(nonatomic,strong)UIImageView *adIMGV3;
/// Data
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <UIImage *>*dataMutArr;
@property(nonatomic,strong)NSArray *__block dataArr;

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
    
    self.marqueeView.alpha = 1;
    self.bannerParam.wDataSet(self.dataMutArr);
    [self.bannerView updateUI];
    self.shopLinkView.alpha = 1;
    self.adIMGV1.alpha = 1;
    self.adIMGV2.alpha = 1;
    self.adIMGV3.alpha = 1;
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
            make.top.equalTo(self.searchBoardView.mas_bottom).offset(JobsWidth(10));
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
        .wFrameSet(CGRectMake(JobsWidth(15),
                              JobsStatusBarHeightByAppleIncData() + [MSSearchBoardView viewSizeWithModel:nil].height + [BaiShaETProjMarqueeView viewSizeWithModel:nil].height + [MS3rdShopLinkView viewSizeWithModel:nil].height,
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

-(WMZBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [WMZBannerView.alloc initConfigureWithModel:self.bannerParam];
        [self.view addSubview:_bannerView];
    }return _bannerView;
}

-(MS3rdShopLinkView *)shopLinkView{
    if(!_shopLinkView){
        _shopLinkView = MS3rdShopLinkView.new;
        [_shopLinkView richElementsInViewWithModel:nil];
        [self.view addSubview:_shopLinkView];
        [_shopLinkView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MS3rdShopLinkView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.marqueeView.mas_bottom);
        }];
    }return _shopLinkView;
}

-(UIImageView *)adIMGV1{
    if(!_adIMGV1){
        _adIMGV1 = UIImageView.new;
        _adIMGV1.image = [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"超值折扣区" ofType:@"gif"]]];
        [self.view addSubview:_adIMGV1];
        [_adIMGV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(110)));
            make.top.equalTo(self.bannerView.mas_bottom).offset(JobsWidth(16));
        }];
        
        {
            _adIMGV1.numberOfTouchesRequired = 1;
            _adIMGV1.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _adIMGV1.minimumPressDuration = 0.1;
            _adIMGV1.numberOfTouchesRequired = 1;
            _adIMGV1.allowableMovement = 1;
            _adIMGV1.userInteractionEnabled = YES;
            @jobs_weakify(self)
            _adIMGV1.target = weak_self;
            _adIMGV1.tapGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable target, UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                [WHToast toastErrMsg:Internationalization(@"超值折扣区")];
            }];
            _adIMGV1.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
    
    }return _adIMGV1;
}

-(UIImageView *)adIMGV2{
    if(!_adIMGV2){
        _adIMGV2 = UIImageView.new;
        _adIMGV2.image = [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"超值" ofType:@"gif"]]];
        [self.view addSubview:_adIMGV2];
        [_adIMGV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(165), JobsWidth(100)));
            make.top.equalTo(self.adIMGV1.mas_bottom).offset(JobsWidth(12));
        }];
        
        {
            _adIMGV2.numberOfTouchesRequired = 1;
            _adIMGV2.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _adIMGV2.minimumPressDuration = 0.1;
            _adIMGV2.numberOfTouchesRequired = 1;
            _adIMGV2.allowableMovement = 1;
            _adIMGV2.userInteractionEnabled = YES;
            @jobs_weakify(self)
            _adIMGV2.target = weak_self;
            _adIMGV2.tapGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable target, UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                [WHToast toastErrMsg:Internationalization(@"超值")];
            }];
            _adIMGV2.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
        
    }return _adIMGV2;
}

-(UIImageView *)adIMGV3{
    if(!_adIMGV3){
        _adIMGV3 = UIImageView.new;
        _adIMGV3.image = [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"火爆" ofType:@"gif"]]];
        [self.view addSubview:_adIMGV3];
        [_adIMGV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(JobsWidth(-16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(165), JobsWidth(100)));
            make.top.equalTo(self.adIMGV1.mas_bottom).offset(JobsWidth(12));
        }];
        
        {
            _adIMGV3.numberOfTouchesRequired = 1;
            _adIMGV3.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _adIMGV3.minimumPressDuration = 0.1;
            _adIMGV3.numberOfTouchesRequired = 1;
            _adIMGV3.allowableMovement = 1;
            _adIMGV3.userInteractionEnabled = YES;
            @jobs_weakify(self)
            _adIMGV3.target = weak_self;
            _adIMGV3.tapGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable target, UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                [WHToast toastErrMsg:Internationalization(@"火爆")];
            }];
            _adIMGV3.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
        
    }return _adIMGV3;
}

-(NSMutableArray<UIImage *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        [_dataMutArr addObject:JobsIMG(@"创业招募令")];
        [_dataMutArr addObject:JobsIMG(@"创业招募令")];
        [_dataMutArr addObject:JobsIMG(@"创业招募令")];
        [_dataMutArr addObject:JobsIMG(@"创业招募令")];
    }return _dataMutArr;
}


@end
