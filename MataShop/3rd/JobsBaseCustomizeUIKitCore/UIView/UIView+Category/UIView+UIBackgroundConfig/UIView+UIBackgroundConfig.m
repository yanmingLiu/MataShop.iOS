//
//  UIView+UIBackgroundConfig.m
//  Casino
//
//  Created by Jobs on 2021/12/25.
//

#import "UIView+UIBackgroundConfig.h"

@implementation UIView (UIBackgroundConfig)
#pragma mark —— @property(nonatomic,strong)UIBackgroundConfiguration *backgroundConfig;
@dynamic backgroundConfig;
-(UIBackgroundConfiguration *)backgroundConfig{
    UIBackgroundConfiguration *BackgroundConfig = objc_getAssociatedObject(self,_cmd);
    if (!BackgroundConfig) {
        BackgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooterConfiguration;
        BackgroundConfig.image = JobsIMG(@"设置_背景1");
        BackgroundConfig.backgroundInsets = NSDirectionalEdgeInsetsMake(JobsWidth(3),
                                                                        JobsWidth(15),
                                                                        JobsWidth(3),
                                                                        JobsWidth(15));
        [self setBackgroundConfig:BackgroundConfig];
    }return BackgroundConfig;
}

-(void)setBackgroundConfig:(UIBackgroundConfiguration *)backgroundConfig{
    objc_setAssociatedObject(self,
                             _cmd,
                             backgroundConfig,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end

