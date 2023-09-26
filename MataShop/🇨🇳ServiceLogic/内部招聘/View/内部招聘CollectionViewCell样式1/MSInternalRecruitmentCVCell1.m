//
//  MSInternalRecruitmentCVCell1.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "MSInternalRecruitmentCVCell1.h"

@interface MSInternalRecruitmentCVCell1 ()
/// UI
@property(nonatomic,strong)UILabel *titileLab;
@property(nonatomic,strong)BaseButton *joinBtn;
@property(nonatomic,strong)UIImageView *backgroundImageView;
/// Data
@property(nonatomic,strong)MSInternalRecruitmentModel *model;

@end

@implementation MSInternalRecruitmentCVCell1

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:MSInternalRecruitmentCVCell1.class];
    MSInternalRecruitmentCVCell1 *cell = (MSInternalRecruitmentCVCell1 *)[collectionView collectionViewCellClass:MSInternalRecruitmentCVCell1.class forIndexPath:indexPath];
    if (!cell) {
        cell = (MSInternalRecruitmentCVCell1 *)[collectionView collectionViewCellClass:MSInternalRecruitmentCVCell1.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSInternalRecruitmentModel *_Nullable)model{
    self.model = model;
//    self.contentView.backgroundColor = JobsRedColor;
    self.backgroundView = self.backgroundImageView;
    self.titileLab.alpha = 1;
    self.joinBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(MSInternalRecruitmentModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(48));
}
#pragma mark —— lazyLoad
-(UILabel *)titileLab{
    if(!_titileLab){
        _titileLab = UILabel.new;
        _titileLab.font = UIFontWeightMediumSize(JobsWidth(18));
        _titileLab.textColor = RGB_SAMECOLOR(51);
        [self.contentView addSubview:_titileLab];
        [_titileLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(24));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(JobsWidth(24));
        }];
        [_titileLab makeLabelByShowingType:UILabelShowingType_03];
    }
    _titileLab.text = self.model.titleName;
    return _titileLab;
}

-(BaseButton *)joinBtn{
    if (!_joinBtn) {
        _joinBtn = BaseButton.new;
        _joinBtn.normalTitle = Internationalization(@"我要加入");
        _joinBtn.normalTitleColor = RGB_SAMECOLOR(255);
        _joinBtn.titleFont = UIFontWeightBoldSize(14);
        _joinBtn.backgroundColor = RGBA_COLOR(255, 89, 12, 1);
        [self.contentView addSubview:_joinBtn];
        [_joinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(JobsWidth(-6));
        }];
        [_joinBtn cornerCutToCircleWithCornerRadius:JobsWidth(14)];
        @jobs_weakify(self)
        [_joinBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [WHToast toastErrMsg:Internationalization(@"我要加入")];
        }];
    }return _joinBtn;
}

-(UIImageView *)backgroundImageView{
    if(!_backgroundImageView){
        _backgroundImageView = UIImageView.new;
        _backgroundImageView.size = self.contentView.size;
        _backgroundImageView.image = JobsIMG(@"内部招聘Cell背景图");
    }return _backgroundImageView;
}

@end
