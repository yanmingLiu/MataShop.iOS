//
//  MSMyInfoStyle3TBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/8/23.
//

#import "MSMyInfoStyle3TBVCell.h"


@interface MSMyInfoStyle3TBVCell ()
/// UI
@property(nonatomic,strong)UITextView *textView;

@end

@implementation MSMyInfoStyle3TBVCell
// @synthesize viewModel = _viewModel;
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    MSMyInfoStyle3TBVCell *cell = (MSMyInfoStyle3TBVCell *)[tableView tableViewCellClass:MSMyInfoStyle3TBVCell.class];
    if (!cell) {
        cell = [MSMyInfoStyle3TBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.offsetXForEach = JobsWidth(7);
        cell.offsetYForEach = JobsWidth(3);
        [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return cell;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.resetByOffsetOriginY(JobsWidth(-65));
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.textLabel.text = self.viewModel.textModel.text;
    self.textLabel.font = UIFontWeightBoldSize(16);
    self.textLabel.textColor = JobsCor(@"#333333");
    self.textView.text = self.viewModel.subTextModel.text;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(56 + 98 + 18);
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

#pragma mark —— lazyLoad
-(UITextView *)textView{
    if (!_textView) {
        _textView = UITextView.new;
        _textView.placeholder;
        _textView.text = Internationalization(@"");
        _textView.font = UIFontWeightRegularSize(12);
        _textView.backgroundColor = JobsCor(@"#F7F7F7");
        _textView.textColor = RGBA_COLOR(51, 51, 51, 1);
        [self.contentView addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(335), JobsWidth(120)));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(JobsWidth(-20));
        }];
        [_textView cornerCutToCircleWithCornerRadius:8];
        [_textView layerBorderCor:RGBA_COLOR(255, 255, 144, 1) andBorderWidth:0.5f];
    }return _textView;
}

@end
