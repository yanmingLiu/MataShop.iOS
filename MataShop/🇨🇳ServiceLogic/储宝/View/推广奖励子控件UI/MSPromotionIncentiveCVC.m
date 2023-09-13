//
//  MSPromotionIncentiveCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSPromotionIncentiveCVC.h"

@interface MSPromotionIncentiveCVC ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;/// 名目
@property(nonatomic,strong)UILabel *myIncentiveDetailNameLab;/// 激励名
@property(nonatomic,strong)UILabel *userNameLab;/// 下级用户名
@property(nonatomic,strong)UILabel *timeLab;/// 时间
/// Data
@property(nonatomic,strong)MSPromotionIncentiveDetailModel *promotionIncentiveDetailModel;

@end

@implementation MSPromotionIncentiveCVC
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSPromotionIncentiveCVC *cell = (MSPromotionIncentiveCVC *)[collectionView collectionViewCellClass:MSPromotionIncentiveCVC.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSPromotionIncentiveCVC.class];
        cell = (MSPromotionIncentiveCVC *)[collectionView collectionViewCellClass:MSPromotionIncentiveCVC.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSPromotionIncentiveDetailModel *_Nullable)model{
    self.contentView.backgroundColor = RGBA_COLOR(210, 213, 224, 0.2f);
    self.promotionIncentiveDetailModel = model;
    if(model.indexPath.row){
        self.myIncentiveDetailNameLab.alpha = 1;
        self.userNameLab.alpha = 1;
        self.timeLab.alpha = 1;
    }else{
        self.titleLab.alpha = 1;
    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(64));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.textColor = RGBA_COLOR(51, 51, 51, 1);
        _titleLab.font = UIFontWeightBoldSize(JobsWidth(16));
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.centerY.equalTo(self.contentView);
        }];
    }
    _titleLab.text = self.promotionIncentiveDetailModel.myIncentiveTypeNameStr;
    [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    return _titleLab;
}


-(UILabel *)myIncentiveDetailNameLab{
    if(!_myIncentiveDetailNameLab){
        _myIncentiveDetailNameLab = UILabel.new;
        _myIncentiveDetailNameLab.textColor = RGBA_COLOR(136, 79, 2, 1);
        _myIncentiveDetailNameLab.font = UIFontWeightRegularSize(JobsWidth(12));
        [self.contentView addSubview:_myIncentiveDetailNameLab];
        [_myIncentiveDetailNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.top.equalTo(self.contentView).offset(JobsWidth(12));
            make.height.mas_equalTo(JobsWidth(16));
        }];
        [_myIncentiveDetailNameLab makeLabelByShowingType:UILabelShowingType_03];
    }
    _myIncentiveDetailNameLab.text = self.promotionIncentiveDetailModel.myIncentiveDetailNameStr;
    return _myIncentiveDetailNameLab;
}

-(UILabel *)userNameLab{
    if(!_userNameLab){
        _userNameLab = UILabel.new;
        _userNameLab.textColor = RGBA_COLOR(153, 153, 153, 1);
        _userNameLab.font = UIFontWeightRegularSize(JobsWidth(12));
        [self.contentView addSubview:_userNameLab];
        [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.top.equalTo(self.myIncentiveDetailNameLab.mas_bottom).offset(JobsWidth(8));
            make.height.mas_equalTo(JobsWidth(16));
        }];
    }
    _userNameLab.text = self.promotionIncentiveDetailModel.userNameStr;
    return _userNameLab;
}

-(UILabel *)timeLab{
    if(!_timeLab){
        _timeLab = UILabel.new;
        _timeLab.textColor = RGBA_COLOR(153, 153, 153, 1);
        _timeLab.font = UIFontWeightRegularSize(JobsWidth(12));
        [self.contentView addSubview:_timeLab];
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.centerY.equalTo(self.userNameLab);
            make.height.mas_equalTo(JobsWidth(16));
        }];
    }
    _timeLab.text = self.promotionIncentiveDetailModel.timeStr;
    return _timeLab;
}

@end
