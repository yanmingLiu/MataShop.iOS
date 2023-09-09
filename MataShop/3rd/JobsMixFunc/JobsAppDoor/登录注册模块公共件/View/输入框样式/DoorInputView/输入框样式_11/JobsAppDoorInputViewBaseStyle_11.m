//
//  JobsAppDoorInputViewBaseStyle_11.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/20.
//

#import "JobsAppDoorInputViewBaseStyle_11.h"

@interface JobsAppDoorInputViewBaseStyle_11 ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)ZYTextField *textField;
/// Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_11

@synthesize thisViewSize = _thisViewSize;

- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;

        [self layerBorderColour:JobsWhiteColor andBorderWidth:1];
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
        [self layerBorderColour:JobsWhiteColor andBorderWidth:1];
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.objBindingParams = self.textFieldInputModel;
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? :  JobsWidth(17);
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : PlaceHolderAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(ZYTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
    textField.objBindingParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(345), JobsWidth(30));
}

-(void)richElementsInViewWithModel:(JobsAppDoorInputViewBaseStyleModel *_Nullable)doorInputViewBaseStyleModel{
    self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;

    self.textField.alpha = 1;
    [self configTextField];
    self.titleLab.alpha = 1;
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)getTextFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = [NSString isNullString:self.doorInputViewBaseStyleModel.textModel.text] ? Internationalization(@"我是标题") : self.doorInputViewBaseStyleModel.textModel.text;
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = self.doorInputViewBaseStyleModel.textModel.font ? : [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
        _titleLab.textColor = HEXCOLOR(0x757575);
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self).offset(self.doorInputViewBaseStyleModel.offsetXForEach);
//            make.right.equalTo(self.textField.mas_left);
        }];
        [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    }return _titleLab;
}

-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
//        _textField.backgroundColor = UIColor.redColor;
        _textField.delegate = self;

        @jobs_weakify(self)
        [_textField textFieldEventFilterBlock:^BOOL(id data) {
            return YES;
        } subscribeNextBlock:^(id x) {
            @jobs_strongify(self)
            [self block:self->_textField
                  value:x];
        }];
        
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(JobsWidth(224 + 43));
        }];
    }return _textField;
}

-(JobsAppDoorInputViewBaseStyleModel *)doorInputViewBaseStyleModel{
    if (!_doorInputViewBaseStyleModel) {
        _doorInputViewBaseStyleModel = JobsAppDoorInputViewBaseStyleModel.new;
//        _doorInputViewBaseStyleModel.leftViewIMG = JobsIMG(@"安全");
        _doorInputViewBaseStyleModel.placeHolderStr = [NSString isNullString:self.doorInputViewBaseStyleModel.subTextModel.text] ? Internationalization(@"我是副标题（输入框）") : self.doorInputViewBaseStyleModel.subTextModel.text;
        _doorInputViewBaseStyleModel.placeholderFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _doorInputViewBaseStyleModel.isShowDelBtn = YES;
        _doorInputViewBaseStyleModel.isShowSecurityBtn = NO;
        _doorInputViewBaseStyleModel.returnKeyType = UIReturnKeyDone;
        _doorInputViewBaseStyleModel.keyboardAppearance = UIKeyboardAppearanceAlert;
        _doorInputViewBaseStyleModel.leftViewMode = UITextFieldViewModeAlways;
        _doorInputViewBaseStyleModel.titleStrCor = _doorInputViewBaseStyleModel.placeholderColor = HEXCOLOR_ALPHA(0xB0B0B0,1.f);
//        _doorInputViewBaseStyleModel.fieldEditorOffset = JobsWidth(80);
    }return _doorInputViewBaseStyleModel;
}

@end
