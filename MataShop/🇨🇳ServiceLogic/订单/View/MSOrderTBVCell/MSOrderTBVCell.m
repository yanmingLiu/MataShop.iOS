//
//  MSOrderTBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSOrderTBVCell.h"

@interface MSOrderTBVCell ()
/// UI
@property(nonatomic,strong)UIButton *shopTitleBtn;/// 店铺名字
@property(nonatomic,strong)UILabel *orderStateLab;/// 订单5大状态：待付款、待发货（已付款）、已发货（在途）、已收货（待评价）、完成订单（已评价）
@property(nonatomic,strong)UIButton *goodsDetailsBtn;///
@property(nonatomic,strong)UILabel *orderTime;///
@property(nonatomic,strong)UILabel *payLab;///
@property(nonatomic,strong)UIButton *orderStateBtn;/// 立即支付、确认收货
@property(nonatomic,strong)UIButton *logisticsBtn;///
/// Data
@property(nonatomic,strong)MSOrderModel *orderModel;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;

@end

@implementation MSOrderTBVCell
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    MSOrderTBVCell *cell = (MSOrderTBVCell *)[tableView tableViewCellClass:MSOrderTBVCell.class];
    if (!cell) {
        cell = [MSOrderTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell setCellBgImage:JobsIMG(@"CasinoAgencyTBVCell4")];
    }
    [cell cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSOrderModel *_Nullable)model{
    self.orderModel = model;
    self.shopTitleBtn.alpha = 1;
    self.orderStateLab.alpha = 1;
    self.goodsDetailsBtn.alpha = 1;
    self.orderTime.alpha = 1;
    
    if(self.orderModel.orderState != JobsOrderState_Finished){
        self.orderStateBtn.alpha = 1;
    }
    
    self.logisticsBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(MSOrderModel *_Nullable)model{
    return CGSizeMake(JobsWidth(345), JobsWidth(276));
}
#pragma mark —— 子类重写父类方法
-(void)setFrame:(CGRect)frame{
    /**
     参见：关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量
     ❤️如果单独的对每一个row对应的UITableViewCell的边距有缩进则使用下列方法❤️
     如果这个TableViewCell是BaseTableViewCell则不需要复写-(void)setFrame:(CGRect)frame；否则是需要：
     
     UILocationProtocol_synthesize
     直接影响:
     cell.offsetXForEach = JobsWidth(8);
     cell.offsetYForEach = JobsWidth(6);
     
     // 在具体的子类去实现,分类调用异常
     #pragma mark —— 复写父类方法
     -(void)setFrame:(CGRect)frame{
     NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
     NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
     frame.origin.x += self.offsetXForEach;
     frame.origin.y += self.offsetYForEach;
     frame.size.height -= self.offsetYForEach * 2;
     frame.size.width -= self.offsetXForEach * 2;
     [super setFrame:frame];
     }
     
     ❤️ 如果对每一section的cell进行缩进，则在外层协议：❤️
     - (void)tableView:(UITableView *)tableView
     willDisplayCell:(UITableViewCell *)cell
     forRowAtIndexPath:(NSIndexPath *)indexPath{
     
     [UITableViewCell tableView:tableView
     makeSectionFirstAndLastCell:cell
     atIndexPath:indexPath
     cellBgCor:UIColor.whiteColor
     bottomLineCor:UIColor.whiteColor
     cellOutLineCor:HEXCOLOR(0xEEE2C8)
     roundCorner:JobsWidth(8)
     borderWidth:JobsWidth(1)
     dx:JobsWidth(0)
     dy:0];
     }
     */
    self.offsetXForEach = JobsWidth(15);
    self.offsetYForEach = JobsWidth(15);
    
    [self jobsResetTableViewCellFrame:frame
                          cellOffsetX:self.offsetXForEach
                          cellOffsetY:self.offsetYForEach];
}
#pragma mark —— lazyLoad
-(UIButton *)shopTitleBtn{
    if(!_shopTitleBtn){
        @jobs_weakify(self)
        _shopTitleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                          background:nil
                                                      titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                       textAlignment:NSTextAlignmentCenter
                                                    subTextAlignment:NSTextAlignmentCenter
                                                         normalImage:JobsIMG(@"店铺名字")
                                                      highlightImage:nil
                                                     attributedTitle:nil
                                             selectedAttributedTitle:nil
                                                  attributedSubtitle:nil
                                                               title:nil
                                                            subTitle:nil
                                                           titleFont:UIFontWeightBoldSize(16)
                                                        subTitleFont:nil
                                                            titleCor:JobsCor(@"#333333")
                                                         subTitleCor:nil
                                                  titleLineBreakMode:NSLineBreakByWordWrapping
                                               subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                 baseBackgroundColor:UIColor.whiteColor
                                                        imagePadding:JobsWidth(5)
                                                        titlePadding:JobsWidth(0)
                                                      imagePlacement:NSDirectionalRectEdgeLeading
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
        [self.contentView addSubview:_shopTitleBtn];
        [_shopTitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(15));
            make.top.equalTo(self.contentView).offset(JobsWidth(20));
            make.height.mas_equalTo(JobsWidth(20));
        }];
        [_shopTitleBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    }
    _shopTitleBtn.jobsResetTitle(self.orderModel.shopName);
    return _shopTitleBtn;
}

