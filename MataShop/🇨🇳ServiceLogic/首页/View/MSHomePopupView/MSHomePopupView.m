//
//  MSHomePopupView.m
//  MataShop
//
//  Created by Jobs Hi on 9/14/23.
//

#import "MSHomePopupView.h"

@interface MSHomePopupView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)BaseButton *leftBtn;
@property(nonatomic,strong)BaseButton *rightBtn;
/// Data
@property(nonatomic,strong)UIButtonConfiguration *leftBtnConfig;
@property(nonatomic,strong)UIButtonConfiguration *rightBtnConfig;

@end

@implementation MSHomePopupView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_homePopupViewOnceToken = 0;
    static_homePopupView = nil;
}

static MSHomePopupView *static_homePopupView = nil;
static dispatch_once_t static_homePopupViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_homePopupViewOnceToken, ^{
        static_homePopupView = MSHomePopupView.new;
    });return static_homePopupView;
}
#pragma mark —— SysMethod
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
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerAllCorners
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    
    self.backgroundColor = JobsCor(@"#FFFFFF");
    self.titleLab.alpha = 1;
    self.textView.alpha = 1;
    self.line.alpha = 1;
    self.leftBtn.alpha = 1;
    self.rightBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(328), JobsWidth(392));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = JobsCor(@"#686868");
        _titleLab.font = UIFontWeightLightSize(20);
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(JobsWidth(24));
            make.height.mas_equalTo(JobsWidth(24));
            make.centerX.equalTo(self);
        }];
    }
    _titleLab.text = Internationalization(@"欢迎加入Mata商城");
    [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    return _titleLab;
}

-(UITextView *)textView{
    if(!_textView){
        _textView = UITextView.new;
        _textView.text = Internationalization(@"Mata商城是集成淘宝、京东、美团、唯品会、拼多多为一体的综合性商城。Mata商城结合未来wbe3.0概念“平台仅仅是为创业者搭建的孵化基地”存入Mata学习基金在学习 创业知识的同时还能够享受Mata创业平台补助，加入创业团队享受Mata各项福利政策，存入学习基金按照日利率% 每日返还，根据不同岗位五年可获得5-15倍收益");
        _textView.font = UIFontWeightLightSize(16);
        _textView.textColor = JobsCor(@"#888888");
        _textView.editable = NO;
        [self addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(288), JobsWidth(190 + 49)));
            make.centerX.equalTo(self);
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(20));
        }];
        [_textView cornerCutToCircleWithCornerRadius:8];
    }return _textView;
}

-(UILabel *)line{
    if(!_line){
        _line = UILabel.new;
        _line.backgroundColor = JobsCor(@"#EAECEF");
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(300), JobsWidth(1)));
            make.centerX.equalTo(self);
        }];
    }return _line;
}

-(BaseButton *)leftBtn{
    if(!_leftBtn){
        if(self.deviceSystemVersion.floatValue >= 15.0){
            _leftBtn = [BaseButton buttonWithConfiguration:self.leftBtnConfig primaryAction:nil];
        }else{
            _leftBtn = BaseButton.new;
            _leftBtn.normalTitle = Internationalization(@"关注招聘资讯");
            _leftBtn.normalTitleColor = JobsBlackColor;
            _leftBtn.titleFont = UIFontWeightRegularSize(16);
            _leftBtn.backgroundColor = HEXCOLOR(0xEAECEF);
        }
        [self addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(140), JobsWidth(40)));
            make.bottom.equalTo(self).offset(JobsWidth(-24));
            make.left.equalTo(self).offset(JobsWidth(14));
        }];
        [_leftBtn cornerCutToCircleWithCornerRadius:JobsWidth(14)];
        [_leftBtn layerBorderCor:JobsCor(@"#EAECEF") andBorderWidth:1];
        @jobs_weakify(self)
        [_leftBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
//            [WHToast toastErrMsg:Internationalization(@"关注招聘资讯")];
            [self cancelBtnActionForPopView:x];
            [self forceComingToPushVC:MSInternalRecruitmentVC.new requestParams:nil];
            return nil;
        }];
    }return _leftBtn;
}

