//
//  MSOrderModel.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSOrderModel.h"

@implementation MSOrderModel

-(NSString *)shopName{
    if(!_shopName){
        _shopName = Internationalization(@"暂无数据");
    }return _shopName;
}

-(NSString *)goodsTitle{
    if(!_goodsTitle){
        _goodsTitle = Internationalization(@"暂无数据");
    }return _goodsTitle;
}

-(NSString *)goodsSubTitle{
    if(!_goodsSubTitle){
        _goodsSubTitle = Internationalization(@"暂无数据");
    }return _goodsSubTitle;
}

-(NSString *)orderTime{
    if(!_orderTime){
        _orderTime = Internationalization(@"暂无数据");
    }return _orderTime;
}

-(NSString *)orderAmount{
    if(!_orderAmount){
        _orderAmount = Internationalization(@"暂无数据");
    }return _orderAmount;
}

@end
