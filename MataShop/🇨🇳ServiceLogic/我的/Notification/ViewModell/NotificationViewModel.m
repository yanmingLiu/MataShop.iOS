//
//  NotificationViewModel.m
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "NotificationViewModel.h"

@implementation NotificationViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [NSMutableArray array];
    }
    return self;
}

- (void)loadData:(void(^ __nullable)(void))callback {
    [self.datas removeAllObjects];
    for (int i = 0; i < 2; i++) {
        NotificationItemViewModel *m = [[NotificationItemViewModel alloc] init];
        m.id = i;
        m.title = @"消息标题";
        m.content = @"这里是用户协议的具体内容，这里是用户协议的具 体内容，这里是用户协议的具体内容，这里是用户 协议的具体内容，这里是用户协议的具体内容，这 里是用户协议的具体内容，这里是用户协议的具体 内容，这里是用户协议的具体内容，这里是用户协 议的具体内容。";
        [self.datas addObject:m];
    }
    callback ? callback() : nil;
}

- (void)loadMoreData:(void(^ __nullable)(void))callback {
    for (int i = 0; i < 3; i++) {
        NotificationItemViewModel *m = [[NotificationItemViewModel alloc] init];
        m.id = i;
        m.title = @"消息标题";
        m.content = @"这里是用户协议的具体内容，这里是用户协议的具 体内容，这里是用户协议的具体内容，这里是用户 协议的具体内容，这里是用户协议的具体内容，这 里是用户协议的具体内容，这里是用户协议的具体 内容，这里是用户协议的具体内容，这里是用户协 议的具体内容。";
        [self.datas addObject:m];
    }
    callback ? callback() : nil;
}

@end
