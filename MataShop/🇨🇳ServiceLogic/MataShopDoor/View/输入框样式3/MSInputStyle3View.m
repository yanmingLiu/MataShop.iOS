//
//  MSInputStyle3View.m
//  MataShop
//
//  Created by Jobs Hi on 9/22/23.
//

#import "MSInputStyle3View.h"

@interface MSInputStyle3View ()
/// UI
@property(nonatomic,strong)JobsMagicTextField *textField;
@property(nonatomic,strong)UIButton *countDownBtn;
/// Data
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;

@end

@implementation MSInputStyle3View
@synthesize viewModel = _viewModel;
- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
    [self.countDownBtn timerDestroy];
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_inputStyle3OnceToken = 0;
    static_inputStyle3View = nil;
//    [self.countDownBtn timerDestroy];
}

static MSInputStyle3View *static_inputStyle3View = nil;
static dispatch_once_t static_inputStyle3OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_inputStyle3OnceToken, ^{
        static_inputStyle3View = MSInputStyle3View.new;
    });return static_inputStyle3View;
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
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {

    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = JobsCor(@"#F9F9F9");
    self.viewModel = model;
    self.countDownBtn.alpha = 1;
    self.textField.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(315), JobsWidth(54));
}
#pragma mark —— 一些私有方法
-(void)textFieldBlock:(JobsMagicTextField *)textField
       textFieldValue:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.objBindingParams = self.textFieldInputModel;
//
//    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
    
//    /// 开始
//    [self.countDownBtn startTimer];
//    /// 暂停
//    [self.countDownBtn timerSuspend];
//    /// 继续
//    [self.countDownBtn timerContinue];
//    /// 结束
//    [self.countDownBtn timerDestroy];
}
#pragma mark —— lazyLoad
-(JobsMagicTextField *)textField{
    if (!_textField) {
        _textField = JobsMagicTextField.new;
        _textField.delegate = self;
        _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.leftView = [UIImageView.alloc initWithImage:self.viewModel.image];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.leftViewOffsetX = JobsWidth(0);
        _textField.placeholdAnimationable = NO;
        _textField.offset = JobsWidth(24);
        _textField.placeholder = self.viewModel.textModel.text;
        _textField.placeholderColor = JobsGrayColor;
        _textField.placeholderFont = UIFontWeightRegularSize(14);
        @jobs_weakify(self)
        [[_textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//            @jobs_strongify(self)
            return YES;
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            [self textFieldBlock:self->_textField
                  textFieldValue:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(220 - 80 - 12), JobsWidth(28)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(12));
            make.right.equalTo(self.countDownBtn.mas_left);
        }];
    }return _textField;
}

-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        _countDownBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel];
        [self addSubview:_countDownBtn];
        [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-20));
        }];
        [_countDownBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        
        [_countDownBtn jobsBtnClickEventBlock:^(UIButton *x) {
            [x startTimer];//选择时机、触发启动
            NSLog(@"🪓🪓🪓🪓🪓 = 获取验证码");
        }];
        
        [_countDownBtn actionObjectBlock:^(id data) {
//            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                TimerProcessModel *model = (TimerProcessModel *)data;
                NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
            }
        }];
    }return _countDownBtn;
}

-(ButtonTimerConfigModel *)btnTimerConfigModel{
    if (!_btnTimerConfigModel) {
        _btnTimerConfigModel = ButtonTimerConfigModel.new;
        
        /// 一些通用的设置
        _btnTimerConfigModel.jobsSize = CGSizeMake(JobsWidth(108), JobsWidth(14));
        _btnTimerConfigModel.count = 6;
        _btnTimerConfigModel.showTimeType = ShowTimeType_SS;//时间显示风格
        _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;/// 逆时针模式（倒计时模式）
        _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;
        _btnTimerConfigModel.labelShowingType = UILabelShowingType_03;/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        _btnTimerConfigModel.secondStr = Internationalization(@"秒后重新发送");
        /// 计时器未开始【静态值】
        _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 0.1;
        _btnTimerConfigModel.readyPlayValue.layerCornerRadius = JobsWidth(8);
        _btnTimerConfigModel.readyPlayValue.bgCor = JobsCor(@"#F9F9F9");
        _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.readyPlayValue.textCor = JobsCor(@"#333333");
        _btnTimerConfigModel.readyPlayValue.text = Internationalization(@"获取验证码");
        _btnTimerConfigModel.readyPlayValue.font = UIFontWeightRegularSize(14);
        /// 计时器进行中【动态值】
        _btnTimerConfigModel.runningValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.runningValue.text = Internationalization(@"");
        _btnTimerConfigModel.runningValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.runningValue.textCor = JobsCor(@"#333333");
        /// 计时器结束【静态值】
        _btnTimerConfigModel.endValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.endValue.text = Internationalization(@"重新获取");
        _btnTimerConfigModel.endValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.endValue.textCor = JobsCor(@"#333333");
        
    }return _btnTimerConfigModel;
}

@end
