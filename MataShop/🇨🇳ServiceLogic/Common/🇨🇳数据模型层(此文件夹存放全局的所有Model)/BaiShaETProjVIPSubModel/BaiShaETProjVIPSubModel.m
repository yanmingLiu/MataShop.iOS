//
//  BaiShaETProjVIPSubModel.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/12.
//

#import "BaiShaETProjVIPSubModel.h"

@implementation BaiShaETProjVIPSubModel

-(NSString *)vipName{
    if (!_vipName) {
        switch (self.rankClass) {
            case JobsRankClass_VIP0:{
                _vipName = Internationalization(@"VIP 0");
            }break;
            case JobsRankClass_VIP1:{
                _vipName = Internationalization(@"VIP 1");
            }break;
            case JobsRankClass_VIP2:{
                _vipName = Internationalization(@"VIP 2");
            }break;
            case JobsRankClass_VIP3:{
                _vipName = Internationalization(@"VIP 3");
            }break;
            case JobsRankClass_VIP4:{
                _vipName = Internationalization(@"VIP 4");
            }break;
            case JobsRankClass_VIP5:{
                _vipName = Internationalization(@"VIP 5");
            }break;
            case JobsRankClass_VIP6:{
                _vipName = Internationalization(@"VIP 6");
            }break;
            case JobsRankClass_VIP7:{
                _vipName = Internationalization(@"VIP 7");
            }break;
            case JobsRankClass_VIP8:{
                _vipName = Internationalization(@"VIP 8");
            }break;
            case JobsRankClass_VIP9:{
                _vipName = Internationalization(@"VIP 9");
            }break;
            case JobsRankClass_VIP10:{
                _vipName = Internationalization(@"VIP 10");
            }break;
                
            default:
                _vipName = Internationalization(@"VIP ?");
                break;
        }
        
    }return _vipName;
}

@end
