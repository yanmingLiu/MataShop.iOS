//
//  AddressItemViewModel.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "AddressItemViewModel.h"

@implementation AddressItemViewModel


- (NSString *)defaultImage {
    return self.isDefault ? @"btn_selected_s" : @"btn_selected_n";
}

@end
