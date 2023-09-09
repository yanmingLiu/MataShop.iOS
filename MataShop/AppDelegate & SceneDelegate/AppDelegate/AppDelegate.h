//
//  AppDelegate.h
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "JobsTabbarVC.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
// UI
@property(nonatomic,strong)UIWindow *window;//仅仅为了iOS 13 版本向下兼容而存在
// Data
@property(readonly,strong)NSPersistentCloudKitContainer *persistentContainer;
@property(nonatomic,assign)BOOL allowOrentitaionRotation;

-(void)saveContext;

@end

#pragma clang diagnostic pop
