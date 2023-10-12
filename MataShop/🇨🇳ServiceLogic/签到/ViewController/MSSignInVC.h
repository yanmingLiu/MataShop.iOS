//
//  MSSignInVC.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import <EventKit/EventKit.h>// 用来读取，修改和创建日历上的事件
#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

#import "BaseViewController.h"
#import "LunarFormatter.h"
#import "MacroDef_UserDefault.h"

#import "MSSignInHeaderImageView.h"

FOUNDATION_EXTERN NSString * _Nonnull const 日历数组信息;

NS_ASSUME_NONNULL_BEGIN

@interface MSSignInVC : BaseViewController
<
FSCalendarDataSource,
FSCalendarDelegate
>

@end

NS_ASSUME_NONNULL_END