-(UILabel *)orderStateLab{
    if(!_orderStateLab){
        _orderStateLab = UILabel.new;
        _orderStateLab.textColor = JobsCor(@"#DD0000");
        _orderStateLab.font = UIFontWeightMediumSize(14);
        [self.contentView addSubview:_orderStateLab];
        [_orderStateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(-15));
            make.top.equalTo(self.shopTitleBtn);
        }];
    }
    switch (self.orderModel.orderState) {
        case JobsOrderState_Due:{/// 待付款订单
            _orderStateLab.text = Internationalization(@"待付款");
        }break;
        case JobsOrderState_WaitSent:{/// 已付款.待发货订单
            _orderStateLab.text = Internationalization(@"已付款");
        }break;
        case JobsOrderState_WaitReceived:{/// 已发货（在途）.待收货订单
            _orderStateLab.text = Internationalization(@"在途中");
        }break;
        case JobsOrderState_Evaluate:{/// 已完成收货的订单，并且待评价
            _orderStateLab.text = Internationalization(@"待评价");
        }break;
        case JobsOrderState_Finished:{/// 已完成收货的订单，并且已经评价
            _orderStateLab.text = Internationalization(@"已完成");
        }break;
            
        default:
            break;
    }return _orderStateLab;
}

-(UIButton *)goodsDetailsBtn{
    if(!_goodsDetailsBtn){
        @jobs_weakify(self)
        _goodsDetailsBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                             background:nil
                                                         titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                          textAlignment:NSTextAlignmentCenter
                                                       subTextAlignment:NSTextAlignmentCenter
                                                            normalImage:JobsIMG(@"订单商品占位图")
                                                         highlightImage:nil
                                                        attributedTitle:nil
                                                selectedAttributedTitle:nil
                                                     attributedSubtitle:nil
                                                                  title:nil
                                                               subTitle:nil
                                                              titleFont:UIFontWeightBoldSize(14)
                                                           subTitleFont:UIFontWeightMediumSize(12)
                                                               titleCor:JobsCor(@"#333333")
                                                            subTitleCor:JobsCor(@"#666666")
                                                     titleLineBreakMode:NSLineBreakByWordWrapping
                                                  subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                    baseBackgroundColor:UIColor.whiteColor
                                                           imagePadding:JobsWidth(15)
                                                           titlePadding:JobsWidth(25)
                                                         imagePlacement:NSDirectionalRectEdgeLeading
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
        [self.contentView addSubview:_goodsDetailsBtn];
        [_goodsDetailsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(15));
            make.top.equalTo(self.shopTitleBtn.mas_bottom).offset(JobsWidth(20));
            make.height.mas_equalTo(JobsWidth(78));
        }];
        [_goodsDetailsBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        _goodsDetailsBtn.jobsResetTitle(self.orderModel.goodsTitle);
        _goodsDetailsBtn.jobsResetSubtitle(self.orderModel.goodsSubTitle);
    }return _goodsDetailsBtn;
}

-(UILabel *)orderTime{
    if(!_orderTime){
        _orderTime = UILabel.new;
        _orderTime.textColor = JobsCor(@"#333333");
        _orderTime.font = UIFontWeightMediumSize(14);
        [self.contentView addSubview:_orderTime];
        [_orderTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.shopTitleBtn);
            make.height.mas_equalTo(JobsWidth(12));
            make.top.equalTo(self.goodsDetailsBtn.mas_bottom).offset(JobsWidth(25));
        }];
    }
    _orderTime.text = self.orderModel.orderTime;
    return _orderTime;
}

-(UILabel *)payLab{
    if(!_payLab){
        _payLab = UILabel.new;
        [self.contentView addSubview:_payLab];
        [_payLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.orderStateLab);
            make.height.mas_equalTo(JobsWidth(16));
            make.top.equalTo(self.orderTime.mas_bottom).offset(JobsWidth(15));
        }];
    }
    _payLab.attributedText = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr];
    return _payLab;
}

