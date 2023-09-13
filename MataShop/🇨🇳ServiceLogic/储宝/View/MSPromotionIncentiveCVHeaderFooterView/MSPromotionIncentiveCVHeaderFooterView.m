//
//  MSPromotionIncentiveCVHeaderFooterView.m
//  MataShop
//
//  Created by Jobs Hi on 9/13/23.
//

#import "MSPromotionIncentiveCVHeaderFooterView.h"

@interface MSPromotionIncentiveCVHeaderFooterView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
/// Data
@property(nonatomic,strong)MSPromotionIncentiveModel *promotionIncentiveModel;

@end

@implementation MSPromotionIncentiveCVHeaderFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(MSPromotionIncentiveModel *_Nullable)model{
    self.promotionIncentiveModel = model;
    self.backgroundColor = RGBA_COLOR(210, 213, 224, 0.2f);
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)collectionReusableViewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(52));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = self.promotionIncentiveModel.myIncentiveTypeNameStr;
        _titleLab.textColor = RGBA_COLOR(51, 51, 51, 1);
        _titleLab.font = UIFontWeightBoldSize(16);
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(18));
            make.left.equalTo(self).offset(JobsWidth(16));
            make.centerY.equalTo(self);
        }];
    }
    [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    return _titleLab;
}

@end
