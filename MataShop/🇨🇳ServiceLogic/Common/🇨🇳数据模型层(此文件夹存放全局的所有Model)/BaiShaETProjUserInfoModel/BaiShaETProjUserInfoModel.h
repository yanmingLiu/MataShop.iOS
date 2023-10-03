//
//  BaiShaETProjUserInfoModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/10.
//

#import <Foundation/Foundation.h>
#import "JobsObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaiShaETProjUserInfoModel : JobsObject

@property(nonatomic,copy)NSString *account;
@property(nonatomic,copy)NSString *domain;// 域名配置
@property(nonatomic,copy)NSString *email;// 邮箱
@property(nonatomic,copy)NSString *headImg;
@property(nonatomic,copy)NSString *inviteCode;// 邀请码
@property(nonatomic,copy)NSString *name;// 名称
@property(nonatomic,copy)NSString *phone;// 手机号
@property(nonatomic,copy)NSString *qq;
@property(nonatomic,copy)NSString *realName;// 真实姓名
@property(nonatomic,copy)NSString *superiorAccount;// 上级账号
@property(nonatomic,strong)NSNumber *userId;
@property(nonatomic,copy)NSString *webChat;

@end

NS_ASSUME_NONNULL_END
