//
//  SceneDelegate.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "NSObject+Extras.h"
#import <UIKit/UIKit.h>

API_AVAILABLE(ios(13.0))

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property(nonatomic,strong)UIWindow *window;
@property(nonatomic,strong)UIWindowScene *windowScene;

@end

#pragma clang diagnostic pop
