//
//  AppDelegate+Networking.m
//  Casino
//
//  Created by Jobs on 2021/12/24.
//

#import "AppDelegate+Networking.h"

@implementation AppDelegate (Networking)
/// 获取文件服务器地址
-(void)appDelegate_getDownloadStationGetFileServerUrl{
//    [self getDownloadStationGetFileServerUrl:^(DDResponseModel *data) {
//        DDUserModel *userModel = self.readUserInfo;
//        userModel.resourcesAddress = data.data;
//        [self saveUserInfo:userModel];
//    }];
}
/// 检查平台维护开关
-(void)checkPlatformMaintenanceSwitch{
//    @jobs_weakify(self)
//    [self checkPlatformMaintenanceSwitch:^(DDResponseModel *data) {
//        @jobs_strongify(self)
//        CasinoPlatformMaintenanceModel *model = [CasinoPlatformMaintenanceModel mj_objectWithKeyValues:data.data];
//        extern AppDelegate *appDelegate;
//        if (model.onOff) {
//            UIViewModel *viewModel = [self configViewModelWithTitle:@"System Maintenance"
//                                                           subTitle:Internationalization(@"")];
//            [appDelegate.tabBarVC comingToPresentVC:[BaseNavigationVC.alloc initWithRootViewController:CasinoPlatformMaintenanceVC.new]
//                                      requestParams:viewModel];
//        }
//    }];
}

@end
