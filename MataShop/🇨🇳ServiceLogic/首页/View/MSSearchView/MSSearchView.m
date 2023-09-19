//
//  MSSearchView.m
//  MataShop
//
//  Created by Jobs Hi on 9/14/23.
//

#import "MSSearchView.h"

@interface MSSearchView ()
/// UI
@property(nonatomic,strong)BaseButton *searchBtn;
@property(nonatomic,strong)JobsMagicTextField *textField;
/// Data

@end

@implementation MSSearchView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_searchViewOnceToken = 0;
    static_searchView = nil;
}

static MSSearchView *static_searchView = nil;
static dispatch_once_t static_searchViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_searchViewOnceToken, ^{
        static_searchView = MSSearchView.new;
    });return static_searchView;
}

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
//        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.objBindingParams = self.textFieldInputModel;
//
//    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.textField.alpha = 1;
    self.searchBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(220), JobsWidth(44));
}
#pragma mark —— lazyLoad
-(JobsMagicTextField *)textField{
    if (!_textField) {
        _textField = JobsMagicTextField.new;
        _textField.delegate = self;
        _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeDefault;
//        _textField.leftView = [UIImageView.alloc initWithImage:JobsIMG(@"搜索放大镜")];
        _textField.leftView = [UIImageView.alloc initWithImage:JobsIMG(@"新首页的搜索放大镜")];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.leftViewOffsetX = JobsWidth(0);
        _textField.placeholdAnimationable = NO;
        _textField.offset = JobsWidth(24);
        _textField.placeholder = Internationalization(@"        搜索关键词");
        _textField.placeholderColor = JobsGrayColor;
        _textField.placeholderFont = UIFontWeightRegularSize(14);
        @jobs_weakify(self)
        [[_textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//            @jobs_strongify(self)
            return YES;
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            NSLog(@"MMM = %@",x);
            [self block:self->_textField
                  value:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(220 - 80 - 12), JobsWidth(28)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(12));
        }];
    }return _textField;
}

-(BaseButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = BaseButton.new;
        [_searchBtn handelAdjustsImageWhenHighlighted];
        _searchBtn.normalTitle = Internationalization(@"搜索");
//        _searchBtn.backgroundColor = RGBA_COLOR(255, 231, 18, 1);
        _searchBtn.backgroundColor = RGBA_COLOR(234, 41, 24, 1);
//        _searchBtn.normalTitleColor = RGBA_COLOR(20, 17, 38, 1);
        _searchBtn.normalTitleColor = RGB_SAMECOLOR(255);
        _searchBtn.titleFont = UIFontWeightBoldSize(JobsWidth(16));
        [_searchBtn makeBtnLabelByShowingType:UILabelShowingType_01];
        @jobs_weakify(self)
        [_searchBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
//            [WHToast toastErrMsg:Internationalization(@"获取节日事件需要权限呀大宝贝!")];
            [self forceComingToPushVC:MSInternalRecruitmentVC.new requestParams:nil];
        }];
        [self addSubview:_searchBtn];
        [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(36)));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(60), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-2));
        }];
        [_searchBtn cornerCutToCircleWithCornerRadius:JobsWidth(18)];
    }return _searchBtn;
}

@end
