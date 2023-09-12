//
//  BaiShaETProjVIPSubCVCell_01.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjVIPSubCVCell_01.h"

@interface BaiShaETProjVIPSubCVCell_01 ()
/// UI
@property(nonatomic,strong)BaseLabel *titleLab;
@property(nonatomic,strong)JobsUpDownLab *vipInfoLab;
@property(nonatomic,strong)UIImageView *vipIMGV;
@property(nonatomic,strong)UIImageView *bgIMGV;
@property(nonatomic,strong)NSMutableArray <JobsUpDownLab *>*labMutArr;
@property(nonatomic,strong)NSMutableArray <JobsUpDownLabModel *>*labModelMutArr;
/// Data
@property(nonatomic,strong)UIColor *bgCor;
@property(nonatomic,strong)UIColor *titleLabBgCor;
@property(nonatomic,strong)UIColor *vipInfoUpLabCor;
@property(nonatomic,strong)UIColor *vipInfoDownLabCor;
@property(nonatomic,strong)BaiShaETProjVIPSubModel *subModel;
@property(nonatomic,strong)JobsUpDownLabModel *vipInfoLabModel;
@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;

@end

@implementation BaiShaETProjVIPSubCVCell_01

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.subModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjVIPSubCVCell_01 *cell = (BaiShaETProjVIPSubCVCell_01 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_01.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:BaiShaETProjVIPSubCVCell_01.class];
        cell = (BaiShaETProjVIPSubCVCell_01 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_01.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;;

    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(BaiShaETProjVIPSubModel *_Nullable)model{
    self.subModel = model;
    if (self.viewModel) {
        self.contentView.backgroundColor = self.bgCor;
        [self.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
        self.bgIMGV.alpha = 1;
//        if (self.subModel.rankClass == RankClass_current) {
            self.titleLab.alpha = 1;
//        }
        
        self.vipIMGV.alpha = 1;
        self.vipInfoLab.alpha = 1;
        [self masonry];
    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(BaiShaETProjVIPSubModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(160));
}
#pragma mark —— 一些私有方法
-(void)masonry{
    // 实现masonry水平固定间隔方法
    [self.labMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:0
                                     leadSpacing:0
                                     tailSpacing:0];
    // 设置array的垂直方向的约束
    [self.labMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(JobsWidth(36 + 16));
    }];
}
#pragma mark —— lazyLoad
-(BaseLabel *)titleLab{
    if (!_titleLab) {
        _titleLab = BaseLabel.new;
        _titleLab.text = Internationalization(@"    當前等級    ");
        _titleLab.font = notoSansRegular(10);
        _titleLab.textColor = UIColor.whiteColor;
        _titleLab.backgroundColor = self.titleLabBgCor;
        _titleLab.offsetY = JobsWidth(-3);
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView);
            make.height.mas_equalTo(JobsWidth(JobsWidth(20)));
        }];
        [_titleLab makeLabelByShowingType:UILabelShowingType_03];
        [_titleLab appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight
                                                 cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return _titleLab;
}

-(UIImageView *)bgIMGV{
    if (!_bgIMGV) {
        _bgIMGV = UIImageView.new;
        _bgIMGV.image = JobsIMG(@"VIP等级背景图");
        [self.contentView addSubview:_bgIMGV];
        [_bgIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(176.25), JobsWidth(144.04)));
            make.top.equalTo(self.contentView).offset(JobsWidth(34));
            make.left.equalTo(self.contentView).offset(JobsWidth(-21));
        }];
    }return _bgIMGV;
}

