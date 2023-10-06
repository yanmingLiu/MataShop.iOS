//
//  MSTransactionRecordModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSTransactionRecordModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *orderID;
@property(nonatomic,copy)NSString *orderState;
@property(nonatomic,copy)NSString *time;

@end

NS_ASSUME_NONNULL_END
