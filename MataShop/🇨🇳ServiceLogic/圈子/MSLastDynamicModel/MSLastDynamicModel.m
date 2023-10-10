//
//  MSLastDynamicModel.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSLastDynamicModel.h"

@implementation MSLastDynamicModel

-(UIImage *)userImage{
    if(!_userImage){
        _userImage = JobsIMG(@"默认头像");
    }return _userImage;
}

-(NSString *)userTitle{
    if(!_userTitle){
        _userTitle = Internationalization(@"暂无数据");
    }return _userTitle;
}

-(NSString *)userSubTitle{
    if(!_userSubTitle){
        _userSubTitle = Internationalization(@"暂无数据");
    }return _userSubTitle;
}

-(NSString *)time{
    if(!_time){
        _time = Internationalization(@"暂无数据");
    }return _time;
}

-(NSString *)praise{
    if(!_praise){
        _praise = Internationalization(@"暂无数据");
    }return _praise;
}

-(NSString *)comments{
    if(!_comments){
        _comments = Internationalization(@"暂无数据");
    }return _comments;
}

@end
