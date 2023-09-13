//
//  MSPromotionIncentiveModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/13/23.
//

#import "MSPromotionIncentiveModel.h"

@implementation MSPromotionIncentiveDetailModel
@synthesize myIncentiveTypeNameStr = _myIncentiveTypeNameStr;
@synthesize myIncentiveDetailNameStr = _myIncentiveDetailNameStr;
@synthesize userNameStr = _userNameStr;
@synthesize timeStr = _timeStr;

-(void)setMyIncentiveTypeNameStr:(NSString *)myIncentiveTypeNameStr{
    _myIncentiveTypeNameStr = myIncentiveTypeNameStr;
}

-(NSString *)myIncentiveTypeNameStr{
    if(!_myIncentiveTypeNameStr){
        _myIncentiveTypeNameStr = Internationalization(@"暂无数据");
    }return _myIncentiveTypeNameStr;
}

-(void)setMyIncentiveDetailNameStr:(NSString *)myIncentiveDetailNameStr{
    _myIncentiveDetailNameStr = myIncentiveDetailNameStr;
}

-(NSString *)myIncentiveDetailNameStr{
    if(!_myIncentiveDetailNameStr){
        _myIncentiveDetailNameStr = Internationalization(@"暂无数据");
    }return _myIncentiveDetailNameStr;
}

-(void)setUserNameStr:(NSString *)userNameStr{
    _userNameStr = userNameStr;
}

-(NSString *)userNameStr{
    if(!_userNameStr){
        _userNameStr = Internationalization(@"暂无数据");
    }return _userNameStr;
}

-(void)setTimeStr:(NSString *)timeStr{
    _timeStr = timeStr;
}

-(NSString *)timeStr{
    if(!_timeStr){
        _timeStr = Internationalization(@"暂无数据");
    }return _timeStr;
}

@end

@implementation MSPromotionIncentiveModel

@end


