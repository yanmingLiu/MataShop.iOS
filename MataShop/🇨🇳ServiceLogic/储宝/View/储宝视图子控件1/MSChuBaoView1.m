//
//  MSChuBaoView1.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView1.h"

@interface MSChuBaoView1 ()
/// UI
@property(nonatomic,strong)BaseButton *titleBtn;
@property(nonatomic,strong)BaseButton *rechargeBtn;// 充值
@property(nonatomic,strong)BaseButton *withdrawBtn;// 提现
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;

@end

@implementation MSChuBaoView1
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoView1OnceToken = 0;
    static_chuBaoView1 = nil;
}

static MSChuBaoView1 *static_chuBaoView1 = nil;
static dispatch_once_t static_chuBaoView1OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoView1OnceToken, ^{
        static_chuBaoView1 = MSChuBaoView1.new;
    });return static_chuBaoView1;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.image = JobsIMG(@"储宝背景图");
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
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
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.titleBtn.alpha = 1;
    self.withdrawBtn.alpha = 1;
    self.rechargeBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(92));
}
#pragma mark —— lazyLoad
-(BaseButton *)titleBtn{
    if(!_titleBtn){
        @jobs_weakify(self)
        _titleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                                   titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:JobsIMG(@"我的余额")
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:Internationalization(@"我的余额")
                                                         subTitle:Internationalization(@"45466")
                                                        titleFont:UIFontWeightRegularSize(14)
                                                     subTitleFont:UIFontWeightRegularSize(20)
                                                         titleCor:JobsWhiteColor
                                                      subTitleCor:JobsWhiteColor
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:JobsClearColor
                                                     imagePadding:JobsWidth(8)
                                                     titlePadding:JobsWidth(8)
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
            [self forceComingToPushVC:MSTopUpVC.new requestParams:@""];
            return nil;
        }];
        [self addSubview:_titleBtn];
        [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(23));
            make.top.equalTo(self).offset(JobsWidth(24));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(50)));
        }];
    }return _titleBtn;
}

-(BaseButton *)rechargeBtn{
    if(!_rechargeBtn){
        @jobs_weakify(self)
        _rechargeBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:Internationalization(@"充值")
                                                           subTitle:nil
                                                          titleFont:UIFontWeightBoldSize(12)
                                                       subTitleFont:nil
                                                           titleCor:JobsWhiteColor
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
                                                  cornerRadiusValue:JobsWidth(16)
                                                    roundingCorners:UIRectCornerAllCorners
                                               roundingCornersRadii:CGSizeZero
                                                     layerBorderCor:JobsCor(@"#FFE4BE")
                                                        borderWidth:JobsWidth(1)
                                                      primaryAction:nil
                                                    clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self forceComingToPushVC:MSTopUpVC.new requestParams:@""];
            return nil;
        }];
        [self addSubview:_rechargeBtn];
        [_rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-104));
        }];
    }return _rechargeBtn;
}

-(BaseButton *)withdrawBtn{
    if(!_withdrawBtn){
        @jobs_weakify(self)
        _withdrawBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:Internationalization(@"提现")
                                                           subTitle:nil
                                                          titleFont:UIFontWeightBoldSize(12)
                                                       subTitleFont:nil
                                                           titleCor:JobsCor(@"#EA2918")
                                                        subTitleCor:nil
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:UIColor.whiteColor
                                                       imagePadding:JobsWidth(0)
                                                       titlePadding:JobsWidth(0)
                                                     imagePlacement:NSDirectionalRectEdgeNone
                                         contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                           contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                      contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                  cornerRadiusValue:JobsWidth(16)
                                                    roundingCorners:UIRectCornerAllCorners
                                               roundingCornersRadii:CGSizeZero
                                                     layerBorderCor:JobsWhiteColor
                                                        borderWidth:JobsWidth(1)
                                                      primaryAction:nil
                                                    clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastMsg:Internationalization(@"提现")];
            return nil;
        }];

        [self addSubview:_withdrawBtn];
        [_withdrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
    }return _withdrawBtn;
}

@end
