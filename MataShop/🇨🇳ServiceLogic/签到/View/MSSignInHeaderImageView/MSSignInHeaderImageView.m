//
//  MSSignInHeaderImageView.m
//  MataShop
//
//  Created by Jobs Hi on 10/12/23.
//

#import "MSSignInHeaderImageView.h"

@interface MSSignInHeaderImageView ()
/// UI
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UILabel *titleLab;

@end

@implementation MSSignInHeaderImageView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_signInHeaderImageViewOnceToken = 0;
    static_signInHeaderImageView = nil;
}

static MSSignInHeaderImageView *static_signInHeaderImageView = nil;
static dispatch_once_t static_signInHeaderImageViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_signInHeaderImageViewOnceToken, ^{
        static_signInHeaderImageView = MSSignInHeaderImageView.new;
    });return static_signInHeaderImageView;
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
    self.size = [MSSignInHeaderImageView viewSizeWithModel:nil];
    /// 内部指定圆切角
    [self.titleLab layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                             cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.backgroundColor = JobsRedColor;
    self.image = JobsIMG(@"签到背景图");
    self.btn.alpha = 1;
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(217));
}
#pragma mark —— lazyLoad
-(UIButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                             titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:nil
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:Internationalization(@"当前签到奖励")
                                                   subTitle:nil
                                                  titleFont:UIFontWeightMediumSize(14)
                                               subTitleFont:UIFontWeightBoldSize(28)
                                                   titleCor:JobsCor(@"#FFFFFF")
                                                subTitleCor:JobsCor(@"#FFFFFF")
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
                                        baseBackgroundColor:UIColor.clearColor
                                               imagePadding:JobsWidth(0)
                                               titlePadding:JobsWidth(10)
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
        [self addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(25));
            make.top.equalTo(self).offset(JobsWidth(103));
            make.height.mas_equalTo(JobsWidth(14 + 10 + 38));
        }];
    }
    _btn.jobsResetSubtitle(@"2222");
    [_btn makeBtnLabelByShowingType:UILabelShowingType_03];
    return _btn;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.backgroundColor = JobsWhiteColor;
        _titleLab.font = UIFontWeightBoldSize(16);
        _titleLab.textColor = JobsCor(@"#333333");
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(15));
            make.right.equalTo(self).offset(JobsWidth(-15));
            make.height.mas_equalTo(JobsWidth(50));
        }];
    }
    _titleLab.text = [NSString stringWithFormat:@"%@%d",Internationalization(@"本月已签到天数:"),5].resetStringByFontString(@"     ");
    return _titleLab;
}

@end
