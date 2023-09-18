//
//  MSRedEnvelopeDetailModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/18/23.
//

#import "MSRedEnvelopeDetailModel.h"

@implementation MSRedEnvelopeDetailModel

@synthesize amountValue = _amountValue;
@synthesize timeValue = _timeValue;

-(void)setAmountValue:(NSString *)amountValue{
    _amountValue = amountValue;
}

-(NSString *)amountValue{
    if(!_amountValue){
        _amountValue = Internationalization(@"暂无数据");
    }return _amountValue;
}

-(void)setTimeValue:(NSString *)timeValue{
    _timeValue = timeValue;
}

-(NSString *)timeValue{
    if(!_timeValue){
        _timeValue = Internationalization(@"暂无数据");
    }return _timeValue;
}

@end
