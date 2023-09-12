//
//  MSInterestSettleRecordModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/13/23.
//

#import "MSInterestSettleRecordModel.h"

@implementation MSInterestSettleRecordModel

@synthesize prodName = _prodName;
@synthesize prodPrice = _prodPrice;
@synthesize prodDailyRate = _prodDailyRate;
@synthesize prodInterestSettledYesterday = _prodInterestSettledYesterday;
@synthesize prodInterestSettledAll = _prodInterestSettledAll;
@synthesize prodExpectedIncome = _prodExpectedIncome;
@synthesize prodEarnedIncome = _prodEarnedIncome;
@synthesize prodAllIncome = _prodAllIncome;
@synthesize prodTimeTips = _prodTimeTips;

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

-(void)setProdInterestSettledYesterday:(NSString *)prodInterestSettledYesterday{
    _prodInterestSettledYesterday = prodInterestSettledYesterday;
}

-(NSString *)prodInterestSettledYesterday{
    if(!_prodInterestSettledYesterday){
        _prodInterestSettledYesterday = Internationalization(@"暂无数据");
    }return _prodInterestSettledYesterday;
}

-(void)setProdInterestSettledAll:(NSString *)prodInterestSettledAll{
    _prodInterestSettledAll = prodInterestSettledAll;
}

-(NSString *)prodInterestSettledAll{
    if(!_prodInterestSettledAll){
        _prodInterestSettledAll = Internationalization(@"暂无数据");
    }return _prodInterestSettledAll;
}

-(void)setProdExpectedIncome:(NSString *)prodExpectedIncome{
    _prodExpectedIncome = prodExpectedIncome;
}

-(NSString *)prodExpectedIncome{
    if(!_prodExpectedIncome){
        _prodExpectedIncome = Internationalization(@"暂无数据");
    }return _prodExpectedIncome;
}

-(void)setProdEarnedIncome:(NSString *)prodEarnedIncome{
    _prodEarnedIncome = prodEarnedIncome;
}

-(NSString *)prodEarnedIncome{
    if(!_prodEarnedIncome){
        _prodEarnedIncome = Internationalization(@"暂无数据");
    }return _prodEarnedIncome;
}

-(void)setProdAllIncome:(NSString *)prodAllIncome{
    _prodAllIncome = prodAllIncome;
}

-(NSString *)prodAllIncome{
    if(!_prodAllIncome){
        _prodAllIncome = Internationalization(@"暂无数据");
    }return _prodAllIncome;
}

-(void)setProdTimeTips:(NSString *)prodTimeTips{
    _prodTimeTips = prodTimeTips;
}

-(NSString *)prodTimeTips{
    if(!_prodTimeTips){
        _prodTimeTips = Internationalization(@"暂无数据");
    }return _prodTimeTips;
}

@end
