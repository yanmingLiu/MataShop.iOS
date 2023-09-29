//
//  UIViewController+BaseNavigationBar.m
//  UBallLive
//
//  Created by Jobs on 2020/10/21.
//

#import "UIViewController+BaseNavigationBar.h"

@implementation UIViewController (BaseNavigationBar)

- (void)gotoback{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES
                                 completion:nil];
    }
}
#pragma mark —— @property(nonatomic,strong)NavigationBar *navigationBar;
@dynamic navigationBar;
-(BaseNavigationBar *)navigationBar{
    BaseNavigationBar *NavBar = objc_getAssociatedObject(self, _cmd);
    if (!NavBar) {
        NavBar = BaseNavigationBar.new;
        //优先级:背景图 > 背景色
        NavBar.backgroundColor = self.bgCor;
        [NavBar setBackgroundImage:self.bgImage
                     forBarMetrics:UIBarMetricsDefault];//仅仅是 navigationBar 背景
        NavBar.titleTextAttributes = @{
            NSForegroundColorAttributeName:self.foregroundColorAttributeNameCor,
            NSShadowAttributeName:self.shadow,
            NSFontAttributeName:self.fontAttributeName
        };//设置导航上的title显示样式
        [NavBar setBarTintColor:JobsRedColor];//一般的业务是全局设置，因为一个App里面只有一个主题
        NavBar.tintColor = JobsBlackColor;//系统的组件着色（返回按钮——箭头图标 和 上面的字）
        NavBar.items = @[self.navItem];

        NavBar.translucent = self.isBarTranslucent;
        NavBar.hidden = self.isHiddenNavigationBar;
        [self.view addSubview:NavBar];
        [NavBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_offset(self.jobsNavigationBarHeight);
        }];
        [self setNavigationBar:NavBar];
    }return NavBar;
}

