//
//  BaiShaETProjCreditRecordTBVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/24.
//

#import "BaiShaETProjCreditRecordTBVCell.h"

@interface BaiShaETProjCreditRecordTBVCell ()
/// UI
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)JobsUpDownLab *titleLab;
@property(nonatomic,strong)JobsUpDownLab *valueLab;
/// Data
@property(nonatomic,strong)JobsUpDownLabModel *titleModel;
@property(nonatomic,strong)JobsUpDownLabModel *valueModel;
@property(nonatomic,strong)BaiShaETProjCreditRecordTBVCellModel *dataModel;

@end

@implementation BaiShaETProjCreditRecordTBVCell

@synthesize viewModel = _viewModel;
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— UITableViewCellProtocol
/// UITableViewCell
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    BaiShaETProjCreditRecordTBVCell *cell = (BaiShaETProjCreditRecordTBVCell *)[tableView tableViewCellClass:BaiShaETProjCreditRecordTBVCell.class];
    if (!cell) {
        cell = [BaiShaETProjCreditRecordTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell setCellBgImage:JobsIMG(@"BaiShaETProjCreditRecordTBVCell")];
    }return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(BaiShaETProjCreditRecordTBVCellModel *_Nullable)model{
    /// 数据准备
    self.dataModel = model;
    self.imgV.image = self.dataModel.iconIMG;
    self.titleModel.upLabText = self.dataModel.title;
    self.titleModel.downLabText = self.dataModel.titleValue;

    self.valueModel.upLabText = [self.dataModel.isIncrease ? @"+" :@"-" stringByAppendingString:self.dataModel.subTitle];
    self.valueModel.downLabText = self.dataModel.subTitleValue;
    self.valueModel.upLabTextCor = self.dataModel.isIncrease ? HEXCOLOR(0x479F27) : HEXCOLOR(0xE12828);
    /// 装填数据
    [self.titleLab richElementsInViewWithModel:self.titleModel];
    [self.valueLab richElementsInViewWithModel:self.valueModel];
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(69);
}
/// 设置Cell的背景图片
-(void)setCellBgImage:(UIImage *)bgImage{
    
}
#pragma mark —— lazyLoad
-(UIImageView *)imgV{
    if (!_imgV) {
        _imgV = UIImageView.new;
        [self.contentView addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(40)));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(JobsWidth(16));
        }];
    }return _imgV;
}

-(JobsUpDownLab *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsUpDownLab.new;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.imgV.mas_right).offset(JobsWidth(16));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(40)));
        }];
    }return _titleLab;
}

-(JobsUpDownLab *)valueLab{
    if (!_valueLab) {
        _valueLab = JobsUpDownLab.new;
        [self.contentView addSubview:_valueLab];
        [_valueLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(JobsWidth(-16));
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(40)));
        }];
    }return _valueLab;
}

-(JobsUpDownLabModel *)titleModel{
    if (!_titleModel) {
        _titleModel = JobsUpDownLabModel.new;
//        _titleModel.upLabText = self.dataModel.title;
        _titleModel.upLabTextAlignment = NSTextAlignmentCenter;
        _titleModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
        _titleModel.upLabTextCor = HEXCOLOR(0x3D4A58);
        _titleModel.upLabBgCor = UIColor.clearColor;

//        _titleModel.downLabText = self.dataModel.titleValue;
        _titleModel.downLabTextAlignment = NSTextAlignmentCenter;
        _titleModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _titleModel.downLabTextCor = HEXCOLOR(0xB0B0B0);
        _titleModel.downLabBgCor = UIColor.clearColor;

        _titleModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _titleModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _titleModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _titleModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;

        _titleModel.space = JobsWidth(8);
    }return _titleModel;
}

-(JobsUpDownLabModel *)valueModel{
    if (!_valueModel) {
        _valueModel = JobsUpDownLabModel.new;
//        _valueModel.upLabText = self.dataModel.subTitle;
        _valueModel.upLabTextAlignment = NSTextAlignmentCenter;
        _valueModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(18) weight:UIFontWeightRegular];
//        _valueModel.upLabTextCor = HEXCOLOR(0x479F27);
        _valueModel.upLabBgCor = UIColor.clearColor;

//        _valueModel.downLabText = self.dataModel.subTitleValue;
        _valueModel.downLabTextAlignment = NSTextAlignmentCenter;
        _valueModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _valueModel.downLabTextCor = HEXCOLOR(0xB0B0B0);
        _valueModel.downLabBgCor = UIColor.clearColor;

        _valueModel.upLabVerticalAlign = JobsUpDownLabAlign_BottomRight;
        _valueModel.upLabLevelAlign = JobsUpDownLabAlign_BottomRight;
        _valueModel.downLabVerticalAlign = JobsUpDownLabAlign_BottomRight;
        _valueModel.downLabLevelAlign = JobsUpDownLabAlign_BottomRight;

        _valueModel.space = JobsWidth(8);
    }return _valueModel;
}

@end

@implementation BaiShaETProjCreditRecordTBVCellModel

@end

