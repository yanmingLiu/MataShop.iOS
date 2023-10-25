//
//  MSWalletHeadView.m
//  MataShop
//
//  Created by Mac on 2023/10/21.
//

#import "MSWalletHeadView.h"

@interface MSWalletHeadView ()
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation MSWalletHeadView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo (0);
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.centerY.mas_equalTo(self.titleLabel.centerY);
            make.right.mas_equalTo(-15);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(25+JobsNavigationHeight(nil));
            make.centerY.mas_equalTo(self.rightBtn.centerY);
            make.centerX.mas_equalTo(self);
        }];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.mas_equalTo(self.titleLabel.centerY);
            make.left.mas_equalTo(10);
        }];
    }
    return self;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = Internationalization(@"钱包充值");
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = JobsWhiteColor;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        _imageView.image = JobsIMG(@"活动圈子背景图");
        [self addSubview:_imageView];
        
    }return _imageView;
}
-(UIButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                                  titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:nil
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:Internationalization(@"账单明细")
                                                        subTitle:nil
                                                       titleFont:UIFontWeightMediumSize(14)
                                                    subTitleFont:nil
                                                        titleCor:JobsCor(@"#FFFFFF")
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:JobsClearColor
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
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
            [self forceComingToPushVC:MSMyPostDynamicVC.new requestParams:nil];
            return nil;
            
        }];
        [self addSubview:_rightBtn];
    }return _rightBtn;
}
-(UIButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                                  titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:JobsIMG(@"全局返回箭头")
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:@""
                                                        subTitle:nil
                                                       titleFont:UIFontWeightMediumSize(14)
                                                    subTitleFont:nil
                                                        titleCor:JobsCor(@"#FFFFFF")
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:JobsClearColor
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
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
        [self addSubview:_leftBtn];
    }return _leftBtn;
}
@end
