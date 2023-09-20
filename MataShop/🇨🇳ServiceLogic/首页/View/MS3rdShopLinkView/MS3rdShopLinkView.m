//
//  MS3rdShopLinkView.m
//  MataShop
//
//  Created by Jobs Hi on 9/14/23.
//

#import "MS3rdShopLinkView.h"

@interface MS3rdShopLinkView ()
/// UI
@property(nonatomic,strong)NSMutableArray <BaseButton *>*btnMutArr;
@property(nonatomic,strong)UIImageView *adIMGV1;
@property(nonatomic,strong)UIImageView *adIMGV2;
@property(nonatomic,strong)UIImageView *adIMGV3;
/// Data
@property(nonatomic,strong)NSMutableArray <UIImage *>*btnIMGMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*btnTitleMutArr;

@end

@implementation MS3rdShopLinkView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_shopLinkViewOnceToken = 0;
    static_shopLinkView = nil;
}

static MS3rdShopLinkView *static_shopLinkView = nil;
static dispatch_once_t static_shopLinkViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_shopLinkViewOnceToken, ^{
        static_shopLinkView = MS3rdShopLinkView.new;
    });return static_shopLinkView;
}

-(instancetype)init{
    if (self = [super init]) {
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NotificationAdd(self,
                        @selector(languageSwitchNotification:),
                        LanguageSwitchNotification,
                        nil);
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}

#pragma mark —— 一些私有方法
-(void)masonry{
    // 实现masonry水平固定间隔方法
    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:0
                                     leadSpacing:0
                                     tailSpacing:0];
    // 设置array的垂直方向的约束
    [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(JobsWidth(14));
        make.height.mas_equalTo(JobsWidth(36 + 14 + 10));
    }];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = UIColor.whiteColor;
    [self masonry];
    self.adIMGV1.alpha = 1;
    self.adIMGV2.alpha = 1;
    self.adIMGV3.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(300));
}
#pragma mark —— lazyLoad
-(NSMutableArray<BaseButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
        for (int i = 0; i < self.btnIMGMutArr.count; i++) {
            BaseButton *btn = BaseButton.new;
            btn.normalTitle = self.btnTitleMutArr[i];
            btn.normalImage = self.btnIMGMutArr[i];
            btn.normalTitleColor = RGBA_COLOR(20, 17, 38, 1);
            btn.titleFont = UIFontWeightRegularSize(JobsWidth(14));
            btn.imageViewSize = CGSizeMake(JobsWidth(36), JobsWidth(36));
            [btn makeBtnLabelByShowingType:UILabelShowingType_03];
            [btn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop
                                 imageTitleSpace:JobsWidth(10)];
            [self addSubview:btn];
            [_btnMutArr addObject:btn];
        }
    }return _btnMutArr;
}

-(UIImageView *)adIMGV1{
    if(!_adIMGV1){
        _adIMGV1 = UIImageView.new;
        _adIMGV1.image = JobsIMG(@"商品广告图3");
        //[UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"超值折扣区" ofType:@"gif"]]];
        [self addSubview:_adIMGV1];
        [_adIMGV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(168), JobsWidth(208)));
            make.top.equalTo(self).offset(JobsWidth(82));
            make.left.equalTo(self).offset(JobsWidth(16));
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
            _adIMGV1.tapGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable target,
                                                                       UITapGestureRecognizer *_Nullable arg) {
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
        _adIMGV2.image = JobsIMG(@"商品广告图2");
//        [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"超值" ofType:@"gif"]]];
        [self addSubview:_adIMGV2];
        [_adIMGV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(JobsWidth(-16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(168), JobsWidth(100)));
            make.top.equalTo(self.adIMGV1);
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
            _adIMGV2.tapGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable target,
                                                                       UITapGestureRecognizer *_Nullable arg) {
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
        _adIMGV3.image = JobsIMG(@"商品广告图1");
//        [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"火爆" ofType:@"gif"]]];
        [self addSubview:_adIMGV3];
        [_adIMGV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.adIMGV2);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(168), JobsWidth(100)));
            make.bottom.equalTo(self.adIMGV1.mas_bottom);
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
            _adIMGV3.tapGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable target,
                                                                       UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                [WHToast toastErrMsg:Internationalization(@"火爆")];
            }];
            _adIMGV3.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
        
    }return _adIMGV3;
}

-(NSMutableArray<UIImage *> *)btnIMGMutArr{
    if(!_btnIMGMutArr){
        _btnIMGMutArr = NSMutableArray.array;
        [_btnIMGMutArr addObject:JobsIMG(@"淘宝")];
        [_btnIMGMutArr addObject:JobsIMG(@"京东")];
        [_btnIMGMutArr addObject:JobsIMG(@"美团")];
        [_btnIMGMutArr addObject:JobsIMG(@"唯品会")];
        [_btnIMGMutArr addObject:JobsIMG(@"拼多多")];
    }return _btnIMGMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if(!_btnTitleMutArr){
        _btnTitleMutArr = NSMutableArray.array;
        [_btnTitleMutArr addObject:Internationalization(@"淘宝")];
        [_btnTitleMutArr addObject:Internationalization(@"京东")];
        [_btnTitleMutArr addObject:Internationalization(@"美团")];
        [_btnTitleMutArr addObject:Internationalization(@"唯品会")];
        [_btnTitleMutArr addObject:Internationalization(@"拼多多")];
    }return _btnTitleMutArr;
}

@end
