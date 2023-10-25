//
//  MSTopupRecordCell.m
//  MataShop
//
//  Created by Mac on 2023/10/24.
//

#import "MSTopupRecordCell.h"
#import "MSTopupRecordModel.h"
@interface MSTopupRecordCell ()
/// UI
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *moneyLabel;
@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)UILabel *orderStateLabel;
@property(nonatomic,strong)UILabel *orderIDLabel;
@property(nonatomic,strong)UILabel *timeLabel;
/// Data
@property(nonatomic,strong)MSTopupRecordModel *model;

@end

@implementation MSTopupRecordCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:MSTransactionRecordCVCell.class];
    MSTopupRecordCell *cell = (MSTopupRecordCell *)[collectionView collectionViewCellClass:MSTopupRecordCell.class forIndexPath:indexPath];
    if (!cell) {
        cell = (MSTopupRecordCell *)[collectionView collectionViewCellClass:MSTopupRecordCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSTopupRecordModel *_Nullable)model{
    self.contentView.backgroundColor = JobsWhiteColor;
    self.model = model;
    self.titleLabel.text = self.model.title;
    self.moneyLabel.text = [NSString stringWithFormat:@"+￥%.2f",self.model.money];
    self.typeLabel.text = [NSString stringWithFormat:@"提现方式：%@",self.model.type];
    self.orderStateLabel.text = self.model.orderState;
    self.orderIDLabel.text = [NSString stringWithFormat:@"单号：%@",self.model.orderID];
    self.timeLabel.text = self.model.time;
    UIView *line = [UIView new];
    line.backgroundColor = JobsCor(@"#f7f7f7");
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(0.5);
        make.bottom.mas_equalTo(-0.5);
    }];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(16 * 2), JobsWidth(105));
}
#pragma mark —— lazyLoad
- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.textColor = JobsCor(@"#333333");
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(20);
        }];
    }
    return _titleLabel;
}
- (UILabel *)moneyLabel{
    if (!_moneyLabel){
        _moneyLabel = [UILabel new];
        _moneyLabel.textColor = JobsCor(@"#dd0000");
        _moneyLabel.font = [UIFont systemFontOfSize:16];
        _moneyLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_moneyLabel];
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(20);
        }];
    }
    return _moneyLabel;
}
- (UILabel *)typeLabel{
    if (!_typeLabel){
        _typeLabel = [UILabel new];
        _typeLabel.textColor = JobsCor(@"#333333");
        _typeLabel.font = [UIFont systemFontOfSize:14];
        _typeLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_typeLabel];
        [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        }];
    }
    return _typeLabel;
}
- (UILabel *)orderStateLabel{
    if (!_orderStateLabel){
        _orderStateLabel = [UILabel new];
        _orderStateLabel.textColor = JobsCor(@"#dd0000");
        _orderStateLabel.font = [UIFont systemFontOfSize:14];
        _orderStateLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_orderStateLabel];
        [_orderStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.moneyLabel.mas_bottom).offset(15);
        }];
    }
    return _orderStateLabel;
}
- (UILabel *)orderIDLabel{
    if (!_orderIDLabel){
        _orderIDLabel = [UILabel new];
        _orderIDLabel.textColor = JobsCor(@"#aaaaaa");
        _orderIDLabel.font = [UIFont systemFontOfSize:12];
        _orderIDLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_orderIDLabel];
        [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(self.typeLabel.mas_bottom).offset(15);
            make.bottom.mas_equalTo(-5);
        }];
    }
    return _orderIDLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel){
        _timeLabel = [UILabel new];
        _timeLabel.textColor = JobsCor(@"#aaaaaa");
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.orderStateLabel.mas_bottom).offset(15);
            make.bottom.mas_equalTo(-5);
        }];
    }
    return _timeLabel;
}

@end