-(void)setNavigationBar:(BaseNavigationBar *)navigationBar{
    objc_setAssociatedObject(self,
                             _cmd,
                             navigationBar,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIBarButtonItem *leftBarButtonItem_back;
@dynamic leftBarButtonItem_back;
-(UIBarButtonItem *)leftBarButtonItem_back{
    UIBarButtonItem *LeftBarButtonItem_back = objc_getAssociatedObject(self, _cmd);
    if (!LeftBarButtonItem_back) {
        if(self.navigationController.viewControllers.count > 1){
            NSString *imageName = self.gk_backStyle == GKNavigationBarBackStyleBlack ? @"btn_back_black" : @"btn_back_white";
            UIImage *backImage = JobsBuddleIMG(nil,
                                            @"Frameworks/GKNavigationBar.framework/GKNavigationBar",
                                            nil,
                                            imageName);
            LeftBarButtonItem_back = [UIBarButtonItem.alloc initWithImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(gotoback)];
            
            [self setLeftBarButtonItem_back:LeftBarButtonItem_back];
        }
    }return LeftBarButtonItem_back;
}

- (void)setLeftBarButtonItem_back:(UIBarButtonItem *)leftBarButtonItem_back{
    objc_setAssociatedObject(self,
                             _cmd,
                             leftBarButtonItem_back,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIColor *bgCor;
@dynamic bgCor;
-(UIColor *)bgCor{
    UIColor *BgCor = objc_getAssociatedObject(self, _cmd);
    if (!BgCor) {
        BgCor = JobsLightGrayColor;
        [self setBgCor:BgCor];
    }return BgCor;
}

-(void)setBgCor:(UIColor *)bgCor{
    objc_setAssociatedObject(self,
                             _cmd,
                             bgCor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)CGFloat jobsNavigationBarHeight;
@dynamic jobsNavigationBarHeight;
-(CGFloat)jobsNavigationBarHeight{
    CGFloat jobsNavigationBarHeight = [objc_getAssociatedObject(self, _cmd) floatValue];
    if (jobsNavigationBarHeight == 0) {
        jobsNavigationBarHeight = JobsNavigationBarAndStatusBarHeight(nil);
        [self setJobsNavigationBarHeight:jobsNavigationBarHeight];
    }return jobsNavigationBarHeight;
}

-(void)setJobsNavigationBarHeight:(CGFloat)jobsNavigationBarHeight{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithFloat:jobsNavigationBarHeight],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)BOOL isHiddenNavigationBar
@dynamic isHiddenNavigationBar;
-(BOOL)isHiddenNavigationBar{//默认不显示
    BOOL IsHiddenNavigationBar = [objc_getAssociatedObject(self, _cmd) boolValue];
    return IsHiddenNavigationBar;
}

-(void)setIsHiddenNavigationBar:(BOOL)isHiddenNavigationBar{
    [self.navigationController setNavigationBarHidden:isHiddenNavigationBar animated:true];
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithBool:isHiddenNavigationBar],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)BOOL isBarTranslucent;
@dynamic isBarTranslucent;
-(BOOL)isBarTranslucent{//默认
    BOOL IsBarTranslucent = [objc_getAssociatedObject(self, _cmd) boolValue];
    return IsBarTranslucent;
}

-(void)setIsBarTranslucent:(BOOL)isBarTranslucent{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithBool:isBarTranslucent],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSShadow *shadow;
@dynamic shadow;
-(NSShadow *)shadow{
    NSShadow *Shadow = objc_getAssociatedObject(self, _cmd);
    if (!Shadow) {
        Shadow = NSShadow.new;
        Shadow.shadowColor = self.shadowCor;
        Shadow.shadowOffset = CGSizeZero;
        [self setShadow:Shadow];
    }return Shadow;
}

-(void)setShadow:(NSShadow *)shadow{
    objc_setAssociatedObject(self,
                             _cmd,
                             shadow,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UINavigationItem *navItem;
@dynamic navItem;
-(UINavigationItem *)navItem{
    UINavigationItem *NavItem = objc_getAssociatedObject(self, _cmd);
    if (!NavItem) {
        NavItem = UINavigationItem.new;
        NavItem.title = self.title;
        NavItem.leftBarButtonItem = self.leftBarButtonItem_back;
        [self setNavItem:NavItem];
    }return NavItem;
}

-(void)setNavItem:(UINavigationItem *)navItem{
    objc_setAssociatedObject(self,
                             _cmd,
                             navItem,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIColor *foregroundColorAttributeNameCor;
@dynamic foregroundColorAttributeNameCor;
-(UIColor *)foregroundColorAttributeNameCor{
    UIColor *ForegroundColorAttributeNameCor = objc_getAssociatedObject(self, _cmd);
    if (!ForegroundColorAttributeNameCor) {
        ForegroundColorAttributeNameCor = JobsGreenColor;//JobsBlackColor;
        [self setForegroundColorAttributeNameCor:ForegroundColorAttributeNameCor];
    }return ForegroundColorAttributeNameCor;
}

-(void)setForegroundColorAttributeNameCor:(UIColor *)foregroundColorAttributeNameCor{
    objc_setAssociatedObject(self,
                             _cmd,
                             foregroundColorAttributeNameCor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIFont *fontAttributeName;
@dynamic fontAttributeName;
-(UIFont *)fontAttributeName{
    UIFont *FontAttributeName = objc_getAssociatedObject(self, _cmd);
    if (!FontAttributeName) {
        FontAttributeName = JobsFontRegular(18);
        [self setFontAttributeName:FontAttributeName];
    }return FontAttributeName;
}

-(void)setFontAttributeName:(UIFont *)fontAttributeName{
    objc_setAssociatedObject(self,
                             _cmd,
                             fontAttributeName,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIColor *tintColor;
@dynamic tintColor;
-(UIColor *)tintColor{
    UIColor *TintColor = objc_getAssociatedObject(self, _cmd);
    if (!TintColor) {
        TintColor = JobsGreenColor;
        [self setTintColor:TintColor];
    }return TintColor;
}

-(void)setTintColor:(UIColor *)tintColor{
    objc_setAssociatedObject(self,
                             _cmd,
                             tintColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIColor *barTintColor;
@dynamic barTintColor;
-(UIColor *)barTintColor{
    UIColor *BarTintColor = objc_getAssociatedObject(self, _cmd);
    if (!BarTintColor) {
        BarTintColor = JobsGreenColor;
        [self setBarTintColor:BarTintColor];
    }return BarTintColor;
}

-(void)setBarTintColor:(UIColor *)barTintColor{
    objc_setAssociatedObject(self,
                             _cmd,
                             barTintColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSString *title;
@dynamic title;
-(NSString *)title{
    NSString *Title = objc_getAssociatedObject(self, _cmd);
    return Title;
}

-(void)setTitle:(NSString *)title{
    objc_setAssociatedObject(self,
                             _cmd,
                             title,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIColor *shadowCor;
@dynamic shadowCor;
-(UIColor *)shadowCor{
    UIColor *ShadowCor = objc_getAssociatedObject(self, _cmd);
    if (!ShadowCor) {
        ShadowCor = RGBA_COLOR(0,
                              0,
                              0,
                              0.8);
        [self setShadowCor:ShadowCor];
    }return ShadowCor;
}

-(void)setShadowCor:(UIColor *)shadowCor{
    objc_setAssociatedObject(self,
                             _cmd,
                             shadowCor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
