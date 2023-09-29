//
//  JobsAppDoorInputViewBaseStyle_8.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle_8.h"

@interface JobsAppDoorInputViewBaseStyle_8 ()
//UI
@property(nonatomic,strong)UIButton *securityModeBtn;
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UILabel *titleLab;
//Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_8

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
        [self layerBorderCor:Cor4 andBorderWidth:1];
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    if (![NSString isNullString:self.doorInputViewBaseStyleModel.inputStr]) {
        _textField.text = self.doorInputViewBaseStyleModel.inputStr;
    }
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.background = self.doorInputViewBaseStyleModel.background;
    _textField.backgroundColor = self.doorInputViewBaseStyleModel.backgroundColor;
    _textField.disabledBackground = self.doorInputViewBaseStyleModel.disabledBackground;
    _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.background = self.doorInputViewBaseStyleModel.background;
    _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
    _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : PlaceHolderAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.objBindingParams = self.textFieldInputModel;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)textFieldBlock:(JobsMagicTextField *)textField
       textFieldValue:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;

    textField.objBindingParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(345), JobsWidth(50));
}

-(void)richElementsInViewWithModel:(JobsAppDoorInputViewBaseStyleModel *_Nullable)doorInputViewBaseStyleModel{
    self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
    
    self.titleLab.alpha = 1;
    self.securityModeBtn.alpha = 1;
    self.textField.alpha = 1;
    [self configTextField];
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)getTextFieldValue{
    return _textField.text;
}

-(UIButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— lazyLoad
-(UIButton *)securityModeBtn{
    if (!_securityModeBtn) {
        _securityModeBtn = UIButton.new;
        
        [_securityModeBtn selectedImage:self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : [UIImage imageWithColor:JobsRedColor]];
        [_securityModeBtn normalImage:self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : [UIImage imageWithColor:JobsBlueColor]];
        @jobs_weakify(self)
        [_securityModeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.textField.secureTextEntry = x.selected;
            if (x.selected && !self.textField.isEditing) {
                self.textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
            }
            return nil;
        }];

        [self addSubview:_securityModeBtn];
        [_securityModeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(self);
            make.width.mas_equalTo(40);
            make.bottom.equalTo(self.titleLab.mas_top);
        }];
    }return _securityModeBtn;
}

-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [[_textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//            @jobs_strongify(self)
            return YES;
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            NSLog(@"输入的字符为 = %@",x);
            self.securityModeBtn.jobsVisible = ![NSString isNullString:x] && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
            if ([x isContainsSpecialSymbolsString:nil]) {
                [WHToast toastMsg:Internationalization(@"Do not enter special characters")];
            }else{
                NSLog(@"输入的字符为 = %@",x);
                [self textFieldBlock:self.textField
                      textFieldValue:x];
            }
        }];
        
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(JobsWidth(30));
            make.right.equalTo(self);
        }];
    }return _textField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.font = [UIFont systemFontOfSize:JobsWidth(11) weight:UIControlStateNormal];
        _titleLab.text = self.doorInputViewBaseStyleModel.textModel.text;
        _titleLab.textColor = self.doorInputViewBaseStyleModel.textModel.textCor;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self);
            make.top.equalTo(self.textField.mas_bottom);
        }];
    }return _titleLab;
}

@end
