//
//  MSHomePopupView.m
//  MataShop
//
//  Created by Jobs Hi on 9/14/23.
//

#import "MSHomePopupView.h"

@interface MSHomePopupView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)BaseButton *leftBtn;
@property(nonatomic,strong)BaseButton *rightBtn;
/// Data

@end

@implementation MSHomePopupView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_homePopupViewOnceToken = 0;
    static_homePopupView = nil;
}

static MSHomePopupView *static_homePopupView = nil;
static dispatch_once_t static_homePopupViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_homePopupViewOnceToken, ^{
        static_homePopupView = MSHomePopupView.new;
    });return static_homePopupView;
}

-(instancetype)init{
    if (self = [super init]) {
        
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
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{

}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(328), JobsWidth(392));
}
#pragma mark —— lazyLoad

//c,strong)UILabel *titleLab;
//@property(nonatomic,strong)UITextView *textView;
//@property(nonatomic,strong)UILabel *line;
//@property(nonatomic,strong)BaseButton *leftBtn;
//@property(nonatomic,strong)BaseButton *rightBtn;

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
    }return _titleLab;
}

-(UITextView *)textView{
    if(!_textView){
        _textView = UITextView.new;
    }return _textView;
}

-(UILabel *)line{
    if(!_line){
        _line = UILabel.new;
    }return _line;
}

-(BaseButton *)leftBtn{
    if(!_leftBtn){
        _leftBtn = BaseButton.new;
        _leftBtn.normalTitle = Internationalization(@"关注招聘资讯");
        _leftBtn.normalTitleColor = JobsBlackColor;
        _leftBtn.titleFont = UIFontWeightRegularSize(JobsWidth(16));
        _leftBtn.backgroundColor = HEXCOLOR(0xEAECEF);
        [self addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(140), JobsWidth(40)));
            make.bottom.equalTo(self).offset(JobsWidth(-24));
            make.left.equalTo(self).offset(JobsWidth(14));
        }];
        [_leftBtn cornerCutToCircleWithCornerRadius:JobsWidth(14)];
        [_leftBtn layerBorderCor:JobsCor(@"#EAECEF") andBorderWidth:1];
        @jobs_weakify(self)
        [_leftBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [WHToast toastErrMsg:Internationalization(@"关注招聘资讯")];
        }];
    }return _leftBtn;
}

-(BaseButton *)rightBtn{
    if(!_rightBtn){
        _rightBtn = BaseButton.new;
        _rightBtn.normalTitle = Internationalization(@"进入Mata商城");
        _rightBtn.normalTitleColor = JobsBlackColor;
        _rightBtn.titleFont = UIFontWeightRegularSize(JobsWidth(16));
        _rightBtn.backgroundColor = JobsCor(@"#EA0000");
        [self addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(140), JobsWidth(40)));
            make.bottom.equalTo(self).offset(JobsWidth(-24));
            make.right.equalTo(self).offset(JobsWidth(-14));
        }];
        [_rightBtn cornerCutToCircleWithCornerRadius:JobsWidth(14)];
        @jobs_weakify(self)
        [_rightBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [WHToast toastErrMsg:Internationalization(@"关注招聘资讯")];
        }];
    }return _rightBtn;
}

@end
