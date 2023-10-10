//
//  MSChuBaoAdMarqueeView.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoAdMarqueeView.h"

@interface MSChuBaoAdMarqueeView ()
/// UI
@property(nonatomic,strong)BaseButton *hornBtn;
@property(nonatomic,strong)WMZBannerView *bannerView;
/// Data
@property(nonatomic,strong)WMZBannerParam *bannerParam;
@property(nonatomic,strong)NSMutableArray <NSString *>*dataMutArr;

@end

@implementation MSChuBaoAdMarqueeView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoAdMarqueeViewOnceToken = 0;
    static_chuBaoAdMarqueeView = nil;
}

static MSChuBaoAdMarqueeView *static_chuBaoAdMarqueeView = nil;
static dispatch_once_t static_chuBaoAdMarqueeViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoAdMarqueeViewOnceToken, ^{
        static_chuBaoAdMarqueeView = MSChuBaoAdMarqueeView.new;
    });return static_chuBaoAdMarqueeView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsBlackColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsBlackColor;
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
    self.hornBtn.alpha = 1;
    self.bannerParam.wDataSet(self.dataMutArr);
    [self.bannerView updateUI];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(36));
}
#pragma mark —— 网络请求
-(void)netWorking{
    /// 公告/活动

}
#pragma mark —— lazyLoad
-(BaseButton *)hornBtn{
    if (!_hornBtn) {
        @jobs_weakify(self)
        _hornBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                                 titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:JobsIMG(@"912241CB-F48C-48AC-BC2F-3CA7742C8B1F")
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:Internationalization(@"活动通知")
                                                       subTitle:nil
                                                      titleFont:UIFontWeightBoldSize(14)
                                                   subTitleFont:nil
                                                       titleCor:JobsCor(@"#FFE190")
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:JobsClearColor
                                                   imagePadding:JobsWidth(8)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeLeading
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
             [self jobsToastMsg:Internationalization(@"提现")];
             return nil;
        }];
    }
    [self addSubview:_hornBtn];
    [_hornBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).offset(JobsWidth(10));
        make.height.mas_equalTo(JobsWidth(20));
    }];return _hornBtn;
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
            cell.backgroundLabel.text = self.dataMutArr[indexPath.item];
            cell.backgroundLabel.textColor = JobsWhiteColor;
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
        .wFrameSet(CGRectMake(self.hornBtn.x + self.hornBtn.width + JobsWidth(110),
                              0,
                              [MSChuBaoAdMarqueeView viewSizeWithModel:nil].width - self.hornBtn.width - JobsWidth(110),
                              [MSChuBaoAdMarqueeView viewSizeWithModel:nil].height))
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
        .wMarqueeRateSet(0.5);
    }return _bannerParam;
}

-(WMZBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [WMZBannerView.alloc initConfigureWithModel:self.bannerParam];
        [self addSubview:_bannerView];
    }return _bannerView;
}

-(NSMutableArray <NSString *>*)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        [_dataMutArr addObject:Internationalization(@"我是储宝产品的广告滚动条")];
    }return _dataMutArr;
}

@end
