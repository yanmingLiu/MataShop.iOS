//
//  BaiShaETProjTipsView01.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjTipsView01.h"

@interface BaiShaETProjTipsView01 ()

@end

@implementation BaiShaETProjTipsView01

@synthesize viewModel = _viewModel;
@synthesize titleIMGV = _titleIMGV;
@synthesize subTitleIMGV = _subTitleIMGV;
@synthesize tipsLab = _tipsLab;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_tipsView01OnceToken = 0;
    static_tipsView01 = nil;
}

static BaiShaETProjTipsView01 *static_tipsView01 = nil;
static dispatch_once_t static_tipsView01OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_tipsView01OnceToken, ^{
        static_tipsView01 = BaiShaETProjTipsView01.new;
    });return static_tipsView01;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.titleIMGV.image = JobsIMG(@"暂无消息通知");
    self.subTitleIMGV.alpha = 1;
    self.tipsLab.text = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"暂无消息通知"): self.viewModel.textModel.text;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— lazyLoad
-(UIImageView *)titleIMGV{
    if (!_titleIMGV) {
        _titleIMGV = UIImageView.new;
        _titleIMGV.image = JobsIMG(@"暂无消息通知");
        [self addSubview:_titleIMGV];
        [_titleIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(100)));
        }];
    }return _titleIMGV;
}

-(UIImageView *)subTitleIMGV{
    if (!_subTitleIMGV) {
        _subTitleIMGV = UIImageView.new;
        _subTitleIMGV.image = JobsIMG(@"彩虹弧形");
        [self addSubview:_subTitleIMGV];
        [_subTitleIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.titleIMGV.mas_bottom).offset(JobsWidth(28));
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(199)));
        }];
    }return _subTitleIMGV;
}

-(UILabel *)tipsLab{
    if (!_tipsLab) {
        _tipsLab = UILabel.new;
        _tipsLab.text = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"暂无消息通知"): self.viewModel.textModel.text;
        _tipsLab.textColor = HEXCOLOR(0x757575);
        _tipsLab.textAlignment = NSTextAlignmentCenter;
        _tipsLab.font = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        [self.subTitleIMGV addSubview:_tipsLab];
        [_tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.subTitleIMGV).offset(JobsWidth(28));
            make.height.mas_equalTo(JobsWidth(14));
        }];
        [_tipsLab makeLabelByShowingType:UILabelShowingType_05];
    }return _tipsLab;
}

@end
