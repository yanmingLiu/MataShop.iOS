//
//  BaiShaETProjMarqueeView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjMarqueeView.h"

@interface BaiShaETProjMarqueeView ()
/// UI
@property(nonatomic,strong)WMZBannerView *bannerView;
//@property(nonatomic,strong)UIImageView *hornIMGV;
@property(nonatomic,strong)BaseButton *hornBtn;
/// Data
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <NSString *>*dataMutArr;

@end

@implementation BaiShaETProjMarqueeView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_marqueeViewOnceToken = 0;
    static_marqueeView = nil;
}

static BaiShaETProjMarqueeView *static_marqueeView = nil;
static dispatch_once_t static_marqueeViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_marqueeViewOnceToken, ^{
        static_marqueeView = BaiShaETProjMarqueeView.new;
    });return static_marqueeView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = HEXCOLOR(0xF27650);
//    self.hornIMGV.alpha = 1;
    self.hornBtn.alpha = 1;
    self.bannerParam.wDataSet(self.dataMutArr);
    [self.bannerView updateUI];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(355), JobsWidth(36));
}
#pragma mark —— 网络请求
-(void)netWorking{
    /// 公告/活动

}
#pragma mark —— lazyLoad
//-(UIImageView *)hornIMGV{
//    if (!_hornIMGV) {
//        _hornIMGV = UIImageView.new;
//        _hornIMGV.image = JobsIMG(@"系统公告");
//        [self addSubview:_hornIMGV];
//        [_hornIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(62), JobsWidth(20)));
//            make.centerY.equalTo(self.mas_centerY);
//            make.left.equalTo(self).offset(JobsWidth(0));
//        }];
//    }return _hornIMGV;
//}

-(BaseButton *)hornBtn{
    if (!_hornBtn) {
        _hornBtn = BaseButton.new;
        [self addSubview:_hornBtn];
        [_hornBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(62), JobsWidth(20)));
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self).offset(JobsWidth(0));
        }];
    }
    
    _hornBtn.normalImage = self.viewModel.image;
    _hornBtn.normalTitle = Internationalization(@"  系统公告 | ");
    _hornBtn.normalTitleColor = RGB_SAMECOLOR(255);
    _hornBtn.normalAttributedTitle = self.viewModel.subTextModel.attributedText;
    
    _hornBtn.titleFont = UIFontWeightBoldSize(14);
    
    [_hornBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    [_hornBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                 imagePadding:JobsWidth(1)];
    return _hornBtn;
}

-(WMZBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [WMZBannerView.alloc initConfigureWithModel:self.bannerParam];
        [self addSubview:_bannerView];
    }return _bannerView;
}

-(WMZBannerParam *)bannerParam{
    if (!_bannerParam) {
        _bannerParam = BannerParam()
        //自定义视图必传
        .wMyCellClassNameSet(CasinoMarqueeCell.class.description)
        .wMyCellSet(^UICollectionViewCell *(NSIndexPath *indexPath,
                                            UICollectionView *collectionView,
                                            id model,
                                            UIImageView *bgImageView,
                                            NSArray *dataArr) {
            //自定义视图
            CasinoMarqueeCell *cell = [CasinoMarqueeCell cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
//            cell.backgroundColor = JobsRandomColor;
            cell.backgroundLabel.text = self.dataMutArr[indexPath.item];
            cell.backgroundLabel.textColor = UIColor.whiteColor;
            cell.backgroundLabel.font = UIFontWeightRegularSize(12);
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
        .wFrameSet(CGRectMake(JobsWidth(70),
                              0,
                              [BaiShaETProjMarqueeView viewSizeWithModel:nil].width - JobsWidth(70),
                              [BaiShaETProjMarqueeView viewSizeWithModel:nil].height))
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
        .wHideBannerControlSet(YES)
        //能否拖动
        .wCanFingerSlidingSet(YES)
        //整体缩小
        .wScreenScaleSet(1)
        //左右半透明 中间不透明
        .wAlphaSet(0.5)
        //开启跑马灯效果
        .wMarqueeSet(YES)
        //跑马灯速度
        .wMarqueeRateSet(1);
    }return _bannerParam;
}

-(NSMutableArray <NSString *>*)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
#warning 文字过长会出现UI问题
//        [_dataMutArr addObject:Internationalization(@"本公司為自營平台且無任何合作授權網站，勿輕信來路不明的")];
        [_dataMutArr addObject:Internationalization(@"今日特价更多详情点击查询")];
    }return _dataMutArr;
}

@end