-(UIImageView *)vipIMGV{
    if (!_vipIMGV) {
        _vipIMGV = UIImageView.new;
        [self.contentView addSubview:_vipIMGV];
        [_vipIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(JobsWidth(15));
            if (self.subModel.rankClass == RankClass_current) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(68), JobsWidth(68)));
                make.right.equalTo(self.contentView).offset(JobsWidth(-25));
            }else{
                make.size.mas_equalTo(CGSizeMake(JobsWidth(102), JobsWidth(82)));
                make.right.equalTo(self.contentView).offset(JobsWidth(-8));
            }
        }];
        switch (self.subModel.rankClass) {
            case RankClass_current:{
                _vipIMGV.image = JobsIMG(@"等级0已激活");
            }break;
            case RankClass_VIP0:{
                _vipIMGV.image = JobsIMG(@"等级0已激活");
            }break;
            case RankClass_VIP1:{
                _vipIMGV.image = JobsIMG(@"等级1已激活");
            }break;
            case RankClass_VIP2:{
                _vipIMGV.image = JobsIMG(@"等级2已激活");
            }break;
            case RankClass_VIP3:{
                _vipIMGV.image = JobsIMG(@"等级3已激活");
            }break;
            case RankClass_VIP4:{
                _vipIMGV.image = JobsIMG(@"等级4已激活");
            }break;
            case RankClass_VIP5:{
                _vipIMGV.image = JobsIMG(@"等级5已激活");
            }break;
            case RankClass_VIP6:{
                _vipIMGV.image = JobsIMG(@"等级6已激活");
            }break;
            case RankClass_VIP7:{
                _vipIMGV.image = JobsIMG(@"等级7已激活");
            }break;
            case RankClass_VIP8:{
                _vipIMGV.image = JobsIMG(@"等级8已激活");
            }break;
            case RankClass_VIP9:{
                _vipIMGV.image = JobsIMG(@"等级9已激活");
            }break;
            case RankClass_VIP10:{
                _vipIMGV.image = JobsIMG(@"等级10已激活");
            }break;
                
            default:
                _vipIMGV.image = JobsIMG(@"等级0已激活");
                break;
        }
    }return _vipIMGV;
}

-(JobsUpDownLab *)vipInfoLab{
    if (!_vipInfoLab) {
        _vipInfoLab = JobsUpDownLab.new;
        [self.contentView addSubview:_vipInfoLab];
        [_vipInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(102 + 30), JobsWidth(24 + 14 + 8)));
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(4));
        }];
        [_vipInfoLab richElementsInViewWithModel:self.vipInfoLabModel];
    }return _vipInfoLab;
}

-(JobsUpDownLabModel *)vipInfoLabModel{
    if (!_vipInfoLabModel) {
        _vipInfoLabModel = JobsUpDownLabModel.new;
        _vipInfoLabModel.upLabText = self.subModel.vipName;
        _vipInfoLabModel.upLabTextAlignment = NSTextAlignmentLeft;
        _vipInfoLabModel.upLabFont = notoSansBold(24);
        _vipInfoLabModel.upLabTextCor = self.vipInfoUpLabCor;
        _vipInfoLabModel.upLabBgCor = UIColor.clearColor;

        _vipInfoLabModel.downLabAttributedText = [self makeAttributedStringWithRichTextMutArr:self.richTextMutArr
                                                                         richTextConfigMutArr:self.richTextConfigMutArr
                                                                               paragraphStyle:nil];
//        _vipInfoLabModel.downLabTextAlignment = NSTextAlignmentLeft;
//        _vipInfoLabModel.downLabFont = notoSansRegular(14);
//        _vipInfoLabModel.downLabTextCor = self.vipInfoDownLabCor;
//        _vipInfoLabModel.downLabText = [Internationalization(@"保級期限日期 ：") stringByAppendingString:Internationalization(@"30天")];
        
        _vipInfoLabModel.downLabBgCor = UIColor.clearColor;

        _vipInfoLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _vipInfoLabModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _vipInfoLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _vipInfoLabModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        
        _vipInfoLabModel.space = JobsWidth(8);
        
    }return _vipInfoLabModel;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    if (!_richTextMutArr) {
        _richTextMutArr = NSMutableArray.array;
        [_richTextMutArr addObject:Internationalization(@"保級期限日期 ：")];
        [_richTextMutArr addObject:Internationalization(@"30天")];
    }return _richTextMutArr;
}

-(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
    if (!_richTextConfigMutArr) {
        _richTextConfigMutArr = NSMutableArray.array;
        
        RichTextConfig *config_01 = RichTextConfig.new;
        config_01.font = notoSansRegular(14);
        config_01.textCor = HEXCOLOR(0xA2735A);
        config_01.targetString = self.richTextMutArr[0];
        [_richTextConfigMutArr addObject:config_01];

        RichTextConfig *config_02 = RichTextConfig.new;
        config_02.font = notoSansBold(14);
        config_02.textCor = HEXCOLOR(0x703F25);
        config_02.targetString = self.richTextMutArr[1];
        [_richTextConfigMutArr addObject:config_02];
        
    }return _richTextConfigMutArr;
}

