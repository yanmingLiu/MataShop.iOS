//
//  DDNetworkingAPI+Test.h
//  Casino
//
//  Created by Jobs on 2021/12/14.
//

#import "DDNetworkingAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface DDNetworkingAPI (Test)
#pragma mark —— 测试
/// 批量发送分润MQ
+(void)testSendMqGET:(id _Nullable)parameters
        successBlock:(jobsByIDBlock _Nullable)successBlock
        failureBlock:(jobsByIDBlock _Nullable)failureBlock;
/// 发送消息到TG机器人
+(void)testSendMsgToTelegramBotGET:(id _Nullable)parameters
                      successBlock:(jobsByIDBlock _Nullable)successBlock
                      failureBlock:(jobsByIDBlock _Nullable)failureBlock;

@end

NS_ASSUME_NONNULL_END
