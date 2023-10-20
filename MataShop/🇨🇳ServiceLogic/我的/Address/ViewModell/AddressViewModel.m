//
//  AddressViewModel.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "AddressViewModel.h"

@implementation AddressViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [NSMutableArray array];
        [self setupData];
    }
    return self;
}

- (void)setupData {
    for (int i = 0; i < 4; i++) {
        AddressItemViewModel *m = [[AddressItemViewModel alloc] init];
        m.id = i;
        m.isDefault = i == 0;
        m.name = @"张三";
        m.address = @"四川省成都市武侯区天府二街蜀都中心一期二号楼504室内";
        m.phone = @"15577778888";
        [self.datas addObject:m];
    }
}

- (void)loadData:(void(^ __nullable)(void))callback {

}

- (void)addAddress:(void(^ __nullable)(void))callback {
    AddressItemViewModel *m = [[AddressItemViewModel alloc] init];
    m.id = self.datas.count;
    m.isDefault = NO;
    m.name = @"张三";
    m.address = @"四川省成都市武侯区天府二街蜀都中心一期二号楼504室内";
    m.phone = @"15577778888";
    [self.datas addObject:m];
    callback ? callback () : nil;
}

@end