-(NSMutableArray<JobsUpDownLab *> *)labMutArr{
    if (!_labMutArr) {
        _labMutArr = NSMutableArray.array;
        {
            JobsUpDownLab *upDownLab = JobsUpDownLab.new;
            [self.contentView addSubview:upDownLab];
            [upDownLab richElementsInViewWithModel:self.labModelMutArr[0]];
            [_labMutArr addObject:upDownLab];
        }
        
        {
            JobsUpDownLab *upDownLab = JobsUpDownLab.new;
            [self.contentView addSubview:upDownLab];
            [upDownLab richElementsInViewWithModel:self.labModelMutArr[1]];
            [_labMutArr addObject:upDownLab];
        }
        
        {
            JobsUpDownLab *upDownLab = JobsUpDownLab.new;
            [self.contentView addSubview:upDownLab];
            [upDownLab richElementsInViewWithModel:self.labModelMutArr[2]];
            [_labMutArr addObject:upDownLab];
        }
    }return _labMutArr;
}

-(NSMutableArray<JobsUpDownLabModel *> *)labModelMutArr{
    if (!_labModelMutArr) {
        _labModelMutArr = NSMutableArray.array;
        {
            JobsUpDownLabModel *upDownLabModel = JobsUpDownLabModel.new;
            
            upDownLabModel.upLabText = Internationalization(@"0");
            upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.upLabFont = notoSansBold(16);
            upDownLabModel.upLabTextCor = self.vipInfoUpLabCor;
            upDownLabModel.upLabBgCor = UIColor.clearColor;

            upDownLabModel.downLabText = Internationalization(@"累積存款");
            upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.downLabFont = notoSansRegular(12);
            upDownLabModel.downLabTextCor = self.vipInfoDownLabCor;
            upDownLabModel.downLabBgCor = UIColor.clearColor;

            upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            
            [_labModelMutArr addObject:upDownLabModel];
        }
        
        {
            JobsUpDownLabModel *upDownLabModel = JobsUpDownLabModel.new;
            
            upDownLabModel.upLabText = Internationalization(@"0");
            upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.upLabFont = notoSansBold(16);
            upDownLabModel.upLabTextCor = self.vipInfoUpLabCor;
            upDownLabModel.upLabBgCor = UIColor.clearColor;

            upDownLabModel.downLabText = Internationalization(@"流水要求");
            upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.downLabFont = notoSansRegular(12);
            upDownLabModel.downLabTextCor = self.vipInfoDownLabCor;
            upDownLabModel.downLabBgCor = UIColor.clearColor;

            upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            
            [_labModelMutArr addObject:upDownLabModel];
        }
        
        {
            JobsUpDownLabModel *upDownLabModel = JobsUpDownLabModel.new;
            
            upDownLabModel.upLabText = Internationalization(@"0");
            upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.upLabFont = notoSansBold(16);
            upDownLabModel.upLabTextCor = self.vipInfoUpLabCor;
            upDownLabModel.upLabBgCor = UIColor.clearColor;

            upDownLabModel.downLabText = Internationalization(@"保級流水");
            upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
            upDownLabModel.downLabFont = notoSansRegular(12);
            upDownLabModel.downLabTextCor = self.vipInfoDownLabCor;
            upDownLabModel.downLabBgCor = UIColor.clearColor;

            upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_MiddleLine;
            upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_MiddleLine;
            
            [_labModelMutArr addObject:upDownLabModel];
        }
    }return _labModelMutArr;
}

-(UIColor *)vipInfoUpLabCor{
    if (!_vipInfoUpLabCor) {
        switch (self.subModel.rankClass) {
            case RankClass_current:{
                _vipInfoUpLabCor = HEXCOLOR(0xAE1E17);
            }break;
            case RankClass_VIP0:{
                _vipInfoUpLabCor = HEXCOLOR(0xAE1E17);
            }break;
            case RankClass_VIP1:{
                _vipInfoUpLabCor = HEXCOLOR(0xAC4E0E);
            }break;
            case RankClass_VIP2:{
                _vipInfoUpLabCor = HEXCOLOR(0xB07B01);
            }break;
            case RankClass_VIP3:{
                _vipInfoUpLabCor = HEXCOLOR(0x425500);
            }break;
            case RankClass_VIP4:{
                _vipInfoUpLabCor = HEXCOLOR(0x05367D);
            }break;
            case RankClass_VIP5:{
                _vipInfoUpLabCor = HEXCOLOR(0x3A0F7D);
            }break;
            case RankClass_VIP6:{
                _vipInfoUpLabCor = HEXCOLOR(0x8C103E);
            }break;
            case RankClass_VIP7:{
                _vipInfoUpLabCor = HEXCOLOR(0x703F25);
            }break;
            case RankClass_VIP8:{
                _vipInfoUpLabCor = HEXCOLOR(0x455B5D);
            }break;
            case RankClass_VIP9:{
                _vipInfoUpLabCor = HEXCOLOR(0x546D8F);
            }break;
            case RankClass_VIP10:{
                _vipInfoUpLabCor = HEXCOLOR(0xEDCF9D);
            }break;
                
            default:
                _vipInfoUpLabCor = HEXCOLOR(0xAE1E17);
                break;
        }
    }return _vipInfoUpLabCor;
}

