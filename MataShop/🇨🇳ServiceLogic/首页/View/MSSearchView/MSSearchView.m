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
@property(nonatomic,strong)ZYTextField *textField;
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
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
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
-(void)textFieldBlock:(ZYTextField *)textField
       textFieldValue:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.requestParams = self.textFieldInputModel;
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
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.leftView = [UIImageView.alloc initWithImage:JobsIMG(@"新首页的搜索放大镜")];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.rightView = self.searchBtn;
        _textField.rightViewMode = UITextFieldViewModeAlways;
        _textField.placeholder = Internationalization(@"搜索关键词");
        _textField.placeholderFont = UIFontWeightRegularSize(14);
        _textField.placeholderColor = JobsGrayColor;
        _textField.size = CGSizeMake(JobsWidth(220 - 80 - 12), JobsWidth(28));
        
        CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
        CGFloat placeholderY = (_textField.size.height - placeholderHeight) / 2;
        CGFloat rightViewY = (_textField.size.height - self.searchBtn.size.height) / 2;
        
        _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(32),// leftView的宽
                                                      placeholderY,// 垂直居中
                                                      [MSSearchView viewSizeWithModel:nil].width - JobsWidth(32 + 52),// 52是self.searchBtn的宽
                                                      JobsWidth(28));//
        _textField.editingRectForBounds = CGRectMake(JobsWidth(32),
                                                     0,
                                                     [MSSearchView viewSizeWithModel:nil].width - JobsWidth(32 + 22 + 5) - self.searchBtn.size.width,// 5 是右边与self.searchBtn的距离
                                                     JobsWidth(28));
        _textField.textRectForBounds = CGRectMake(JobsWidth(32),
                                                  0,
                                                  [MSSearchView viewSizeWithModel:nil].width - JobsWidth(32 + 22 + 5),// 5 是右边与self.searchBtn的距离
                                                  100);// 100 这个值写死，不用管
        _textField.rightViewRectForBounds = CGRectMake(JobsWidth([MSSearchView viewSizeWithModel:nil].width - self.searchBtn.size.width),
                                                       rightViewY,
                                                       self.searchBtn.size.width,
                                                       self.searchBtn.size.height);
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            return YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            [self textFieldBlock:self->_textField
                  textFieldValue:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_textField.size);
            make.right.equalTo(self).offset(JobsWidth(-12));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(12));
        }];
    }return _textField;
}

-(BaseButton *)searchBtn{
    if(!_searchBtn){
        @jobs_weakify(self)
        _searchBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                                   titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:nil
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:Internationalization(@"搜索")
                                                         subTitle:nil
                                                        titleFont:UIFontWeightBoldSize(16)
                                                     subTitleFont:nil
                                                         titleCor:RGB_SAMECOLOR(255)
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:RGBA_COLOR(234, 41, 24, 1)
                                                     imagePadding:JobsWidth(0)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeNone
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(16)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                                  clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            
            JobsShareView *shareView = JobsShareView.new;
            [shareView richElementsInViewWithModel:nil];
            [self popupshowSlideWithView:shareView];
            
            return nil;
        }];
        _searchBtn.size = CGSizeMake(JobsWidth(60), JobsWidth(32));
    }
    return _searchBtn;
}

@end
