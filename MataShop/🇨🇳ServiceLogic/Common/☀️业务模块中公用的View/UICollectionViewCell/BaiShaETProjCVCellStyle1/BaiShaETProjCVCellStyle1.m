//
//  BaiShaETProjCVCellStyle1.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/16.
//

#import "BaiShaETProjCVCellStyle1.h"

@interface BaiShaETProjCVCellStyle1 ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIImageView *imgV;
/// Data

@end

@implementation BaiShaETProjCVCellStyle1

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjCVCellStyle1 *cell = (BaiShaETProjCVCellStyle1 *)[collectionView collectionViewCellClass:BaiShaETProjCVCellStyle1.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:BaiShaETProjCVCellStyle1.class];
        cell = (BaiShaETProjCVCellStyle1 *)[collectionView collectionViewCellClass:BaiShaETProjCVCellStyle1.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    MakeDataNull
    self.titleLab.alpha = 1;
    self.btn.alpha = 1;
    self.imgV.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(164), JobsWidth(90));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"我是大标题") : self.viewModel.textModel.text;
        _titleLab.font = UIFontWeightRegularSize(14);
        _titleLab.textColor = HEXCOLOR(0x424242);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(8));
            make.top.equalTo(self.contentView).offset(JobsWidth(10));
        }];
        [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    }return _titleLab;
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = UIButton.new;
        _btn.normalTitle = Internationalization(@"立即開始");
        _btn.normalTitleColor = JobsWhiteColor;
        _btn.titleFont = UIFontWeightRegularSize(10);
        _btn.normalBackgroundImage = self.viewModel.bgImage ? : [UIColor imageWithColor:JobsRandomColor];
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(52), JobsWidth(18)));
            make.left.equalTo(self.titleLab);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-12));
        }];
        @jobs_weakify(self)
        [_btn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
//            [self JobsTestPopView:@"立即開始"];
            return nil;
        }];
    }return _btn;
}

-(UIImageView *)imgV{
    if (!_imgV) {
        _imgV = UIImageView.new;
        _imgV.image = self.viewModel.image ? : [UIColor imageWithColor:JobsRandomColor];
        [self.contentView addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(95), JobsWidth(95 - 12)));
            make.right.bottom.equalTo(self.contentView);
        }];
    }return _imgV;
}

@end
