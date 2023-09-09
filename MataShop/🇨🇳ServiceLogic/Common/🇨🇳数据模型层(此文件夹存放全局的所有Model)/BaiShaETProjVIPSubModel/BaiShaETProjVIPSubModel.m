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
            case RankClass_current:{
                _vipName = Internationalization(@"VIP ?");
            }break;
            case RankClass_VIP0:{
                _vipName = Internationalization(@"VIP 0");
            }break;
            case RankClass_VIP1:{
                _vipName = Internationalization(@"VIP 1");
            }break;
            case RankClass_VIP2:{
                _vipName = Internationalization(@"VIP 2");
            }break;
            case RankClass_VIP3:{
                _vipName = Internationalization(@"VIP 3");
            }break;
            case RankClass_VIP4:{
                _vipName = Internationalization(@"VIP 4");
            }break;
            case RankClass_VIP5:{
                _vipName = Internationalization(@"VIP 5");
            }break;
            case RankClass_VIP6:{
                _vipName = Internationalization(@"VIP 6");
            }break;
            case RankClass_VIP7:{
                _vipName = Internationalization(@"VIP 7");
            }break;
            case RankClass_VIP8:{
                _vipName = Internationalization(@"VIP 8");
            }break;
            case RankClass_VIP9:{
                _vipName = Internationalization(@"VIP 9");
            }break;
            case RankClass_VIP10:{
                _vipName = Internationalization(@"VIP 10");
            }break;
                
            default:
                _vipName = Internationalization(@"VIP ?");
                break;
        }
        
    }return _vipName;
}

@end
