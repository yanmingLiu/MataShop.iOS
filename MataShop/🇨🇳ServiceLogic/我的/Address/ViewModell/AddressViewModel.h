//
//  AddressViewModel.h
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import <Foundation/Foundation.h>
#import "AddressItemViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<AddressItemViewModel *> *datas;

- (void)loadData:(void(^ __nullable)(void))callback;

- (void)addAddress:(void(^ __nullable)(void))callback;


@end

NS_ASSUME_NONNULL_END
