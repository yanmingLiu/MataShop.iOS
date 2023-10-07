//
//  MSChuBaoView2.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView2.h"

@interface MSChuBaoView2 ()
/// UI
@property(nonatomic,strong)BaseButton *btn1;// 定期余额
@property(nonatomic,strong)BaseButton *btn2;// 活期余额
@property(nonatomic,strong)BaseButton *btn3;// 前一日定期收益
@property(nonatomic,strong)BaseButton *btn4;// 前一日活期收益
@property(nonatomic,strong)BaseButton *btn5;// 前一日总收益
@property(nonatomic,strong)BaseButton *btn6;// 储宝总资产
/// Data

@end

@implementation MSChuBaoView2
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoView2OnceToken = 0;
    static_chuBaoView2 = nil;
}

static MSChuBaoView2 *static_chuBaoView2 = nil;
static dispatch_once_t static_chuBaoView2OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoView2OnceToken, ^{
        static_chuBaoView2 = MSChuBaoView2.new;
    });return static_chuBaoView2;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
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
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.btn1.alpha = 1;
    self.btn2.alpha = 1;
    self.btn3.alpha = 1;
    self.btn4.alpha = 1;
    self.btn5.alpha = 1;
    self.btn6.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(156));
}
#pragma mark —— lazyLoad
-(BaseButton *)btn1{
    if(!_btn1){
        @jobs_weakify(self)
        _btn1 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"定期余额")
                                                    subTitle:@"24224"
                                                   titleFont:UIFontWeightLightSize(12)
                                                subTitleFont:UIFontWeightBoldSize(16)
                                                    titleCor:JobsCor(@"#EA2918")
                                                 subTitleCor:JobsCor(@"#333333")
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
            return nil;
        }];
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(38));
            make.top.equalTo(self).offset(JobsWidth(16));
        }];
    }return _btn1;
}

-(BaseButton *)btn2{
    if(!_btn2){
        @jobs_weakify(self)
        _btn2 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                               textAlignment:NSTextAlignmentRight
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"活期余额")
                                                    subTitle:@"24224"
                                                   titleFont:UIFontWeightLightSize(12)
                                                subTitleFont:UIFontWeightBoldSize(16)
                                                    titleCor:JobsCor(@"#EA2918")
                                                 subTitleCor:JobsCor(@"#333333")
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
            return nil;
        }];
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(JobsWidth(-38));
            make.top.equalTo(self).offset(JobsWidth(16));
        }];
    }return _btn2;
}

-(BaseButton *)btn3{
    if(!_btn3){
        @jobs_weakify(self)
        _btn3 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"前一日定期收益")
                                                    subTitle:@"24224"
                                                   titleFont:UIFontWeightLightSize(12)
                                                subTitleFont:UIFontWeightBoldSize(16)
                                                    titleCor:JobsCor(@"#EA2918")
                                                 subTitleCor:JobsCor(@"#333333")
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
            return nil;
        }];
        [self addSubview:_btn3];
        [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn1);
            make.top.equalTo(self.btn1.mas_bottom).offset(JobsWidth(8));
        }];
    }return _btn3;
}

-(BaseButton *)btn4{
    if(!_btn4){
        @jobs_weakify(self)
        _btn4 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                               textAlignment:NSTextAlignmentRight
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"前一日活期收益")
                                                    subTitle:@"24224"
                                                   titleFont:UIFontWeightLightSize(12)
                                                subTitleFont:UIFontWeightBoldSize(16)
                                                    titleCor:JobsCor(@"#EA2918")
                                                 subTitleCor:JobsCor(@"#333333")
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
            return nil;
        }];
        [self addSubview:_btn4];
        [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.btn2);
            make.top.equalTo(self.btn3);
        }];
    }return _btn4;
}

-(BaseButton *)btn5{
    if(!_btn5){
        @jobs_weakify(self)
        _btn5 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"前一日活期收益")
                                                    subTitle:@"24224"
                                                   titleFont:UIFontWeightLightSize(12)
                                                subTitleFont:UIFontWeightBoldSize(16)
                                                    titleCor:JobsCor(@"#EA2918")
                                                 subTitleCor:JobsCor(@"#333333")
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
            return nil;
        }];
        [self addSubview:_btn5];
        [_btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn3);
            make.top.equalTo(self.btn3.mas_bottom).offset(JobsWidth(8));
        }];
    }return _btn5;
}

-(BaseButton *)btn6{
    if(!_btn6){
        @jobs_weakify(self)
        _btn6 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                               textAlignment:NSTextAlignmentRight
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"储宝总资产")
                                                    subTitle:@"24224"
                                                   titleFont:UIFontWeightLightSize(12)
                                                subTitleFont:UIFontWeightBoldSize(16)
                                                    titleCor:JobsCor(@"#EA2918")
                                                 subTitleCor:JobsCor(@"#333333")
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
            return nil;
        }];
        [self addSubview:_btn6];
        [_btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.btn4);
            make.top.equalTo(self.btn5);
        }];
    }return _btn6;
}

@end