-(BaseButton *)rightBtn{
    if(!_rightBtn){
        if(self.deviceSystemVersion.floatValue >= 15.0){
            _rightBtn = BaseButton.new;
//            [BaseButton buttonWithConfiguration:self.rightBtnConfig primaryAction:nil];
            _rightBtn.configuration = self.rightBtnConfig;
        }else{
            _rightBtn = BaseButton.new;
            _rightBtn.normalTitle = Internationalization(@"进入Mata商城");
            _rightBtn.normalTitleColor = JobsWhiteColor;
            _rightBtn.titleFont = UIFontWeightRegularSize(16);
            _rightBtn.backgroundColor = JobsCor(@"#EA0000");
        }
        
        [self addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(140), JobsWidth(40)));
            make.bottom.equalTo(self).offset(JobsWidth(-24));
            make.right.equalTo(self).offset(JobsWidth(-14));
        }];
        [_rightBtn cornerCutToCircleWithCornerRadius:JobsWidth(14)];
        @jobs_weakify(self)
        [_rightBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
//            [WHToast toastErrMsg:Internationalization(@"进入Mata商城")];
            [self cancelBtnActionForPopView:x];
            return nil;
        }];
    }return _rightBtn;
}

-(UIButtonConfiguration *)leftBtnConfig{
    if(!_leftBtnConfig){
        _leftBtnConfig = UIButtonConfiguration.filledButtonConfiguration;
        
        {// 一般的文字
            _leftBtnConfig.title = Internationalization(@"关注招聘资讯");
            _leftBtnConfig.subtitle = @"";
            _leftBtnConfig.baseForegroundColor = UIColor.blackColor;// 前景颜色（= 文字颜色）
        }
        
        {// 富文本
            // 设置按钮标题的文本属性
            _leftBtnConfig.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
                NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
                [newTextAttributes addEntriesFromDictionary:@{
                    NSFontAttributeName:UIFontWeightRegularSize(16), // 替换为你想要的字体和大小
                    NSForegroundColorAttributeName: UIColor.blackColor // 替换为你想要的文本颜色
                }];
                return newTextAttributes.copy;
            };
            _leftBtnConfig.attributedTitle = [NSAttributedString.alloc initWithString:Internationalization(@"关注招聘资讯") attributes:@{NSForegroundColorAttributeName:UIColor.blackColor}];
        }
        
        {// 其他
            _leftBtnConfig.baseBackgroundColor = HEXCOLOR(0xEAECEF);// 背景颜色
            _leftBtnConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0); // 内边距
        }
    }return _leftBtnConfig;
}

-(UIButtonConfiguration *)rightBtnConfig{
    if(!_rightBtnConfig){
        _rightBtnConfig = UIButtonConfiguration.filledButtonConfiguration;

        {// 一般的文字
            _rightBtnConfig.title = Internationalization(@"入职Mata");
            _rightBtnConfig.subtitle = @"";
            _rightBtnConfig.baseForegroundColor = UIColor.whiteColor;// 前景颜色（= 文字颜色）
        }
        
        {// 富文本
            // 设置按钮标题的文本属性
            _rightBtnConfig.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
                NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
                [newTextAttributes addEntriesFromDictionary:@{
                    NSFontAttributeName:UIFontWeightRegularSize(16), // 替换为你想要的字体和大小
                    NSForegroundColorAttributeName: UIColor.whiteColor // 替换为你想要的文本颜色
                }];return newTextAttributes.copy;
            };
            _rightBtnConfig.attributedTitle = [NSAttributedString.alloc initWithString:Internationalization(@"入职Mata") attributes:@{NSForegroundColorAttributeName:UIColor.redColor}];
        }
        
        {// 其他
            _rightBtnConfig.baseBackgroundColor = JobsCor(@"#EA0000");// 背景颜色
            _rightBtnConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0); // 内边距
        }
    }return _rightBtnConfig;
}

@end
