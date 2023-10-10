//
//  MSCustomerServiceTBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSCustomerServiceTBVCell.h"

@interface MSCustomerServiceTBVCell ()
/// UI
@property(nonatomic,strong)UIButton *cpyBtn;

@end

@implementation MSCustomerServiceTBVCell
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    MSCustomerServiceTBVCell *cell = (MSCustomerServiceTBVCell *)[tableView tableViewCellClass:MSCustomerServiceTBVCell.class];
    if (!cell) {
        cell = [MSCustomerServiceTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell setCellBgImage:JobsIMG(@"CasinoAgencyTBVCell4")];
        [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.imageView.image = self.viewModel.image;
    self.textLabel.text = self.viewModel.textModel.text;
    self.cpyBtn.alpha = 1;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(70);
}
#pragma mark —— 子类重写父类方法
/**
 1、-(void)setFrame:(CGRect)frame 此方法仅限于具体的 UITableViewCell子类使用
 2、如果在 BaseTableViewCell 实现此方法，那么一单相关子类集成 BaseTableViewCell 则会对-(void)setFrame:(CGRect)frame进行反复调用，因为[super setFrame:frame];
 3、禁止分类去调用，否则引起异常
 */
-(void)setFrame:(CGRect)frame{
    self.offsetXForEach = JobsWidth(-15);
    self.offsetYForEach = JobsWidth(0);
    [self jobsResetTableViewCellFrame:frame
                          cellOffsetX:self.offsetXForEach
                          cellOffsetY:self.offsetYForEach];
}
#pragma mark —— lazyLoad
-(UIButton *)cpyBtn{
    if(!_cpyBtn){
        @jobs_weakify(self)
        _cpyBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                    background:nil
                                                titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                 textAlignment:NSTextAlignmentCenter
                                              subTextAlignment:NSTextAlignmentCenter
                                                   normalImage:nil
                                                highlightImage:nil
                                               attributedTitle:nil
                                       selectedAttributedTitle:nil
                                            attributedSubtitle:nil
                                                         title:Internationalization(@"复制")
                                                      subTitle:nil
                                                     titleFont:UIFontWeightMediumSize(14)
                                                  subTitleFont:nil
                                                      titleCor:JobsCor(@"#DD0000")
                                                   subTitleCor:nil
                                            titleLineBreakMode:NSLineBreakByWordWrapping
                                         subtitleLineBreakMode:NSLineBreakByWordWrapping
                                           baseBackgroundColor:UIColor.whiteColor
                                                  imagePadding:JobsWidth(0)
                                                  titlePadding:JobsWidth(0)
                                                imagePlacement:NSDirectionalRectEdgeNone
                                    contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                      contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                 contentInsets:jobsSameDirectionalEdgeInsets(0)
                                             cornerRadiusValue:JobsWidth(15)
                                               roundingCorners:UIRectCornerAllCorners
                                          roundingCornersRadii:CGSizeZero
                                                layerBorderCor:nil
                                                   borderWidth:JobsWidth(0.5f)
                                                 primaryAction:nil
                                               clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            @"需要被复制的内容".pasteboard;
            return nil;
        }];
        [self.contentView addSubview:_cpyBtn];
        [_cpyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(30)));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(JobsWidth(-15));
        }];
    }return _cpyBtn;
}

@end
