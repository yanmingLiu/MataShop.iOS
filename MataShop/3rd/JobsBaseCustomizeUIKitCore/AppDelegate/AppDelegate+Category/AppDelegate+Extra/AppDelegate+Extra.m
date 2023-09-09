//
//  AppDelegate+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate+Extra.h"

@implementation AppDelegate (Extra)
/// 仅仅对数值tabBarTitleMutArr做简单的添加元素并赋值
-(void)addElementByTabBarTitleMutArr:(NSMutableArray *)tabBarTitleMutArr{
    if (tabBarTitleMutArr) {
        [tabBarTitleMutArr addObject:Internationalization(@"首页")];
        [tabBarTitleMutArr addObject:Internationalization(@"游戏")];
        [tabBarTitleMutArr addObject:Internationalization(@"优惠")];
        [tabBarTitleMutArr addObject:Internationalization(@"教程")];
        [tabBarTitleMutArr addObject:Internationalization(@"会员")];
        objc_setAssociatedObject(self,
                                 AppDelegate_Extra_tabBarTitleMutArr,
                                 tabBarTitleMutArr,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle{
    
    NSMutableArray *TabBarTitleMutArr = objc_getAssociatedObject(self, AppDelegate_Extra_tabBarTitleMutArr);
    
    if (TabBarTitleMutArr.count) {
        [TabBarTitleMutArr removeAllObjects];
        [self addElementByTabBarTitleMutArr:TabBarTitleMutArr];
    }
    
    for (JobsTabBarControllerConfig *config in self.configMutArr) {
        NSInteger index = [self.configMutArr indexOfObject:config];
        config.vc.tabBarItem.title = TabBarTitleMutArr[index];
    }
}
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)getAppRootVC{
    NSMutableArray *mutArr = NSMutableArray.array;
    for (JobsTabBarControllerConfig *config in self.configMutArr) {
        [mutArr addObject:config.vc];
    }return mutArr;
}

-(TFPopupParam *)appDelegatePopupParameter{
    TFPopupParam *PopupParameter = TFPopupParam.new;
    PopupParameter.duration = 0.3f;
    PopupParameter.showAnimationDelay = 0.1f;
    PopupParameter.hideAnimationDelay = 0.1f;
    PopupParameter.dragEnable = YES;
    PopupParameter.offset = CGPointMake(0,-JobsTabBarHeightByBottomSafeArea(self.tabBarVC));
    PopupParameter.disuseBackgroundTouchHide = YES;
    PopupParameter.popupSize = [CasinoCustomerServiceView viewSizeWithModel:nil];
    return PopupParameter;
}
static char *AppDelegate_Extra_tabBarVC = "AppDelegate_Extra_tabBarVC";
@dynamic tabBarVC;
#pragma mark —— @property(nonatomic,strong)JobsTabbarVC *tabBarVC;
-(JobsTabbarVC *)tabBarVC{
    JobsTabbarVC *TabBarVC = objc_getAssociatedObject(self, AppDelegate_Extra_tabBarVC);
    if (!TabBarVC) {
        TabBarVC = JobsTabbarVC.new;
        TabBarVC.isAnimationAlert = YES;//OK
        TabBarVC.isPlaySound = YES;
        TabBarVC.isFeedbackGenerator = YES;
        
//        TabBarVC.jumpIndexArr = @[@3];//小标为3的客服模块需要被跳开做另行处理
//        TabBarVC.needLoginArr = @[@1,@2,@4];
//        TabBarVC.noNeedLoginArr = @[@0];// 在某些页面不需要弹出登录，其优先级高于needLoginArr
        
//        TabBarVC.isShakerAnimation = YES;
//        TabBarVC.isOpenScrollTabbar = NO;

        for (JobsTabBarControllerConfig *config in self.configMutArr) {
            [TabBarVC.tabBarControllerConfigMutArr addObject:config];
            [TabBarVC.childVCMutArr addObject:config.vc];
            [self.tabBarTitleMutArr addObject:config.title];
        }
        
        [TabBarVC actionReturnObjectBlock:^id(id data) {
            if ([data isKindOfClass:NSNumber.class]) {
                NSNumber *num = (NSNumber *)data;
                
                BOOL ok = NO;
                for (NSNumber *number in self.tabBarVC.jumpIndexArr) {
                    if (num.unsignedIntegerValue == number.unsignedIntegerValue) {
                        ok = YES;
                        break;
                    }
                }
                if (ok) {
//                    if (self.customerContactModel.customerList.count) {
//                        /// 单例模式防止重复添加
//                        CasinoCustomerServiceView *customerServiceView = CasinoCustomerServiceView.sharedInstance;
//                        [customerServiceView actionObjectBlock:^(id data) {
//                            [customerServiceView tf_hide];
//                        }];
//                        customerServiceView.size = [CasinoCustomerServiceView viewSizeWithModel:self.hotLabelDataMutArr];
//                        [customerServiceView richElementsInViewWithModel:self.hotLabelDataMutArr];
//                        [customerServiceView tf_showSlide:getMainWindow()
//                                                direction:PopupDirectionBottom
//                                               popupParam:self.appDelegatePopupParameter];
//                    }
                }return @(!ok);
            }return @(YES);
        }];
        
        objc_setAssociatedObject(self,
                                 AppDelegate_Extra_tabBarVC,
                                 TabBarVC,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return TabBarVC;
}

-(void)setTabBarVC:(JobsTabbarVC *)tabBarVC{
    objc_setAssociatedObject(self,
                             AppDelegate_Extra_tabBarVC,
                             tabBarVC,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char *AppDelegate_Extra_configMutArr = "AppDelegate_Extra_configMutArr";
@dynamic configMutArr;
#pragma mark —— @property(nonatomic,strong)NSMutableArray <JobsTabBarControllerConfig *>*configMutArr;
-(NSMutableArray<JobsTabBarControllerConfig *> *)configMutArr{
    NSMutableArray *ConfigMutArr = objc_getAssociatedObject(self, AppDelegate_Extra_configMutArr);
    if (!ConfigMutArr) {
        ConfigMutArr = NSMutableArray.array;
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = MSHomeVC.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_home_selected");
            config.imageUnselected = JobsIMG(@"tabbar_home_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = MSMomentsVC.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_game_selected");
            config.imageUnselected = JobsIMG(@"tabbar_game_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = MSOrderVC.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_discount_selected");
            config.imageUnselected = JobsIMG(@"tabbar_discount_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = MSMsgVC.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_tutorial_selected");
            config.imageUnselected = JobsIMG(@"tabbar_tutorial_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = MSMineVC.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_member_selected");
            config.imageUnselected = JobsIMG(@"tabbar_member_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        objc_setAssociatedObject(self,
                                 AppDelegate_Extra_configMutArr,
                                 ConfigMutArr,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return ConfigMutArr;
}

-(void)setConfigMutArr:(NSMutableArray<JobsTabBarControllerConfig *> *)configMutArr{
    objc_setAssociatedObject(self,
                             AppDelegate_Extra_configMutArr,
                             configMutArr,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char *AppDelegate_Extra_tabBarTitleMutArr = "AppDelegate_Extra_tabBarTitleMutArr";
@dynamic tabBarTitleMutArr;
#pragma mark —— #pragma mark —— @property(nonatomic,strong)NSMutableArray <NSString *>*tabBarTitleMutArr;
-(NSMutableArray<NSString *> *)tabBarTitleMutArr{
    NSMutableArray *TabBarTitleMutArr = objc_getAssociatedObject(self, AppDelegate_Extra_tabBarTitleMutArr);
    if (!TabBarTitleMutArr) {
        TabBarTitleMutArr = NSMutableArray.array;
        [self addElementByTabBarTitleMutArr:TabBarTitleMutArr];
    }return TabBarTitleMutArr;
}

-(void)setTabBarTitleMutArr:(NSMutableArray<NSString *> *)tabBarTitleMutArr{
    objc_setAssociatedObject(self,
                             AppDelegate_Extra_tabBarTitleMutArr,
                             tabBarTitleMutArr,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
