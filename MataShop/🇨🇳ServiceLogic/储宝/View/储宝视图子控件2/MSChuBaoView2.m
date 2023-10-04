//
//  MSChuBaoView2.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView2.h"

@interface MSChuBaoView2 ()
/// UI
@property(nonatomic,strong)BaseButton *lab1;// 定期余额
@property(nonatomic,strong)BaseButton *lab2;// 活期余额
@property(nonatomic,strong)BaseButton *lab3;// 前一日定期收益
@property(nonatomic,strong)BaseButton *lab4;// 前一日活期收益
@property(nonatomic,strong)BaseButton *lab5;// 前一日总收益
@property(nonatomic,strong)BaseButton *lab6;// 储宝总资产
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
    self.lab1.alpha = 1;
    self.lab2.alpha = 1;
    self.lab3.alpha = 1;
    self.lab4.alpha = 1;
    self.lab5.alpha = 1;
    self.lab6.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(156));
}
#pragma mark —— lazyLoad
-(BaseButton *)lab1{
    if(!_lab1){
        @jobs_weakify(self)
        _lab1 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
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
        [self addSubview:_lab1];
        [_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(38));
            make.top.equalTo(self).offset(JobsWidth(16));
        }];
    }return _lab1;
}

-(BaseButton *)lab2{
    if(!_lab2){
        @jobs_weakify(self)
        _lab2 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                               textAlignment:NSTextAlignmentRight
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
        [self addSubview:_lab2];
        [_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(JobsWidth(-38));
            make.top.equalTo(self).offset(JobsWidth(16));
        }];
    }return _lab2;
}

-(BaseButton *)lab3{
    if(!_lab3){
        @jobs_weakify(self)
        _lab3 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
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
        [self addSubview:_lab3];
        [_lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab1);
            make.top.equalTo(self.lab1.mas_bottom).offset(JobsWidth(8));
        }];
    }return _lab3;
}

-(BaseButton *)lab4{
    if(!_lab4){
        @jobs_weakify(self)
        _lab4 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                               textAlignment:NSTextAlignmentRight
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
        [self addSubview:_lab4];
        [_lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.lab2);
            make.top.equalTo(self.lab3);
        }];
    }return _lab4;
}

-(BaseButton *)lab5{
    if(!_lab5){
        @jobs_weakify(self)
        _lab5 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
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
        [self addSubview:_lab5];
        [_lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab3);
            make.top.equalTo(self.lab3.mas_bottom).offset(JobsWidth(8));
        }];
    }return _lab5;
}

-(BaseButton *)lab6{
    if(!_lab6){
        @jobs_weakify(self)
        _lab6 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                               textAlignment:NSTextAlignmentRight
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
        [self addSubview:_lab6];
        [_lab6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.lab4);
            make.top.equalTo(self.lab5);
        }];
    }return _lab6;
}

@end
