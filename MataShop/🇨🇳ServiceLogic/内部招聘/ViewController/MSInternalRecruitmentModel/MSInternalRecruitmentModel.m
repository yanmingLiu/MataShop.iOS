//
//  MSInternalRecruitmentModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "MSInternalRecruitmentModel.h"

@implementation MSInternalRecruitmentDetailModel

@synthesize title = _title;
@synthesize value = _value;

-(void)setTitle:(NSString *)title{
    _title = title;
}

-(NSString *)title{
    if(!_title){
        _title = Internationalization(@"暂无数据");
    }return _title;
}

-(void)setValue:(NSString *)value{
    _value = value;
}

-(NSString *)value{
    if(!_value){
        _value = Internationalization(@"暂无数据");
    }return _value;
}

@end

@implementation MSInternalRecruitmentModel

@synthesize titleName = _titleName;
/// 职位名称
-(void)setTitleName:(NSString *)titleName{
    _titleName = titleName;
}

-(NSString *)titleName{
    if(!_titleName){
        _titleName = Internationalization(@"暂无数据");
    }return _titleName;
}

@end
