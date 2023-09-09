//
//  BaiShaETProjPopupView11SubView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/21.
//

#import "BaiShaETProjPopupView11SubView.h"

@interface BaiShaETProjPopupView11SubView ()
/// UI
@property(nonatomic,strong)UIImageView *titleIMGV;
@property(nonatomic,strong)JobsUpDownLab *titleLab;
@property(nonatomic,strong)UIImageView *qrCodeIMGV;
/// Data
@property(nonatomic,strong)JobsUpDownLabModel *upDownLabModel;

@end

@implementation BaiShaETProjPopupView11SubView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_popupView11SubViewOnceToken = 0;
    static_popupView11SubView = nil;
}

static BaiShaETProjPopupView11SubView *static_popupView11SubView = nil;
static dispatch_once_t static_popupView11SubViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_popupView11SubViewOnceToken, ^{
        static_popupView11SubView = BaiShaETProjPopupView11SubView.new;
    });return static_popupView11SubView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.titleIMGV.alpha = 1;
    self.titleLab.alpha = 1;
    self.qrCodeIMGV.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(303), JobsWidth(424));
}
#pragma mark —— lazyLoad
-(UIImageView *)titleIMGV{
    if (!_titleIMGV) {
        _titleIMGV = UIImageView.new;
        _titleIMGV.image = JobsIMG(@"真人首存见面礼");
        [self addSubview:_titleIMGV];
        [_titleIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(296), JobsWidth(336)));
            make.top.equalTo(self).offset(JobsWidth(4));
        }];
        [_titleIMGV cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return _titleIMGV;
}

-(JobsUpDownLab *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsUpDownLab.new;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleIMGV).offset(JobsWidth(8));
            make.top.equalTo(self.titleIMGV.mas_bottom).offset(JobsWidth(23));
            make.size.mas_equalTo(CGSizeMake(JobsWidth([BaiShaETProjPopupView11SubView viewSizeWithModel:nil].width / 2), JobsWidth(38)));
        }];
    }
    [_titleLab richElementsInViewWithModel:self.upDownLabModel];
    return _titleLab;
}

-(JobsUpDownLabModel *)upDownLabModel{
    if (!_upDownLabModel) {
        _upDownLabModel = JobsUpDownLabModel.new;
        _upDownLabModel.upLabText = @"真人首存見面禮";
        _upDownLabModel.upLabTextAlignment = NSTextAlignmentCenter;
        _upDownLabModel.upLabFont = notoSansRegular(14);
        _upDownLabModel.upLabTextCor = HEXCOLOR(0x3D4A58);
        _upDownLabModel.upLabBgCor = UIColor.clearColor;

        _upDownLabModel.downLabText = [Internationalization(@"活動時間：") stringByAppendingString:Internationalization(@"2021.5.1-6.1")];
        _upDownLabModel.downLabTextAlignment = NSTextAlignmentCenter;
        _upDownLabModel.downLabFont = notoSansRegular(10);
        _upDownLabModel.downLabTextCor = HEXCOLOR(0xB0B0B0);
        _upDownLabModel.downLabBgCor = UIColor.clearColor;

        _upDownLabModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _upDownLabModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _upDownLabModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _upDownLabModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;

        _upDownLabModel.space = JobsWidth(12);
    }return _upDownLabModel;
}

-(UIImageView *)qrCodeIMGV{
    if (!_qrCodeIMGV) {
        _qrCodeIMGV = UIImageView.new;
        _qrCodeIMGV.image = @"sdfrgtbh".createQRcode;
        [self addSubview:_qrCodeIMGV];
        [_qrCodeIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(jobsSameSize(68));
            make.right.equalTo(self).offset(JobsWidth(-18));
            make.bottom.equalTo(self).offset(JobsWidth(-8));
        }];
    }return _qrCodeIMGV;
}


@end
