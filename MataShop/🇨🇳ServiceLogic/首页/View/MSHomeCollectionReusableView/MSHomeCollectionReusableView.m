//
//  MSHomeCollectionReusableView.m
//  MataShop
//
//  Created by Jobs Hi on 9/15/23.
//

#import "MSHomeCollectionReusableView.h"

@interface MSHomeCollectionReusableView ()
/// UI
@property(nonatomic,strong)WMZBannerView *bannerView;
@property(nonatomic,strong)UIImageView *adIMGV1;
@property(nonatomic,strong)UIImageView *adIMGV2;
@property(nonatomic,strong)UIImageView *adIMGV3;
/// Data
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <UIImage *>*dataMutArr;

@end

@implementation MSHomeCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = RGBA_COLOR(255, 255, 255, 1);
    self.bannerParam.wDataSet(self.dataMutArr);
    [self.bannerView updateUI];
    self.adIMGV1.alpha = 1;
    self.adIMGV2.alpha = 1;
    self.adIMGV3.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)collectionReusableViewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(152 + 16 + 110 + 12 + 100));
}
#pragma mark —— lazyLoad
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
        .wEventCenterClickSet(^(id anyID, NSInteger index,BOOL isCenter,UICollectionViewCell *cell) {
            NSLog(@"判断居中点击");
        })
        .wFrameSet(CGRectMake((JobsMainScreen_WIDTH() - [CasinoBannerCell cellSizeWithModel:nil].width) / 2,
                              0,
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
        [self addSubview:_bannerView];
    }return _bannerView;
}

-(UIImageView *)adIMGV1{
    if(!_adIMGV1){
        _adIMGV1 = UIImageView.new;
        _adIMGV1.image = [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"超值折扣区" ofType:@"gif"]]];
        [self addSubview:_adIMGV1];
        [_adIMGV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(110));
            make.left.equalTo(self).offset(12);
            make.right.equalTo(self).offset(-12);
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
        [self addSubview:_adIMGV2];
        [_adIMGV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(12));
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
        [self addSubview:_adIMGV3];
        [_adIMGV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(JobsWidth(-12));
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


