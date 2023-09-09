//
//  BaiShaETProjRuleDetailTBVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/7.
//

#import "BaiShaETProjRuleDetailTBVCell.h"

@interface BaiShaETProjRuleDetailTBVCell ()
/// UI
@property(nonatomic,strong)NSMutableArray <UILabel *>*labMutArr;

@end

@implementation BaiShaETProjRuleDetailTBVCell

@synthesize viewModel = _viewModel;

#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    BaiShaETProjRuleDetailTBVCell *cell = (BaiShaETProjRuleDetailTBVCell *)[tableView tableViewCellClass:BaiShaETProjRuleDetailTBVCell.class];
    if (!cell) {
        cell = [BaiShaETProjRuleDetailTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.offsetXForEach = JobsWidth(8);
        [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    [self masonry];
    if (self.indexPath.section == 0 && self.indexPath.row == 0) {
        self.labMutArr[0].text = Internationalization(@"等级");
        self.labMutArr[1].text = Internationalization(@"1號紅包");
        self.labMutArr[2].text = Internationalization(@"15號紅包");
    }else{
        self.labMutArr[0].text = [NSString stringWithFormat:@"VIP%ld",(long)self.indexPath.row - 1];
        self.labMutArr[1].text = model.textModel.text;
        self.labMutArr[2].text = model.subTextModel.text;
    }
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(46);
}
#pragma mark —— 子类重写父类方法
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
-(void)masonry{
    // 实现masonry水平固定间隔方法
    [self.labMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:0
                                     leadSpacing:0
                                     tailSpacing:0];
    // 设置array的垂直方向的约束
    [self.labMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self.contentView);
    }];
}
#pragma mark —— LazyLoad
-(NSMutableArray<UILabel *> *)labMutArr{
    if (!_labMutArr) {
        _labMutArr = NSMutableArray.array;
        
        for (int i = 0; i < 3; i++) {
            UILabel *label = UILabel.new;
            label.backgroundColor = HEXCOLOR(0xFFFCF7);//self.indexPath.row % 2 ? HEXCOLOR(0xFFFFFF): HEXCOLOR(0xFFFCF7);
            label.font = notoSansRegular(14);
            switch (i) {
                case 0:{
                    label.textColor = HEXCOLOR(0xAE8330);
                }break;
                case 2:
                case 1:{
                    label.textColor = HEXCOLOR(0x3D4A58);
                }break;
                default:
                    break;
            }
            
            [self.contentView addSubview:label];
            [_labMutArr addObject:label];
        }
        
    }return _labMutArr;
}

@end