-(UIButton *)orderStateBtn{
    if(!_orderStateBtn){
        @jobs_weakify(self)
        _orderStateBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
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
                                                         subTitleFont:nil
                                                             titleCor:JobsWhiteColor
                                                          subTitleCor:nil
                                                   titleLineBreakMode:NSLineBreakByWordWrapping
                                                subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                  baseBackgroundColor:JobsCor(@"#DD0000")
                                                         imagePadding:JobsWidth(0)
                                                         titlePadding:JobsWidth(0)
                                                       imagePlacement:NSDirectionalRectEdgeNone
                                           contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                             contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                        contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                    cornerRadiusValue:JobsWidth(17)
                                                      roundingCorners:UIRectCornerAllCorners
                                                 roundingCornersRadii:CGSizeZero
                                                       layerBorderCor:JobsCor(@"#DD0000")
                                                          borderWidth:JobsWidth(0.5f)
                                                        primaryAction:nil
                                                      clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastMsg:Internationalization(@"????")];
            return nil;
        }];
        [self.contentView addSubview:_orderStateBtn];
        [_orderStateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(84), JobsHeight(34)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-15));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-20));
        }];
    }
    
    switch (self.orderModel.orderState) {
        case JobsOrderState_Due:{/// 待付款订单
            _orderStateBtn.jobsResetTitle(Internationalization(@"立即支付"));
        }break;
        case JobsOrderState_WaitSent:{/// 已付款.待发货订单
            _orderStateBtn.jobsResetTitle(Internationalization(@"我要催单"));
        }break;
        case JobsOrderState_WaitReceived:{/// 已发货（在途）.待收货订单
            _orderStateBtn.jobsResetTitle(Internationalization(@"确认收货"));
        }break;
        case JobsOrderState_Evaluate:{/// 已完成收货的订单，并且待评价
            _orderStateBtn.jobsResetTitle(Internationalization(@"去评价"));
        }break;
        case JobsOrderState_Finished:{/// 已完成收货的订单，并且已经评价
            /// 此时按钮不显示
        }break;
            
        default:
            break;
    }return _orderStateBtn;
}

-(UIButton *)logisticsBtn{
    if(!_logisticsBtn){
        @jobs_weakify(self)
        _logisticsBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                          background:nil
                                                      titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                       textAlignment:NSTextAlignmentCenter
                                                    subTextAlignment:NSTextAlignmentCenter
                                                         normalImage:nil
                                                      highlightImage:nil
                                                     attributedTitle:nil
                                             selectedAttributedTitle:nil
                                                  attributedSubtitle:nil
                                                               title:Internationalization(@"查看物流")
                                                            subTitle:nil
                                                           titleFont:UIFontWeightBoldSize(12)
                                                        subTitleFont:nil
                                                            titleCor:JobsCor(@"#333333")
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
                                                   cornerRadiusValue:JobsWidth(17)
                                                     roundingCorners:UIRectCornerAllCorners
                                                roundingCornersRadii:CGSizeZero
                                                      layerBorderCor:JobsCor(@"#CCCCCC")
                                                         borderWidth:JobsWidth(0.5f)
                                                       primaryAction:nil
                                                     clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastMsg:Internationalization(@"查看物流")];
            return nil;
        }];
        [self.contentView addSubview:_logisticsBtn];
    }
    if(self.orderModel.orderState == JobsOrderState_Finished){
        [_logisticsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(84), JobsHeight(34)));
            make.right.equalTo(self.contentView).offset(JobsWidth(-15));
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-20));
        }];
    }else{
        [_logisticsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(84), JobsHeight(34)));
            make.right.equalTo(self.orderStateBtn.mas_left).offset(JobsWidth(-15));
            make.centerY.equalTo(self.orderStateBtn);
        }];
    }return _logisticsBtn;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    if (!_richTextMutArr) {
        _richTextMutArr = NSMutableArray.array;
        switch (self.orderModel.payType) {
            case JobsPayType_银行卡:{
                [_richTextMutArr addObject:Internationalization(@"银行卡支付")];
            }break;
            case JobsPayType_支付宝:{
                [_richTextMutArr addObject:Internationalization(@"支付宝支付")];
            }break;
            case JobsPayType_微信:{
                [_richTextMutArr addObject:Internationalization(@"微信支付")];
            }break;
            case JobsPayType_AppBalance:{
                [_richTextMutArr addObject:Internationalization(@"账户余额支付")];
            }break;
            case JobsPayType_MataValue:{
                [_richTextMutArr addObject:Internationalization(@"Mata值支付")];
            }break;
            case JobsPayType_MataCreditScore:{
                [_richTextMutArr addObject:Internationalization(@"Mata信用分支付")];
            }break;
                
            default:
                [_richTextMutArr addObject:Internationalization(@"暂无数据")];
                break;
        }
        [_richTextMutArr addObject:self.orderModel.orderAmount];
    }return _richTextMutArr;
}

-(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
    if (!_richTextConfigMutArr) {
        _richTextConfigMutArr = NSMutableArray.array;
        
        RichTextConfig *config_01 = RichTextConfig.new;
        config_01.font = UIFontWeightMediumSize(14);
        config_01.textCor = JobsCor(@"#333333");
        config_01.targetString = self.richTextMutArr[0];
        [_richTextConfigMutArr addObject:config_01];

        RichTextConfig *config_02 = RichTextConfig.new;
        config_02.font = UIFontWeightSemiboldSize(16);
        config_02.textCor = JobsCor(@"#333333");
        config_02.targetString = self.richTextMutArr[1];
        [_richTextConfigMutArr addObject:config_02];
        
    }return _richTextConfigMutArr;
}

@end
