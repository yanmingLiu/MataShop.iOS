//
//  UIButton+UI.m
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "UIButton+UI.h"

@implementation UIButton (UI)
#pragma mark —— 一些功能性
/// RAC 点击事件2次封装
-(RACDisposable *)jobsBtnClickEventBlock:(JobsReturnIDByIDBlock)subscribeNextBlock{
    return [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
        if(subscribeNextBlock) subscribeNextBlock(x);
    }];
}
/// 方法名字符串（带参数、参数之间用"："隔开）、作用对象、参数
-(JobsReturnIDByThreeIDBlock)btnClickActionWithParamarrays{
    // SEL method = @selector(func);//定义一个类方法的指针，selector查找是当前类（包含子类）的方法
    // SEL 用 assign修饰
    @jobs_weakify(self)
    return ^(NSString * _Nonnull methodName,
             id _Nonnull targetObj,
             NSArray * _Nullable paramarrays){
        @jobs_strongify(self)
        return [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
            [NSObject methodName:methodName
                       targetObj:targetObj
                     paramarrays:paramarrays];
        }];
    };
}
/// 方法名字符串（不带参数）、作用对象
-(JobsReturnIDByTwoIDBlock)btnClickActionWithMethodName{
    return ^(NSString * _Nonnull methodName,
             id _Nonnull targetObj){
        SuppressWarcPerformSelectorLeaksWarning(return [self jobsBtnClickEventBlock:^(id data) {
            return [targetObj performSelector:NSSelectorFromString(methodName) withObject:nil];
         }];);
    };
}
/// 代码触发点击调用
-(void)actionByCode{
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}
/// UIButton 上的 image 旋转一定的角度angle
-(void)changeAction:(CGFloat)angle{
    @jobs_weakify(self)
    [UIView animateWithDuration:.3f
                     animations:^{
        @jobs_strongify(self)
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI * angle);/// 最后实际改变位置
    }];
}
/// 当Button不可用的时候，需要做些什么
-(jobsByBOOLBlock _Nonnull)enabledBlock{
    @jobs_weakify(self)
    return ^(BOOL enabled) {
        @jobs_strongify(self)
        self.enabled = enabled;
        self.normalTitleColor = self.enabled ? self.normalTitleColor : HEXCOLOR(0xB0B0B0);
    };
}
#pragma mark —— Common
/// 代码触发点击调用
-(void)titleFont:(UIFont *)font{
    self.titleLabel.font = font;
}

-(void)titleAlignment:(NSTextAlignment)textAlignment{
    self.titleLabel.textAlignment = textAlignment;
}
/// 换行显示
-(void)makeNewLineShows:(BOOL)breakLine{
    self.titleLabel.numberOfLines = !breakLine;
}
#pragma mark —— Normal
// set
-(void)normalImage:(UIImage *)image{
    [self setImage:image forState:UIControlStateNormal];
}

-(void)normalBackgroundImage:(UIImage *)backgroundImage{
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

-(void)normalTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)normalTitleColor:(UIColor *)titleColor{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

-(void)normalAttributedTitle:(NSAttributedString *)title{
    [self setAttributedTitle:title forState:UIControlStateNormal];
}
// get
-(nullable NSString *)titleForNormalState{
    return [self titleForState:UIControlStateNormal];
}

-(nullable NSAttributedString *)attributedTitleForNormalState{
    return [self attributedTitleForState:UIControlStateNormal];
}

-(nullable UIColor *)titleColorForNormalState{
    return [self titleColorForState:UIControlStateNormal];
}

-(nullable UIImage *)imageForNormalState{
    return [self imageForState:UIControlStateNormal];
}

-(nullable UIImage *)backgroundImageForNormalState{
    return [self backgroundImageForState:UIControlStateNormal];
}
#pragma mark —— Selected
// set
-(void)selectedImage:(UIImage *)image{
    [self setImage:image forState:UIControlStateSelected];
}

-(void)selectedBackgroundImage:(UIImage *)backgroundImage{
    [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
}

-(void)selectedTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateSelected];
}

