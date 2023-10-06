//
//  MSPromotionIncentiveCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSPromotionIncentiveCVCell.h"

@interface MSPromotionIncentiveCVCell ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;/// 名目
@property(nonatomic,strong)UILabel *myIncentiveDetailNameLab;/// 激励名
@property(nonatomic,strong)UILabel *userNameLab;/// 下级用户名
@property(nonatomic,strong)UILabel *timeLab;/// 时间
/// Data
@property(nonatomic,strong)MSPromotionIncentiveDetailModel *promotionIncentiveDetailModel;

@end

@implementation MSPromotionIncentiveCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self cutFirstAndLastCollectionViewCellWithBackgroundCor:JobsWhiteColor
                                              cellOutLineCor:JobsClearColor
                                               bottomLineCor:JobsWhiteColor
                                                 borderWidth:JobsWidth(0.1)
                                            cornerRadiusSize:CGSizeMake(JobsWidth(8), JobsWidth(8))
                                                          dx:0
                                                          dy:0];
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSPromotionIncentiveCVCell *cell = (MSPromotionIncentiveCVCell *)[collectionView collectionViewCellClass:MSPromotionIncentiveCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSPromotionIncentiveCVCell.class];
        cell = (MSPromotionIncentiveCVCell *)[collectionView collectionViewCellClass:MSPromotionIncentiveCVCell.class forIndexPath:indexPath];
    }
//    cell.contentView.backgroundColor = cell.backgroundColor = JobsClearColor;//JobsWhiteColor;
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSPromotionIncentiveDetailModel *_Nullable)model{
    
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
        _titleLab.textColor = JobsCor(@"#333333");
        _titleLab.font = UIFontWeightSemiboldSize(16);
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
        _myIncentiveDetailNameLab.textColor = JobsCor(@"#EA2918");
        _myIncentiveDetailNameLab.font = UIFontWeightSemiboldSize(12);
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
        _userNameLab.textColor = JobsCor(@"#999999");
        _userNameLab.font = UIFontWeightRegularSize(12);
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
        _timeLab.textColor = JobsCor(@"#999999");
        _timeLab.font = UIFontWeightRegularSize(12);
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
