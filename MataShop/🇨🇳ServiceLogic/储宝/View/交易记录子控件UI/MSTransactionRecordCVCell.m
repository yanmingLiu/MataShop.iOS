//
//  MSTransactionRecordCVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSTransactionRecordCVCell.h"

@interface MSTransactionRecordCVCell ()
/// UI
@property(nonatomic,strong)BaseButton *leftBtn;
@property(nonatomic,strong)BaseButton *rightBtn;
/// Data
@property(nonatomic,strong)MSTransactionRecordModel *transactionRecordModel;

@end

@implementation MSTransactionRecordCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:MSTransactionRecordCVCell.class];
    MSTransactionRecordCVCell *cell = (MSTransactionRecordCVCell *)[collectionView collectionViewCellClass:MSTransactionRecordCVCell.class forIndexPath:indexPath];
    if (!cell) {
        cell = (MSTransactionRecordCVCell *)[collectionView collectionViewCellClass:MSTransactionRecordCVCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSTransactionRecordModel *_Nullable)model{
    self.contentView.backgroundColor = JobsWhiteColor;
    self.transactionRecordModel = model;
    self.leftBtn.jobsResetTitle(self.transactionRecordModel.title);
    self.leftBtn.jobsResetSubtitle(self.transactionRecordModel.orderID);
    self.rightBtn.jobsResetTitle(self.transactionRecordModel.orderState);
    self.rightBtn.jobsResetSubtitle(self.transactionRecordModel.time);
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(16 * 2), JobsWidth(53));
}
#pragma mark —— lazyLoad
-(BaseButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                                 titleAlignment:UIButtonConfigurationTitleAlignmentLeading
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:nil
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:nil
                                                       subTitle:nil
                                                      titleFont:UIFontWeightSemiboldSize(12)
                                                   subTitleFont:UIFontWeightRegularSize(12)
                                                       titleCor:JobsCor(@"#333333")
                                                    subTitleCor:JobsCor(@"#999999")
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:UIColor.whiteColor
                                                   imagePadding:JobsWidth(0)
                                                   titlePadding:JobsWidth(8)
                                                 imagePlacement:NSDirectionalRectEdgeNone
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
            [WHToast toastMsg:Internationalization(@"提现")];
            return nil;
        }];
        [self.contentView addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(0));
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake([MSTransactionRecordCVCell cellSizeWithModel:nil].width / 2, [MSTransactionRecordCVCell cellSizeWithModel:nil].height));
        }];
    }return _leftBtn;
}

-(BaseButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                                  titleAlignment:UIButtonConfigurationTitleAlignmentTrailing
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:nil
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:nil
                                                        subTitle:nil
                                                       titleFont:UIFontWeightSemiboldSize(12)
                                                    subTitleFont:UIFontWeightRegularSize(12)
                                                        titleCor:JobsCor(@"#EA2918")
                                                     subTitleCor:JobsCor(@"#999999")
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:UIColor.whiteColor
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(8)
                                                  imagePlacement:NSDirectionalRectEdgeNone
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
            return nil;
        }];
        [self.contentView addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(0));
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake([MSTransactionRecordCVCell cellSizeWithModel:nil].width / 2, [MSTransactionRecordCVCell cellSizeWithModel:nil].height));
        }];
    }return _rightBtn;
}


@end
