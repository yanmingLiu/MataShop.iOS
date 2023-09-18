//
//  MSMSRedEnvelopeDetailTBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 9/18/23.
//

#import "MSMSRedEnvelopeDetailTBVCell.h"

@interface MSMSRedEnvelopeDetailTBVCell ()
/// UI
@property(nonatomic,strong)JobsUpDownLab *titleLab;
@property(nonatomic,strong)JobsUpDownLab *valueLab;
/// Data
@property(nonatomic,strong)MSRedEnvelopeDetailModel *model;
@property(nonatomic,strong)JobsUpDownLabModel *titleModel;
@property(nonatomic,strong)JobsUpDownLabModel *valueModel;

@end

@implementation MSMSRedEnvelopeDetailTBVCell
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    MSMSRedEnvelopeDetailTBVCell *cell = (MSMSRedEnvelopeDetailTBVCell *)[tableView tableViewCellClass:MSMSRedEnvelopeDetailTBVCell.class];
    if (!cell) {
        cell = [MSMSRedEnvelopeDetailTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSRedEnvelopeDetailModel *_Nullable)model{
    self.model = model;
    self.titleLab.alpha = 1;
    self.valueLab.alpha = 1;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(MSRedEnvelopeDetailModel *_Nullable)model{
    return JobsHeight(60);
}
#pragma mark —— lazyLoad
-(JobsUpDownLab *)titleLab{
    if(!_titleLab){
        _titleLab = JobsUpDownLab.new;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.top.equalTo(self.contentView).offset(JobsWidth(20));
        }];
        [_titleLab richElementsInViewWithModel:self.titleModel];
        [self layoutIfNeeded];
    }return _titleLab;
}

-(JobsUpDownLab *)valueLab{
    if(!_valueLab){
        _valueLab = JobsUpDownLab.new;
        [self.contentView addSubview:_valueLab];
        [_valueLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(-130));
            make.top.equalTo(self.contentView).offset(JobsWidth(20));
        }];
        [_valueLab richElementsInViewWithModel:self.valueModel];
        [self layoutIfNeeded];
    }return _valueLab;
}

-(JobsUpDownLabModel *)titleModel{
    if (!_titleModel) {
        _titleModel = JobsUpDownLabModel.new;
    }
    
    _titleModel.upLabText = Internationalization(@"账变金额：") ;
    _titleModel.upLabTextAlignment = NSTextAlignmentCenter;
    _titleModel.upLabFont = JobsFontBold(12);
    _titleModel.upLabTextCor = RGBA_COLOR(102, 102, 102, 1);
    _titleModel.upLabBgCor = JobsClearColor;
    
    _titleModel.downLabText = Internationalization(@"账变时间：");
    _titleModel.downLabTextAlignment = NSTextAlignmentCenter;
    _titleModel.downLabFont = JobsFontRegular(12);
    _titleModel.downLabTextCor = RGBA_SAMECOLOR(153, 1);
    _titleModel.downLabBgCor = JobsClearColor;

    _titleModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _titleModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _titleModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _titleModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _titleModel.space = JobsWidth(3);
    
    return _titleModel;
}

-(JobsUpDownLabModel *)valueModel{
    if (!_valueModel) {
        _valueModel = JobsUpDownLabModel.new;
    }

    _valueModel.upLabText = self.model.amountValue;
    _valueModel.upLabTextAlignment = NSTextAlignmentCenter;
    _valueModel.upLabFont = JobsFontBold(12);
    _valueModel.upLabTextCor = RGBA_COLOR(136, 79, 2, 1);
    _valueModel.upLabBgCor = JobsClearColor;
    
    _valueModel.downLabText = self.model.timeValue;
    _valueModel.downLabTextAlignment = NSTextAlignmentCenter;
    _valueModel.downLabFont = JobsFontRegular(12);
    _valueModel.downLabTextCor = RGBA_SAMECOLOR(153, 1);
    _valueModel.downLabBgCor = JobsClearColor;

    _valueModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _valueModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    _valueModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
    _valueModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
    
    _valueModel.space = JobsWidth(3);
    
    return _valueModel;
}

@end
