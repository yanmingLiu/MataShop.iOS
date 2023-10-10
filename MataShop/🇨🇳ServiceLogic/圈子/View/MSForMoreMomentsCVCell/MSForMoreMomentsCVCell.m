//
//  MSForMoreMomentsCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSForMoreMomentsCVCell.h"

@interface MSForMoreMomentsCVCell ()
/// UI
@property(nonatomic,strong)UIButton *btn;

@end

@implementation MSForMoreMomentsCVCell
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSForMoreMomentsCVCell *cell = (MSForMoreMomentsCVCell *)[collectionView collectionViewCellClass:MSForMoreMomentsCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSForMoreMomentsCVCell.class];
        cell = (MSForMoreMomentsCVCell *)[collectionView collectionViewCellClass:MSForMoreMomentsCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell 圆切角
//    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
//    [cell.contentView layerBorderCor:RGBA_COLOR(255, 225, 144, 1) andBorderWidth:JobsWidth(0.5f)];
    
    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.btn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(80), JobsWidth(100));
}
#pragma mark —— lazyLoad
-(UIButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                             titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:nil
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:nil
                                                   subTitle:nil
                                                  titleFont:UIFontWeightBoldSize(14)
                                               subTitleFont:UIFontWeightMediumSize(11)
                                                   titleCor:JobsCor(@"#333333")
                                                subTitleCor:JobsCor(@"#AAAAAA")
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
                                        baseBackgroundColor:UIColor.whiteColor
                                               imagePadding:JobsWidth(8)
                                               titlePadding:JobsWidth(5)
                                             imagePlacement:NSDirectionalRectEdgeTop
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
            [self jobsToastMsg:Internationalization(@"AAA")];
            return nil;
        }];
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    _btn.jobsResetImage(self.viewModel.image);
    _btn.jobsResetTitle(self.viewModel.textModel.text);
    _btn.jobsResetSubtitle(self.viewModel.subTextModel.text);
    return _btn;
}

@end
