//
//  BaiShaETProjChoiceVenuesView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/22.
//

#import "BaiShaETProjChoiceVenuesView.h"

@interface BaiShaETProjChoiceVenuesView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *btn;

@end

@implementation BaiShaETProjChoiceVenuesView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_choiceVenuesViewOnceToken = 0;
    static_choiceVenuesView = nil;
}

static BaiShaETProjChoiceVenuesView *static_choiceVenuesView = nil;
static dispatch_once_t static_choiceVenuesViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_choiceVenuesViewOnceToken, ^{
        static_choiceVenuesView = BaiShaETProjChoiceVenuesView.new;
    });return static_choiceVenuesView;
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
    if (self.objectBlock) self.objectBlock(@1);
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
    self.titleLab.alpha = 1;
    self.btn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(319), JobsWidth(40));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"选择场馆");
        _titleLab.font = notoSansRegular(14);
        _titleLab.textColor = HEXCOLOR(0x757575);
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(16));
        }];
    }return _titleLab;
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = UIButton.new;
        _btn.userInteractionEnabled = NO;
        _btn.normalTitle = Internationalization(@"請選擇");
        _btn.normalTitleColor = HEXCOLOR(0xC4C4C4);
        _btn.titleFont = notoSansRegular(14);
        _btn.normalImage = JobsIMG(@"向下的箭头");
        [self addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(JobsWidth(-17));
            make.centerY.equalTo(self);
            make.height.mas_equalTo(JobsWidth(14));
        }];
        [_btn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleRight imageTitleSpace:JobsWidth(15.6)];
    }return _btn;
}

@end
