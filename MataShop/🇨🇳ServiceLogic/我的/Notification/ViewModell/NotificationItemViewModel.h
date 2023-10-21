//
//  NotificationItemViewModel.h
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NotificationItemViewModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;

@end

NS_ASSUME_NONNULL_END
