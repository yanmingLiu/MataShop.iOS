//
//  CasinoBankCardCVCell.m
//  Casino
//
//  Created by Jobs on 2021/12/18.
//

#import "CasinoNoAddBankCardCVCell.h"

@interface CasinoNoAddBankCardCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *bgIMGV;
@property(nonatomic,strong)UIButton *addBtn;
/// Data

@end

@implementation CasinoNoAddBankCardCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self richElementsInCellWithModel:nil];
        [self cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    CasinoNoAddBankCardCVCell *cell = (CasinoNoAddBankCardCVCell *)[collectionView collectionViewCellClass:CasinoNoAddBankCardCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:CasinoNoAddBankCardCVCell.class];
        cell = (CasinoNoAddBankCardCVCell *)[collectionView collectionViewCellClass:CasinoNoAddBankCardCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(15 * 2), JobsWidth(128));
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if (model) {        
        self.viewModel = model;
    //    self.iconIMGV.image = model.image;
    //    self.titleLab.text = model.text;
        self.backgroundView = self.bgIMGV;
        self.addBtn.alpha = 1;
    }
}
#pragma mark —— lazyLoad
-(UIImageView *)bgIMGV{
    if (!_bgIMGV) {
        _bgIMGV = UIImageView.new;
        _bgIMGV.image = JobsIMG(@"还未添加银行卡");
        _bgIMGV.frame = self.bounds;
    }return _bgIMGV;
}

-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = UIButton.new;
        _addBtn.userInteractionEnabled = NO;
        [_addBtn normalTitle:Internationalization(@"Add a bank card")];
        [_addBtn normalTitleColor:HEXCOLOR(0x502600)];
        [_addBtn normalImage:JobsIMG(@"银行卡添加")];
        [_addBtn titleFont:[UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular]];
        [self.contentView addSubview:_addBtn];
        [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 2, JobsWidth(32 + 14 + 9)));
            make.center.equalTo(self.contentView);
        }];
        [self layoutIfNeeded];
        [_addBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop
                                 imageTitleSpace:JobsWidth(15)];
    }return _addBtn;
}

@end
