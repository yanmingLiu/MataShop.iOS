//
//  DeleteSystemUITabBarButton.m
//  JinXian Finance
//

#import "DeleteSystemUITabBarButton.h"

@implementation DeleteSystemUITabBarButton

+(void)deleteSystemUITabBarButton:(UITabBar *)tabBar{
    
    // 移除之前的4个UITabBarButton
    for (UIView *childView in tabBar.subviews) {
        
        if ([childView isKindOfClass:[UIControl class]]) {//UITabBarButton
            
            [childView removeFromSuperview];
        }
    }
    
}

@end
