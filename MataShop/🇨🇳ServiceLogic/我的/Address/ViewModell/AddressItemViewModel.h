//
//  AddressItemViewModel.h
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressItemViewModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) BOOL isDefault;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *defaultImage;

@end

NS_ASSUME_NONNULL_END
