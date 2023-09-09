//
//  BaiShaProjDoorHeader.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/12.
//

#ifndef BaiShaProjDoorHeader_h
#define BaiShaProjDoorHeader_h

static inline CGSize inputSize(){
    return CGSizeMake(JobsWidth(343), JobsWidth(52));
}

static inline CGSize inputSize_02(){
    return CGSizeMake(JobsWidth(303 - 50), JobsWidth(36));
}

// 登录异常验证
#import "BaiShaETProjVerifyLoginVC.h"
// 忘记密码
// 注册
#import "BaiShaETProjRegisterVC.h"
// 登录
/// 手势登录
#import "BaiShaETProjGestureLoginVC.h"
/// 账密登录
#import "BaiShaETProjAccPasswordLoginVC.h"

#endif /* BaiShaProjDoorHeader_h */
