//
//  BaiShaETProjPopupView11.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/21.
//

#import "BaiShaETProjPopupView11.h"

@interface BaiShaETProjPopupView11 ()
/// UI
@property(nonatomic,strong)BaiShaETProjPopupView11SubView *popupView11SubView;
@property(nonatomic,strong)UIButton *linkCopyBtn;
@property(nonatomic,strong)UIButton *downLoadBtn;
@property(nonatomic,strong)UIButton *cancelBtn;
/// Data
@property(nonatomic,assign)CGSize cancelBtnSize;

@end

@implementation BaiShaETProjPopupView11

@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_popupView11OnceToken = 0;
    static_popupView11 = nil;
}

static BaiShaETProjPopupView11 *static_popupView11 = nil;
static dispatch_once_t static_popupView11OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_popupView11OnceToken, ^{
        static_popupView11 = BaiShaETProjPopupView11.new;
    });return static_popupView11;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.clearColor;
        self.cancelBtnSize = CGSizeMake(JobsWidth(343), JobsWidth(40));
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        id f = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[RGB_COLOR(247, 131, 97),RGB_COLOR(245, 75, 100)]]
                                   startPoint:CGPointZero
                                     endPoint:CGPointZero
                                       opaque:NO
                               targetViewRect:CGRectMake(0, 0, 343, 40)];
        NSLog(@"");
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
        self.backgroundColor = UIColor.clearColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.popupView11SubView.alpha = 1;
    self.linkCopyBtn.alpha = 1;
    self.downLoadBtn.alpha = 1;
    self.cancelBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(424 + 132 + 40));
}
#pragma mark —— lazyLoad
-(BaiShaETProjPopupView11SubView *)popupView11SubView{
    if (!_popupView11SubView) {
        _popupView11SubView = BaiShaETProjPopupView11SubView.new;
        [_popupView11SubView richElementsInViewWithModel:nil];
        [self addSubview:_popupView11SubView];
        [_popupView11SubView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo([BaiShaETProjPopupView11SubView viewSizeWithModel:nil]);
            make.top.equalTo(self);
        }];
        [_popupView11SubView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return _popupView11SubView;
}

-(UIButton *)linkCopyBtn{
    if (!_linkCopyBtn) {
        _linkCopyBtn = UIButton.new;
        _linkCopyBtn.normalImage = JobsIMG(@"复制链接");
        _linkCopyBtn.normalTitle = Internationalization(@"复制链接");
        _linkCopyBtn.normalTitleColor = HEXCOLOR(0xC4C4C4);
        _linkCopyBtn.titleFont = notoSansRegular(12);
        [self addSubview:_linkCopyBtn];
        [_linkCopyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(76)));
            make.top.equalTo(self.popupView11SubView.mas_bottom).offset(JobsWidth(24));
            make.left.equalTo(self.popupView11SubView).offset(JobsWidth(39));
        }];
        [_linkCopyBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:JobsWidth(12)];
        @jobs_weakify(self)
        [_linkCopyBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
//            toast(x.titleForNormalState);
            [self cancelBtnActionForPopView:x];
            @"12345".pasteboard;
        }];
    }return _linkCopyBtn;
}

-(UIButton *)downLoadBtn{
    if (!_downLoadBtn) {
        _downLoadBtn = UIButton.new;
        _downLoadBtn.normalImage = JobsIMG(@"下载图片");
        _downLoadBtn.normalTitleColor = JobsWhiteColor;
        _downLoadBtn.normalTitle = Internationalization(@"下载图片");
        _downLoadBtn.normalTitleColor = HEXCOLOR(0xC4C4C4);
        _downLoadBtn.titleFont = notoSansRegular(12);
        [self addSubview:_downLoadBtn];
        [_downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(76)));
            make.top.equalTo(self.popupView11SubView.mas_bottom).offset(JobsWidth(24));
            make.right.equalTo(self.popupView11SubView).offset(JobsWidth(-39));
        }];
        [_downLoadBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:JobsWidth(12)];
        @jobs_weakify(self)
        [_downLoadBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
//            toast(x.titleForNormalState);
//            [self saveImageData:UIImagePNGRepresentation(JobsIMG(@"真人首存见面礼"))];
            [self saveImageData:UIImagePNGRepresentation(self.popupView11SubView.viewShots)];
            [self cancelBtnActionForPopView:x];
        }];
    }return _downLoadBtn;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = UIButton.new;
        _cancelBtn.normalBackgroundImage = JobsIMG(@"活动分享取消按钮");
        _cancelBtn.normalTitle = Internationalization(@"取消");
        _cancelBtn.normalTitleColor = HEXCOLOR(0xB0B0B0);
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.cancelBtnSize);
            make.centerX.equalTo(self);
            make.top.equalTo(self.linkCopyBtn.mas_bottom).offset(JobsWidth(32));
        }];
        [_cancelBtn cornerCutToCircleWithCornerRadius:self.cancelBtnSize.height / 2];
        @jobs_weakify(self)
        [_cancelBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
//            toast(x.titleForNormalState);
            [self cancelBtnActionForPopView:x];
        }];
    }return _cancelBtn;
}

@end
