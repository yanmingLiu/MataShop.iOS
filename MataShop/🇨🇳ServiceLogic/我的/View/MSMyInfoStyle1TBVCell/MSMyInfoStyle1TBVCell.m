//
//  MSMyInfoStyle1TBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/8/23.
//

#import "MSMyInfoStyle1TBVCell.h"

@interface MSMyInfoStyle1TBVCell ()
/// UI
@property(nonatomic,strong)UIImageView *userHeaderImageView;

@end

@implementation MSMyInfoStyle1TBVCell
// @synthesize viewModel = _viewModel;
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    MSMyInfoStyle1TBVCell *cell = (MSMyInfoStyle1TBVCell *)[tableView tableViewCellClass:MSMyInfoStyle1TBVCell.class];
    if (!cell) {
        cell = [MSMyInfoStyle1TBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
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
    self.userHeaderImageView.alpha = 1;
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
#pragma mark —— lazyLoad
-(UIImageView *)userHeaderImageView{
    if(!_userHeaderImageView){
        _userHeaderImageView = UIImageView.new;
        [self.contentView addSubview:_userHeaderImageView];
        [_userHeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(42), JobsWidth(42)));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(JobsWidth(-10));
        }];
    }
    _userHeaderImageView.image = self.viewModel.image;
    return _userHeaderImageView;
}

@end