-(UIColor *)vipInfoDownLabCor{
    if (!_vipInfoDownLabCor) {
        switch (self.subModel.rankClass) {
            case RankClass_current:{
                _vipInfoDownLabCor = HEXCOLOR(0xAE1E17);
            }break;
            case RankClass_VIP0:{
                _vipInfoDownLabCor = HEXCOLOR(0xAE1E17);
            }break;
            case RankClass_VIP1:{
                _vipInfoDownLabCor = HEXCOLOR(0xCA895A);
            }break;
            case RankClass_VIP2:{
                _vipInfoDownLabCor = HEXCOLOR(0xD2AC52);
            }break;
            case RankClass_VIP3:{
                _vipInfoDownLabCor = HEXCOLOR(0x8FA556);
            }break;
            case RankClass_VIP4:{
                _vipInfoDownLabCor = HEXCOLOR(0x5A83B9);
            }break;
            case RankClass_VIP5:{
                _vipInfoDownLabCor = HEXCOLOR(0x8463AF);
            }break;
            case RankClass_VIP6:{
                _vipInfoDownLabCor = HEXCOLOR(0xB85D8D);
            }break;
            case RankClass_VIP7:{
                _vipInfoDownLabCor = HEXCOLOR(0xA2735A);
            }break;
            case RankClass_VIP8:{
                _vipInfoDownLabCor = HEXCOLOR(0x7E9193);
            }break;
            case RankClass_VIP9:{
                _vipInfoDownLabCor = HEXCOLOR(0x7486A9);
            }break;
            case RankClass_VIP10:{
                _vipInfoDownLabCor = HEXCOLOR(0x948369);
            }break;
                
            default:
                _vipInfoDownLabCor = HEXCOLOR(0xAE1E17);
                break;
        }
    }return _vipInfoDownLabCor;
}

-(UIColor *)titleLabBgCor{
    if (!_titleLabBgCor) {
        _titleLabBgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xE9C65D),HEXCOLOR(0xDDAA3A)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(80), JobsWidth(20))];
    }return _titleLabBgCor;
}

-(UIColor *)bgCor{
    if (!_bgCor) {
        switch (self.subModel.rankClass) {
            case RankClass_current:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF4CBCB),HEXCOLOR(0xF3B3B3)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP0:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF4CBCB),HEXCOLOR(0xF3B3B3)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP1:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF6DDC6),HEXCOLOR(0xF2CCB2)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP2:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xFDEAB7),HEXCOLOR(0xF7DDA4)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP3:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xD2E0A1),HEXCOLOR(0xC6E195)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP4:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xACD2EF),HEXCOLOR(0xA9C8F0)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP5:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xC6C2ED),HEXCOLOR(0xDAC5E9)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP6:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF2BBD1),HEXCOLOR(0xE9B6EE)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP7:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xEFCDB5),HEXCOLOR(0xE5B69E)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP8:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xCDDBDE),HEXCOLOR(0xB0C3C5)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP9:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xAFC8EE),HEXCOLOR(0x96A0C2)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
            case RankClass_VIP10:{
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0x101010),HEXCOLOR(0x55534F),HEXCOLOR(0x272727)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
            }break;
                
            default:
                _bgCor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF4CBCB),HEXCOLOR(0xF3B3B3)]]
                                             startPoint:CGPointZero
                                               endPoint:CGPointZero
                                                 opaque:NO
                                         targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(160))];
                break;
        }
    }return _bgCor;
}

@end
