//
//  MSInputStyle2View.m
//  MataShop
//
//  Created by Jobs Hi on 9/22/23.
//

#import "MSInputStyle2View.h"

@interface MSInputStyle2View ()
/// UI
@property(nonatomic,strong)MSInputTextFieldLeftView *inputTextFieldLeftView;
@property(nonatomic,strong)ZYTextField *textField;

@end

@implementation MSInputStyle2View
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_inputStyle2ViewOnceToken = 0;
    static_inputStyle2View = nil;
}

static MSInputStyle2View *static_inputStyle2View = nil;
static dispatch_once_t static_inputStyle2ViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_inputStyle2ViewOnceToken, ^{
        static_inputStyle2View = MSInputStyle2View.new;
    });return static_inputStyle2View;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        
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
    self.backgroundColor = JobsCor(@"#F9F9F9");
    self.viewModel = model;
    self.textField.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(315), JobsWidth(54));
}
#pragma mark —— 一些私有方法
-(void)textFieldBlock:(ZYTextField *)textField
       textFieldValue:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.objBindingParams = self.textFieldInputModel;
//
//    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        _textField.backgroundColor = JobsCor(@"#F9F9F9");
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.leftView = self.inputTextFieldLeftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.leftViewOffsetX = JobsWidth(0);
        _textField.offset = JobsWidth(24 + 43 + 15);
        _textField.placeholder = self.viewModel.textModel.text;
        _textField.placeholderColor = JobsGrayColor;
        _textField.placeholderFont = UIFontWeightRegularSize(14);
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            return YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            [self textFieldBlock:self->_textField
                  textFieldValue:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake([MSInputStyle2View viewSizeWithModel:nil].width - JobsWidth(32 + 12), JobsWidth(28)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(12));
        }];
    }return _textField;
}

-(MSInputTextFieldLeftView *)inputTextFieldLeftView{
    if(!_inputTextFieldLeftView){
        _inputTextFieldLeftView = MSInputTextFieldLeftView.new;
        [self addSubview:_inputTextFieldLeftView];
        [_inputTextFieldLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSInputTextFieldLeftView viewSizeWithModel:nil]);
        }];
        [_inputTextFieldLeftView richElementsInViewWithModel:nil];
    }return _inputTextFieldLeftView;
}

@end
