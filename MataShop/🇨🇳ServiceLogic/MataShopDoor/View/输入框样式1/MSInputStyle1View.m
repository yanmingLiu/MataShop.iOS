//
//  MSInputStyle1View.m
//  MataShop
//
//  Created by Jobs Hi on 9/22/23.
//

#import "MSInputStyle1View.h"

@interface MSInputStyle1View ()

@property(nonatomic,strong)JobsMagicTextField *textField;

@end

@implementation MSInputStyle1View
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_inputStyle1OnceToken = 0;
    static_inputStyle1View = nil;
}

static MSInputStyle1View *static_inputStyle1View = nil;
static dispatch_once_t static_inputStyle1OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_inputStyle1OnceToken, ^{
        static_inputStyle1View = MSInputStyle1View.new;
    });return static_inputStyle1View;
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
-(void)textFieldBlock:(JobsMagicTextField *)textField
       textFieldValue:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.objBindingParams = self.textFieldInputModel;
//
//    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
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
            make.size.mas_equalTo(CGSizeMake([MSInputStyle1View viewSizeWithModel:nil].width - JobsWidth(32 + 12), JobsWidth(28)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(12));
        }];
    }return _textField;
}

@end
