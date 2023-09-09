//
//  BaiShaETProjMyWalletCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "BaiShaETProjMyWalletCVCell.h"

@interface BaiShaETProjMyWalletCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *titleIMGV;
@property(nonatomic,strong)JobsUpDownLab *titleLab;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UIButton *转入;
@property(nonatomic,strong)UIButton *转出;
@property(nonatomic,strong)UIImageView *tipsIMGV;
/// Data

@end

@implementation BaiShaETProjMyWalletCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:BaiShaETProjMyWalletCVCell.class];
    BaiShaETProjMyWalletCVCell *cell = (BaiShaETProjMyWalletCVCell *)[collectionView collectionViewCellClass:BaiShaETProjMyWalletCVCell.class forIndexPath:indexPath];
    if (!cell) {
        cell = (BaiShaETProjMyWalletCVCell *)[collectionView collectionViewCellClass:BaiShaETProjMyWalletCVCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    
    [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    [cell layerBorderColour:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    
    self.titleIMGV.alpha = 1;
    self.titleLab.alpha = 1;
    self.lineLab.alpha = 1;
    self.转入.alpha = 1;
    self.转出.alpha = 1;
    self.tipsIMGV.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(164), JobsWidth(100));
}
#pragma mark —— lazyLoad
-(UIImageView *)titleIMGV{
    if (!_titleIMGV) {
        _titleIMGV = UIImageView.new;
        _titleIMGV.image = self.viewModel.image ? : JobsIMG(@"我的钱包占位图");
        [self addSubview:_titleIMGV];
        [_titleIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(40)));
            make.top.equalTo(self).offset(JobsWidth(14));
            make.left.equalTo(self).offset(JobsWidth(12));
        }];
    }return _titleIMGV;
}

-(JobsUpDownLab *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsUpDownLab.new;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake([BaiShaETProjMyWalletCVCell cellSizeWithModel:nil].width - JobsWidth(40) - JobsWidth(12 + 6),
                                             JobsWidth(40)));
            make.centerY.equalTo(self);
            make.left.equalTo(self.titleIMGV.mas_right).offset(JobsWidth(6));
        }];
        
        {
            JobsUpDownLabModel *upDownLabModel = JobsUpDownLabModel.new;
            upDownLabModel.upLabText = self.viewModel.textModel.text;
            upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(12)
                                                weight:UIFontWeightBold];
            upDownLabModel.upLabTextCor = HEXCOLOR(0x757575);
            upDownLabModel.upLabBgCor = UIColor.clearColor;
            ///
            upDownLabModel.downLabText = self.viewModel.subTextModel.text;
            upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(14)
                                                  weight:UIFontWeightRegular];
            upDownLabModel.downLabTextCor = HEXCOLOR(0x3D4A58);
            upDownLabModel.downLabBgCor = UIColor.clearColor;
            
            upDownLabModel.space = JobsWidth(8);
            
            upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
            upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
            upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            
            [_titleLab richElementsInViewWithModel:upDownLabModel];
        }
        
    }return _titleLab;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = UILabel.new;
        _lineLab.backgroundColor = HEXCOLOR(0xEEE2C8);
        [self.contentView addSubview:_lineLab];
        [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(1), JobsWidth(14)));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-12));
        }];
    }return _lineLab;
}

-(UIButton *)转入{
    if (!_转入) {
        _转入 = UIButton.new;
        _转入.normalTitle = Internationalization(@"转入");
        _转入.normalTitleColor = HEXCOLOR(0x757575);
        _转入.titleFont = UIFontWeightRegularSize(12);
        [self addSubview:_转入];
        [_转入 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.lineLab.mas_left).offset(JobsWidth(-28));
            make.centerY.equalTo(self.lineLab);
            make.height.mas_equalTo(JobsWidth(12));
        }];
        [_转入 makeBtnLabelByShowingType:UILabelShowingType_03];
        [_转入 btnClickEventBlock:^(UIButton *x) {
            toast(x.titleForNormalState);
        }];
    }return _转入;
}

-(UIButton *)转出{
    if (!_转出) {
        _转出 = UIButton.new;
        _转出.normalTitle = self.viewModel.isMark ? Internationalization(@"不可转出") : Internationalization(@"转出");
        _转出.normalTitleColor = self.viewModel.isMark ? HEXCOLOR(0xC4C4C4) : HEXCOLOR(0x757575);
        _转出.titleFont = UIFontWeightRegularSize(12);
        _转出.enabled = !self.viewModel.isMark;
        [self addSubview:_转出];
        [_转出 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.lineLab.mas_right).offset(JobsWidth(28));
            make.right.equalTo(self.contentView).offset(-28);
            make.centerY.equalTo(self.lineLab);
            make.height.mas_equalTo(JobsWidth(12));
        }];
        [_转出 makeBtnLabelByShowingType:UILabelShowingType_03];
        [_转出 btnClickEventBlock:^(UIButton *x) {
            toast(x.titleForNormalState);
        }];
    }return _转出;
}

-(UIImageView *)tipsIMGV{
    if (!_tipsIMGV) {
        _tipsIMGV = UIImageView.new;
        _tipsIMGV.image = JobsIMG(@"感叹号");
        _tipsIMGV.hidden = !self.viewModel.isMark;
        [self.contentView addSubview:_tipsIMGV];
        [_tipsIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(14), JobsWidth(14)));
            make.top.equalTo(self.contentView).offset(JobsWidth(5));
            make.right.equalTo(self.contentView).offset(JobsWidth(-5));
        }];
    }return _tipsIMGV;
}

@end
