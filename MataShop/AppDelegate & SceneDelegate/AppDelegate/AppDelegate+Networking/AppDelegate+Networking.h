//
//  AppDelegate+Networking.h
//  Casino
//
//  Created by Jobs on 2021/12/24.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Networking)
/// 获取客服联系方式
-(void)appDelegate_getCustomerContact;
/// 获取文件服务器地址
-(void)appDelegate_getDownloadStationGetFileServerUrl;
/// 检查平台维护开关
-(void)checkPlatformMaintenanceSwitch;

@end

NS_ASSUME_NONNULL_END
