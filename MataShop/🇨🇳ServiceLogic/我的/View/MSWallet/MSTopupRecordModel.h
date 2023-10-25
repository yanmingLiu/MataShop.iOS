//
//  MSTopupRecordModel.h
//  MataShop
//
//  Created by Mac on 2023/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSTopupRecordModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)double money;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *orderState;
@property(nonatomic,copy)NSString *orderID;
@property(nonatomic,copy)NSString *time;
@end

NS_ASSUME_NONNULL_END
