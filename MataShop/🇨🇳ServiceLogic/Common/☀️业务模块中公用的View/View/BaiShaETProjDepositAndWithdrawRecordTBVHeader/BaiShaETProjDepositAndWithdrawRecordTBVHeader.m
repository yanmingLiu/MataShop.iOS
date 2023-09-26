//
//  BaiShaETProjDepositAndWithdrawRecordTBVHeader.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/29.
//

#import "BaiShaETProjDepositAndWithdrawRecordTBVHeader.h"

@interface BaiShaETProjDepositAndWithdrawRecordTBVHeader ()

@property(nonatomic,strong)UILabel *timeLab;

@end

@implementation BaiShaETProjDepositAndWithdrawRecordTBVHeader

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        NSLog(@"");
    }return self;
}
/// 在具体的子类实现，实现控制UITableViewHeaderFooterView是否悬停
//- (void)setFrame:(CGRect)frame {
//    [super setFrame:[self.tableView rectForHeaderInSection:self.section]];
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objectBlock) self.objectBlock(@1);
}
#pragma mark —— BaseViewProtocol
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.timeLab.text = model.textModel.text;
}
//具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewHeightWithModel:(id _Nullable)model{
    return JobsWidth(30);
}
#pragma mark —— lazyLoad
-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = UILabel.new;
        _timeLab.textColor = HEXCOLOR(0x757575);
        _timeLab.font = UIFontWeightRegularSize(14);
        [self.contentView addSubview:_timeLab];
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(JobsWidth(6), JobsWidth(12), JobsWidth(6), JobsWidth(12)));
        }];
    }return _timeLab;
}

@end
