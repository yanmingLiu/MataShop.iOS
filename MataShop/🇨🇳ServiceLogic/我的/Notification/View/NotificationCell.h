//
//  NotificationCell.h
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import <UIKit/UIKit.h>
#import "NotificationItemViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotificationCell : UITableViewCell
+ (NSString *)reuseIdentifier;

- (void)fill:(NotificationItemViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
