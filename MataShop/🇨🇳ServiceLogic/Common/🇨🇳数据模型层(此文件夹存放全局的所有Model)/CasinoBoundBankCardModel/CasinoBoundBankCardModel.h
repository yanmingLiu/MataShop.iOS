//
//  CasinoBoundBankCardModel.h
//  Casino
//
//  Created by Jobs on 2021/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CasinoBoundBankCardModel : NSObject

@property(nonatomic,strong)NSNumber *bankAccount;// 银行卡账号
@property(nonatomic,strong)NSNumber *bankId;// 银行ID
@property(nonatomic,copy)NSString *bankLogo;// 银行LOGO
@property(nonatomic,copy)NSString *bankName;// 银行名称
@property(nonatomic,assign)JobsPayDefaultType defaultCard;// 默认卡，主卡= 1
@property(nonatomic,strong)NSNumber *ID;// 银行卡ID
@property(nonatomic,copy)NSString *realName;// 真实姓名

@end

NS_ASSUME_NONNULL_END
/**
 
 {
     bankAccount = 1234123412341234;
     bankId = 105;
     bankLogo = "/casino-admin/eec26f06-ab2f-453a-9962-45b54d926f4a.file";
     bankName = "\U90ae\U653f\U94f6\U884c";
     defaultCard = 1;
     id = 113;
     realName = Jack;
 }
 
 */
