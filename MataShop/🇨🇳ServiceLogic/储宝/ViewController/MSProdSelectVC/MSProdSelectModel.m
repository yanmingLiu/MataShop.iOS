//
//  MSProdSelectModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSProdSelectModel.h"

@implementation MSProdSelectModel

@synthesize prodName = _prodName;
@synthesize prodPrice = _prodPrice;
@synthesize prodDailyRate = _prodDailyRate;
@synthesize prodNum = _prodNum;
@synthesize prodTips = _prodTips;

-(void)setProdName:(NSString *)prodName{
    _prodName = prodName;
}

-(NSString *)prodName{
    if(!_prodName){
        _prodName = Internationalization(@"暂无数据");
    }return _prodName;
}

-(void)setProdPrice:(NSString *)prodPrice{
    _prodPrice = prodPrice;
}

-(NSString *)prodPrice{
    if(!_prodPrice){
        _prodPrice = Internationalization(@"暂无数据");
    }return _prodPrice;
}

-(void)setProdDailyRate:(NSString *)prodDailyRate{
    _prodDailyRate = prodDailyRate;
}

-(NSString *)prodDailyRate{
    if(!_prodDailyRate){
        _prodDailyRate = Internationalization(@"暂无数据");
    }return _prodDailyRate;
}

-(void)setProdNum:(NSString *)prodNum{
    _prodNum = prodNum;
}

-(NSString *)prodNum{
    if(!_prodNum){
        _prodNum = Internationalization(@"暂无数据");
    }return _prodNum;
}

-(void)setProdTips:(NSString *)prodTips{
    _prodTips = prodTips;
}

-(NSString *)prodTips{
    if(!_prodTips){
        _prodTips = Internationalization(@"暂无数据");
    }return _prodTips;
}


@end