-(void)selectedTitleColor:(UIColor *)titleColor{
    [self setTitleColor:titleColor forState:UIControlStateSelected];
}

-(void)selectedAttributedTitle:(NSAttributedString *)title{
    [self setAttributedTitle:title forState:UIControlStateSelected];
}
// get
-(nullable NSString *)titleForSelectedState{
    return [self titleForState:UIControlStateSelected];
}

-(nullable NSAttributedString *)attributedTitleForSelectedState{
    return [self attributedTitleForState:UIControlStateSelected];
}

-(nullable UIColor *)titleColorForSelectedState{
    return [self titleColorForState:UIControlStateSelected];
}

-(nullable UIImage *)imageForSelectedState{
    return [self imageForState:UIControlStateSelected];
}

-(nullable UIImage *)backgroundImageForSelectedState{
    return [self backgroundImageForState:UIControlStateSelected];
}
@dynamic titleFont;
#pragma mark —— @property(nonatomic,strong)UIFont *titleFont;
-(UIFont *)titleFont{
    UIFont *TitleFont = objc_getAssociatedObject(self, _cmd);
    if (!TitleFont) {
        TitleFont = UIFontWeightBoldSize(12);
        [self setTitleFont:TitleFont];
    }return TitleFont;
}

-(void)setTitleFont:(UIFont *)titleFont{
    self.titleLabel.font = titleFont;
    objc_setAssociatedObject(self,
                             _cmd,
                             titleFont,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic normalImage;
#pragma mark —— @property(nonatomic,strong)UIImage *normalImage;
-(UIImage *)normalImage{
    UIImage *NormalImage = objc_getAssociatedObject(self, _cmd);
    return NormalImage;
}

-(void)setNormalImage:(UIImage *)normalImage{
    if (normalImage) {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    objc_setAssociatedObject(self,
                             _cmd,
                             normalImage,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic normalBackgroundImage;
#pragma mark —— @property(nonatomic,strong)UIImage *normalBackgroundImage;
-(UIImage *)normalBackgroundImage{
    UIImage *NormalBackgroundImage = objc_getAssociatedObject(self, _cmd);
    return NormalBackgroundImage;
}

-(void)setNormalBackgroundImage:(UIImage *)normalBackgroundImage{
    if (normalBackgroundImage) {
        [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
    }
    objc_setAssociatedObject(self,
                             _cmd,
                             normalBackgroundImage,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic normalTitle;
#pragma mark —— @property(nonatomic,strong)NSString *normalTitle;
-(NSString *)normalTitle{
    NSString *NormalTitle = objc_getAssociatedObject(self, _cmd);
    if (!NormalTitle) {
        NormalTitle = Internationalization(@"normalTitle");
        [self setNormalTitle:NormalTitle];
    }return NormalTitle;
}

-(void)setNormalTitle:(NSString *)normalTitle{
    [self setTitle:normalTitle forState:UIControlStateNormal];
    objc_setAssociatedObject(self,
                             _cmd,
                             normalTitle,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic normalTitleColor;
#pragma mark —— @property(nonatomic,strong)UIColor *normalTitleColor;
-(UIColor *)normalTitleColor{
    UIColor *NormalTitleColor = objc_getAssociatedObject(self, _cmd);
    if (!NormalTitleColor) {
        NormalTitleColor = JobsBlackColor;
        [self setNormalTitleColor:NormalTitleColor];
    }return NormalTitleColor;
}

-(void)setNormalTitleColor:(UIColor *)normalTitleColor{
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
    objc_setAssociatedObject(self,
                             _cmd,
                             normalTitleColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic normalAttributedTitle;
#pragma mark —— @property(nonatomic,strong)NSAttributedString *normalAttributedTitle;
-(NSAttributedString *)normalAttributedTitle{
    NSAttributedString *NormalAttributedTitle = objc_getAssociatedObject(self, _cmd);
    return NormalAttributedTitle;
}

-(void)setNormalAttributedTitle:(NSAttributedString *)normalAttributedTitle{
    [self setAttributedTitle:normalAttributedTitle forState:UIControlStateNormal];
    objc_setAssociatedObject(self,
                             _cmd,
                             normalAttributedTitle,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic selectedImage;
#pragma mark —— @property(nonatomic,strong)UIImage *selectedImage;
-(UIImage *)selectedImage{
    UIImage *SelectedImage = objc_getAssociatedObject(self, _cmd);
    return SelectedImage;
}

-(void)setSelectedImage:(UIImage *)selectedImage{
    [self setImage:selectedImage forState:UIControlStateSelected];
    objc_setAssociatedObject(self,
                             _cmd,
                             selectedImage,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic selectedBackgroundImage;
#pragma mark —— @property(nonatomic,strong)UIImage *selectedBackgroundImage;
-(UIImage *)selectedBackgroundImage{
    UIImage *SelectedBackgroundImage = objc_getAssociatedObject(self, _cmd);
    return SelectedBackgroundImage;
}

-(void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage{
    [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
    objc_setAssociatedObject(self,
                             _cmd,
                             selectedBackgroundImage,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic selectedTitle;
#pragma mark —— @property(nonatomic,strong)NSString *selectedTitle;
-(NSString *)selectedTitle{
    NSString *selectedTitle = objc_getAssociatedObject(self, _cmd);
    if (!selectedTitle) {
        selectedTitle = Internationalization(@"selectedTitle");
        [self setSelectedTitle:selectedTitle];
    }return selectedTitle;
}

-(void)setSelectedTitle:(NSString *)selectedTitle{
    [self setTitle:selectedTitle forState:UIControlStateSelected];
    objc_setAssociatedObject(self,
                             _cmd,
                             selectedTitle,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic selectedTitleColor;
#pragma mark —— @property(nonatomic,strong)UIColor *selectedTitleColor;
-(UIColor *)selectedTitleColor{
    UIColor *SelectedTitleColor = objc_getAssociatedObject(self, _cmd);
    return SelectedTitleColor;
}

-(void)setSelectedTitleColor:(UIColor *)selectedTitleColor{
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    objc_setAssociatedObject(self,
                             _cmd,
                             selectedTitleColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic selectedAttributedTitle;
#pragma mark —— @property(nonatomic,strong)NSAttributedString *selectedAttributedTitle;
-(NSAttributedString *)selectedAttributedTitle{
    NSAttributedString *SelectedAttributedTitle = objc_getAssociatedObject(self, _cmd);
    return SelectedAttributedTitle;
}

-(void)setSelectedAttributedTitle:(NSAttributedString *)selectedAttributedTitle{
    [self setAttributedTitle:selectedAttributedTitle forState:UIControlStateSelected];
    objc_setAssociatedObject(self,
                             _cmd,
                             selectedAttributedTitle,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic titleAlignment;
#pragma mark —— @property(nonatomic,assign)NSTextAlignment titleAlignment;
-(NSTextAlignment)titleAlignment{
    NSTextAlignment TitleAlignment = [objc_getAssociatedObject(self, _cmd) NSIntValue];
    return TitleAlignment;
}

-(void)setTitleAlignment:(NSTextAlignment)titleAlignment{
    self.titleLabel.textAlignment = titleAlignment;
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithInteger:titleAlignment],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— BaseProtocol
@dynamic racDisposable;
#pragma mark —— @property(nonatomic,strong)RACDisposable *racDisposable;
-(RACDisposable *)racDisposable{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setRacDisposable:(RACDisposable *)racDisposable{
    objc_setAssociatedObject(self,
                             _cmd,
                             racDisposable,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
