//
//  MSThirdPartyShortcutLoginPanelView.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSThirdPartyShortcutLoginPanelView.h"

@interface MSThirdPartyShortcutLoginPanelView ()
/// UI
@property(nonatomic,strong)UILabel *leftLine;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *rightLine;
@property(nonatomic,strong)UIButton *qqLoginBtn;
@property(nonatomic,strong)UIButton *wechatLoginBtn;
/// Data

@end

@implementation MSThirdPartyShortcutLoginPanelView

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_thirdPartyShortcutLoginPanelViewOnceToken = 0;
    static_thirdPartyShortcutLoginPanelView = nil;
}

static MSThirdPartyShortcutLoginPanelView *static_thirdPartyShortcutLoginPanelView = nil;
static dispatch_once_t static_thirdPartyShortcutLoginPanelViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_thirdPartyShortcutLoginPanelViewOnceToken, ^{
        static_thirdPartyShortcutLoginPanelView = MSThirdPartyShortcutLoginPanelView.new;
    });return static_thirdPartyShortcutLoginPanelView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
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
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
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
    self.titleLab.alpha = 1;
    self.leftLine.alpha = 1;
    self.rightLine.alpha = 1;
    self.qqLoginBtn.alpha = 1;
    self.wechatLoginBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(315.13), JobsWidth(67));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"使用第三方帐号快捷登录");
        _titleLab.textColor = JobsCor(@"#333333");
        _titleLab.font = UIFontWeightRegularSize(JobsWidth(14));
        _titleLab.backgroundColor = JobsGrayColor;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.centerX.equalTo(self);
            make.top.equalTo(self);
        }];
        [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    }return _titleLab;
}

-(UILabel *)leftLine{
    if(!_leftLine){
        _leftLine = UILabel.new;
        _leftLine.backgroundColor = JobsGrayColor;
        [self addSubview:_leftLine];
        [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(70), JobsWidth(1)));
            make.right.equalTo(self.titleLab.mas_left);
            make.centerY.equalTo(self.titleLab);
        }];
    }return _leftLine;
}

-(UILabel *)rightLine{
    if(!_rightLine){
        _rightLine = UILabel.new;
        [self addSubview:_rightLine];
        [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(70), JobsWidth(1)));
            make.left.equalTo(self.titleLab.mas_right);
            make.centerY.equalTo(self.titleLab);
        }];
    }return _rightLine;
}

-(UIButton *)qqLoginBtn{
    if(!_qqLoginBtn){
        _qqLoginBtn = UIButton.new;
        _qqLoginBtn.normalBackgroundImage = JobsIMG(@"微信登录");
        [self addSubview:_qqLoginBtn];
        [_qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(36), JobsWidth(36)));
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(17));
            make.left.equalTo(self).offset(JobsWidth(96.3));
        }];
        @jobs_weakify(self)
        [_qqLoginBtn jobsBtnClickEventBlock:^(id data) {
            @jobs_strongify(self)
        }];
    }return _qqLoginBtn;
}

-(UIButton *)wechatLoginBtn{
    if(!_wechatLoginBtn){
        _wechatLoginBtn = UIButton.new;
        _wechatLoginBtn.normalBackgroundImage = JobsIMG(@"QQ登录");
        [self addSubview:_wechatLoginBtn];
        [_wechatLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(36), JobsWidth(36)));
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(17));
            make.right.equalTo(self).offset(JobsWidth(-96.3));
        }];
    }return _wechatLoginBtn;
}

@end
