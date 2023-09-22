//
//  BaiShaProjDoorHeader.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/12.
//

#ifndef BaiShaProjDoorHeader_h
#define BaiShaProjDoorHeader_h

static inline CGSize inputSize(void){
    return CGSizeMake(JobsWidth(343), JobsWidth(52));
}

static inline CGSize inputSize_02(void){
    return CGSizeMake(JobsWidth(303 - 50), JobsWidth(36));
}

/// 登录异常验证

/// 忘记密码

/// 手势登录



/// 登录
#import "MSDoorVC.h"
/// 注册
#import "MSRegisterVC.h"
/// 密码登录
#import "MSPasswordLoginVC.h"
/// 手机短信验证码登录
#import "MSMessageLoginVC.h"

#endif /* BaiShaProjDoorHeader_h */
