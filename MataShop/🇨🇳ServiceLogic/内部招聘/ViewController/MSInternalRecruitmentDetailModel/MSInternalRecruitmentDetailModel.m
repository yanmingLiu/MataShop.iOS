//
//  MSInternalRecruitmentDetailModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "MSInternalRecruitmentDetailModel.h"

@implementation MSInternalRecruitmentDetailModel

@synthesize titleName = _titleName;
@synthesize titleValue = _titleValue;
@synthesize rate1 = _rate1;
@synthesize rate2 = _rate2;
@synthesize value2 = _value2;
@synthesize rate3 = _rate3;
@synthesize rate4 = _rate4;
@synthesize value3 = _value3;
@synthesize value4 = _value4;

-(void)setTitleName:(NSString *)titleName{
    _titleName = titleName;
}

-(NSString *)titleName{
    if(!_titleName){
        _titleName = Internationalization(@"暂无数据");
    }return _titleName;
}

-(void)setTitleValue:(NSString *)titleValue{
    _titleValue = titleValue;
}

-(NSString *)titleValue{
    if(!_titleValue){
        _titleValue = Internationalization(@"暂无数据");
    }return _titleValue;
}

-(void)setRate1:(NSString *)rate1{
    _rate1 = rate1;
}

-(NSString *)rate1{
    if(!_rate1){
        _rate1 = Internationalization(@"暂无数据");
    }return _rate1;
}

-(void)setRate2:(NSString *)rate2{
    _rate2 = rate2;
}

-(NSString *)rate2{
    if(!_rate2){
        _rate2 = Internationalization(@"暂无数据");
    }return _rate2;
}

-(void)setValue2:(NSString *)value2{
    _value2 = value2;
}

-(NSString *)value2{
    if(!_value2){
        _value2 = Internationalization(@"暂无数据");
    }return _value2;
}

-(void)setRate3:(NSString *)rate3{
    _rate3 = rate3;
}

-(NSString *)rate3{
    if(!_rate3){
        _rate3 = Internationalization(@"暂无数据");
    }return _rate3;
}

-(void)setRate4:(NSString *)rate4{
    _rate4 = rate4;
}

-(NSString *)rate4{
    if(!_rate4){
        _rate4 = Internationalization(@"暂无数据");
    }return _rate4;
}

-(void)setValue3:(NSString *)value3{
    _value3 = value3;
}

-(NSString *)value3{
    if(!_value3){
        _value3 = Internationalization(@"暂无数据");
    }return _value3;
}

-(void)setValue4:(NSString *)value4{
    _value4 = value4;
}

-(NSString *)value4{
    if(!_value4){
        _value4 = Internationalization(@"暂无数据");
    }return _value4;
}

@end
