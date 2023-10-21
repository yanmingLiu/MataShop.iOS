//
//  NotificationViewModel.h
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import <Foundation/Foundation.h>
#import "NotificationItemViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotificationViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<NotificationItemViewModel *> *datas;

- (void)loadData:(void(^ __nullable)(void))callback;

- (void)loadMoreData:(void(^ __nullable)(void))callback;

@end

NS_ASSUME_NONNULL_END
