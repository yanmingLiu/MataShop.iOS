//
//  MSInputTextFieldLeftView.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSInputTextFieldLeftView.h"

@interface MSInputTextFieldLeftView ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;

@end

@implementation MSInputTextFieldLeftView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_inputTextFieldLeftViewOnceToken = 0;
    static_InputTextFieldLeftView = nil;
}

static MSInputTextFieldLeftView *static_InputTextFieldLeftView = nil;
static dispatch_once_t static_inputTextFieldLeftViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_inputTextFieldLeftViewOnceToken, ^{
        static_InputTextFieldLeftView = MSInputTextFieldLeftView.new;
    });return static_InputTextFieldLeftView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NotificationAdd(self,
                        @selector(languageSwitchNotification:),
                        LanguageSwitchNotification,
                        nil);
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.imageView.alpha = 1;
    self.label.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(32 + 15.35 + 43), JobsWidth(32));
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        _imageView.image = JobsIMG(@"手机号码登录");
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(32), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.left.equalTo(self);
        }];
    }return _imageView;
}

-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.text = Internationalization(@"+86 |");
        _label.font = UIFontWeightRegularSize(JobsWidth(16));
        _label.textColor = JobsGrayColor;
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageView.mas_right).offset(JobsWidth(15.35));
            make.centerY.equalTo(self);
        }];
        [_label makeLabelByShowingType:UILabelShowingType_03];
    }return _label;
}

@end
