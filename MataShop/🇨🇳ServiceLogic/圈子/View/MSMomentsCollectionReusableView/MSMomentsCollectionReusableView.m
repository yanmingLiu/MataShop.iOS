//
//  MSMomentsCollectionReusableView.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSMomentsCollectionReusableView.h"

@interface MSMomentsCollectionReusableView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *moreBtn;
/// Data

@end

@implementation MSMomentsCollectionReusableView
@synthesize viewModel = _viewModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self richElementsInViewWithModel:nil];
    }return self;
}
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.titleLab.alpha = 1;
    self.moreBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(CGSize)collectionReusableViewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(50));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.textColor = JobsCor(@"#333333");
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = UIFontWeightBoldSize(16);
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(15));
        }];
    }
    _titleLab.text = self.viewModel.textModel.text;
    [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    return _titleLab;
}

-(UIButton *)moreBtn{
    if(!_moreBtn){
        @jobs_weakify(self)
        _moreBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                                 titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:JobsIMG(@"向右的箭头（小）")
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:Internationalization(@"更多")
                                                       subTitle:nil
                                                      titleFont:UIFontWeightMediumSize(14)
                                                   subTitleFont:nil
                                                       titleCor:JobsCor(@"#666666")
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:UIColor.clearColor
                                                   imagePadding:JobsWidth(0)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeTrailing
                                     contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                       contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                  contentInsets:jobsSameDirectionalEdgeInsets(0)
                                              cornerRadiusValue:JobsWidth(0)
                                                roundingCorners:UIRectCornerAllCorners
                                           roundingCornersRadii:CGSizeZero
                                                 layerBorderCor:nil
                                                    borderWidth:JobsWidth(0)
                                                  primaryAction:nil
                                                clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastMsg:Internationalization(@"更多")];
            return nil;
        }];
        [self addSubview:_moreBtn];
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-8));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(50), JobsWidth(22)));
        }];
    }return _moreBtn;
}

@end
