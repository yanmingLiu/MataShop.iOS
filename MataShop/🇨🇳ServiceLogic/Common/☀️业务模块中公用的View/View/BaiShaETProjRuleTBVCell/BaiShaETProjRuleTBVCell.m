//
//  BaiShaETProjRuleTBVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/8.
//

#import "BaiShaETProjRuleTBVCell.h"

@interface BaiShaETProjRuleTBVCell ()
/// UI
@property(nonatomic,strong)UILabel *contentLab;
/// Data

@end

@implementation BaiShaETProjRuleTBVCell

@synthesize viewModel = _viewModel;

#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    BaiShaETProjRuleTBVCell *cell = (BaiShaETProjRuleTBVCell *)[tableView tableViewCellClass:BaiShaETProjRuleTBVCell.class];
    if (!cell) {
        cell = [BaiShaETProjRuleTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.contentLab.alpha = 1;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    UIViewModel *vm = UIViewModel.new;
    vm.textModel.font = notoSansRegular(14);
    vm.jobsWidth = JobsWidth(311);
    vm.textModel.text = model.subTextModel.text;
    vm.textModel.textLineSpacing = JobsWidth(18);
    
    return [UIView heightByData:vm] + JobsWidth(10);
}
#pragma mark —— LazyLoad
-(UILabel *)contentLab{
    if (_contentLab) {
        _contentLab.text = self.viewModel.subTextModel.text;
        NSLog(@"%@",_contentLab.text);
    }else{
        _contentLab = UILabel.new;
        _contentLab.text = self.viewModel.subTextModel.text;
        _contentLab.textColor = HEXCOLOR(0x757575);
        _contentLab.font = notoSansRegular(14);
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(JobsWidth(11),
                                                                         JobsWidth(18),
                                                                         JobsWidth(11),
                                                                         JobsWidth(18)));
        }];
        [_contentLab makeLabelByShowingType:UILabelShowingType_05];
    }return _contentLab;
}

@end
