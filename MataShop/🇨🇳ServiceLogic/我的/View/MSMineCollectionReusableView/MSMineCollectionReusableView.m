//
//  MSMineCollectionReusableView.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMineCollectionReusableView.h"

@interface MSMineCollectionReusableView ()
/// UI
@property(nonatomic,strong)UIImageView *bgImgView;
@property(nonatomic,strong)BaseButton *userInfoBtn;
@property(nonatomic,strong)UIButton *rightArrowBtn;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
/// Data

@end

@implementation MSMineCollectionReusableView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_mineView2OnceToken = 0;
    static_mineView2 = nil;
}

static MSMineCollectionReusableView *static_mineView2 = nil;
static dispatch_once_t static_mineView2OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_mineView2OnceToken, ^{
        static_mineView2 = MSMineCollectionReusableView.new;
    });return static_mineView2;
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
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = JobsWhiteColor;
    self.viewModel = model ? : UIViewModel.new;
    [super richElementsInViewWithModel:model];
    
    self.userInteractionEnabled = YES;
    self.bgImgView.alpha = 1;
    self.userInfoBtn.alpha = 1;
    self.rightArrowBtn.alpha = 1;
    
    self.btn1.alpha = 1;
    self.btn2.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(CGSize)collectionReusableViewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(218));
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImgView{
    if(!_bgImgView){
        _bgImgView = UIImageView.new;
        _bgImgView.image = JobsIMG(@"个人中心背景图片");
        [self addSubview:_bgImgView];
        [_bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo([MSMineCollectionReusableView collectionReusableViewSizeWithModel:nil].height - JobsWidth(50));
        }];
    }return _bgImgView;
}

-(BaseButton *)userInfoBtn{
    if(!_userInfoBtn){
        @jobs_weakify(self)
        _userInfoBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:nil
                                                           subTitle:nil
                                                          titleFont:UIFontWeightBoldSize(18)
                                                       subTitleFont:UIFontWeightRegularSize(14)
                                                           titleCor:JobsWhiteColor
                                                        subTitleCor:JobsWhiteColor
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:JobsClearColor
                                                       imagePadding:JobsWidth(15)
                                                       titlePadding:JobsWidth(5)
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
            [self forceComingToPushVC:MSMyInfoVC.new requestParams:nil];
            return nil;
        }];
        [self addSubview:_userInfoBtn];
        [_userInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(70));
            make.bottom.equalTo(self.bgImgView.mas_bottom).offset(JobsWidth(-20));
            make.left.equalTo(self).offset(JobsWidth(15));
        }];
    }
    _userInfoBtn.jobsResetImage(self.readUserInfo.userHeaderIMG);
    _userInfoBtn.jobsResetTitle(self.readUserInfo.userName);
    _userInfoBtn.jobsResetSubtitle(Internationalization(@"138****8888"));
    [_userInfoBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    return _userInfoBtn;
}

-(UIButton *)rightArrowBtn{
    if(!_rightArrowBtn){
        @jobs_weakify(self)
        _rightArrowBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                           background:nil
                                                       titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                        textAlignment:NSTextAlignmentCenter
                                                     subTextAlignment:NSTextAlignmentCenter
                                                          normalImage:JobsIMG(@"向右箭头")
                                                       highlightImage:nil
                                                      attributedTitle:nil
                                              selectedAttributedTitle:nil
                                                   attributedSubtitle:nil
                                                                title:nil
                                                             subTitle:nil
                                                            titleFont:nil
                                                         subTitleFont:nil
                                                             titleCor:nil
                                                          subTitleCor:nil
                                                   titleLineBreakMode:NSLineBreakByWordWrapping
                                                subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                  baseBackgroundColor:UIColor.clearColor
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
            [self jobsToastMsg:Internationalization(@"编辑个人资料")];
            return nil;
        }];
        [self addSubview:_rightArrowBtn];
        [_rightArrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(20), JobsWidth(20)));
            make.centerY.equalTo(self.userInfoBtn);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
    }return _rightArrowBtn;
}

-(UIButton *)btn1{
    if(!_btn1){
        @jobs_weakify(self)
        _btn1 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:JobsIMG(@"入职Mata")
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"入职Mata")
                                                    subTitle:nil
                                                   titleFont:UIFontWeightRegularSize(14)
                                                subTitleFont:nil
                                                    titleCor:JobsBlackColor
                                                 subTitleCor:nil
                                          titleLineBreakMode:NSLineBreakByWordWrapping
                                       subtitleLineBreakMode:NSLineBreakByWordWrapping
                                         baseBackgroundColor:UIColor.whiteColor
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
            return nil;
        }];
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImgView.mas_bottom).offset(JobsWidth(15));
            make.bottom.equalTo(self).offset(JobsWidth(-15));
            make.left.equalTo(self).offset(JobsWidth(15));
        }];
    }return _btn1;
}

-(UIButton *)btn2{
    if(!_btn2){
        @jobs_weakify(self)
        _btn2 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                              titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:Internationalization(@"立即进入")
                                                    subTitle:nil
                                                   titleFont:UIFontWeightRegularSize(14)
                                                subTitleFont:nil
                                                    titleCor:JobsWhiteColor
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
                                           cornerRadiusValue:JobsWidth(14)
                                             roundingCorners:UIRectCornerAllCorners
                                        roundingCornersRadii:CGSizeZero
                                              layerBorderCor:nil
                                                 borderWidth:JobsWidth(0)
                                               primaryAction:nil
                                             clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self forceComingToPushVC:MSInternalRecruitmentVC.new requestParams:nil];
            return nil;
        }];
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
            make.centerY.equalTo(self.btn1);
            make.right.equalTo(self).offset(JobsWidth(-15));
        }];
    }return _btn2;
}

@end
