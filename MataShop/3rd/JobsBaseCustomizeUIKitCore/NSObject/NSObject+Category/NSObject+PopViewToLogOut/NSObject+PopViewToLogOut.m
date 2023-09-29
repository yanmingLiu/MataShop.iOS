//
//  NSObject+PopViewToLogOut.m
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import "NSObject+PopViewToLogOut.h"

@implementation NSObject (PopViewToLogOut)
#pragma mark —— @property(nonatomic,strong)UIViewModel *logOutPopupVM;
@dynamic logOutPopupVM;
-(UIViewModel *)logOutPopupVM{
    UIViewModel *LogOutPopupVM = objc_getAssociatedObject(self, _cmd);
    if (!LogOutPopupVM) {
        LogOutPopupVM = UIViewModel.new;
        LogOutPopupVM.textModel.text = Internationalization(@"Confirm to exit ?");
        LogOutPopupVM.textModel.font = UIFontWeightRegularSize(14);
        LogOutPopupVM.textModel.textAlignment = NSTextAlignmentCenter;
        LogOutPopupVM.subTextModel.text = Internationalization(@"");
        LogOutPopupVM.bgCor = UIColor.whiteColor;
        objc_setAssociatedObject(self,
                                 _cmd,
                                 LogOutPopupVM,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return LogOutPopupVM;
}

-(void)setLogOutPopupVM:(UIViewModel *)logOutPopupVM{
    objc_setAssociatedObject(self,
                             _cmd,
                             logOutPopupVM,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)JobsBasePopupView *logOutPopupView;
@dynamic logOutPopupView;
-(JobsBasePopupView *)logOutPopupView{
    JobsBasePopupView *LogOutPopupView = objc_getAssociatedObject(self, _cmd);
    if (!LogOutPopupView) {
        LogOutPopupView = JobsBasePopupView.new;
        LogOutPopupView.size = [JobsBasePopupView viewSizeWithModel:nil];
        [LogOutPopupView richElementsInViewWithModel:self.logOutPopupVM];
        @jobs_weakify(self)
        [LogOutPopupView actionObjectBlock:^(UIButton *data) {
            @jobs_strongify(self)
            if (data.tag == 666) {// 取消
                NSLog(@"手滑了");
            }else if (data.tag == 999){// 确定退出
                [self logOut];
                [WHToast toastSuccessMsg:Internationalization(@"Logout succeeded")];
                extern BOOL ISLogin;
                ISLogin = NO;
                [NSNotificationCenter.defaultCenter postNotificationName:退出登录 object:@(NO)];
            }
            [LogOutPopupView tf_hide];
        }];
        objc_setAssociatedObject(self,
                                 _cmd,
                                 LogOutPopupView,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }return LogOutPopupView;
}

-(void)setLogOutPopupView:(JobsBasePopupView *)logOutPopupView{
    objc_setAssociatedObject(self,
                             _cmd,
                             logOutPopupView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
