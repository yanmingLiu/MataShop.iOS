//
//  MSMyInfoStyle2TBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/8/23.
//

#import "MSMyInfoStyle2TBVCell.h"

@interface MSMyInfoStyle2TBVCell ()
/// UI
@property(nonatomic,strong)ZYTextField *textField;

@end

@implementation MSMyInfoStyle2TBVCell
// @synthesize viewModel = _viewModel;
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    MSMyInfoStyle2TBVCell *cell = (MSMyInfoStyle2TBVCell *)[tableView tableViewCellClass:MSMyInfoStyle2TBVCell.class];
    if (!cell) {
        cell = [MSMyInfoStyle2TBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.offsetXForEach = JobsWidth(7);
        cell.offsetYForEach = JobsWidth(3);
        [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.textLabel.text = self.viewModel.textModel.text;
    self.textLabel.font = UIFontWeightBoldSize(16);
    self.textLabel.textColor = JobsCor(@"#333333");
    self.textField.text = self.viewModel.subTextModel.text;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(72);
}
#pragma mark —— 子类重写父类方法
/**
 1、-(void)setFrame:(CGRect)frame 此方法仅限于具体的 UITableViewCell子类使用
 2、如果在 BaseTableViewCell 实现此方法，那么一单相关子类集成 BaseTableViewCell 则会对-(void)setFrame:(CGRect)frame进行反复调用，因为[super setFrame:frame];
 3、禁止分类去调用，否则引起异常
 */
-(void)setFrame:(CGRect)frame{
    NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
    NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
    frame.origin.x += self.offsetXForEach;
    frame.origin.y += self.offsetYForEach;
    frame.size.height -= self.offsetYForEach * 2;
    frame.size.width -= self.offsetXForEach * 2;
    [super setFrame:frame];
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
        _textField.textColor = JobsBlackColor;
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.backgroundColor = JobsClearColor;
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.placeholder = self.viewModel.textModel.text;
        _textField.font = UIFontWeightMediumSize(16);
        _textField.placeholderFont = _textField.font;
        _textField.placeholderColor = JobsGrayColor;
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
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 2, JobsWidth(28)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-32));
        }];
    }return _textField;
}


@end
