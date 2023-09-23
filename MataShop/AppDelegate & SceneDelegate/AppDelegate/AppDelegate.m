//
//  AppDelegate.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "AppDelegate.h"

#import "AppDelegate+Extra.h"
#import "AppDelegate+UIApplicationDelegate.h"
#import "AppDelegate+Networking.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

AppDelegate *appDelegate;
@interface AppDelegate ()

@end

@implementation AppDelegate

-(instancetype)init{
    if (self = [super init]) {
        appDelegate = self;
        NSLog(@"%@",JobsLocalFunc);
//        [UIFont getAvailableFont];
//        [UIFont foreignAidFontName];
    }return self;
}
#pragma mark —— 一些私有方法
-(NSMutableArray <JobsTabBarControllerConfig *>*)makeConfigMutArr{
    NSMutableArray *ConfigMutArr = NSMutableArray.array;
    {
        JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
        config.vc = MSHomeVC.new;
        config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
        config.imageSelected = JobsIMG(@"首页_已点击");
        config.imageUnselected = JobsIMG(@"首页_已点击");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
        config.vc = MSMomentsVC.new;
        config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
        config.imageSelected = JobsIMG(@"圈子_未点击");
        config.imageUnselected = JobsIMG(@"圈子_未点击");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
        config.vc = MSOrderVC.new;
        config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
        config.imageSelected = JobsIMG(@"加号图片");
        config.imageUnselected = JobsIMG(@"加号图片");
        config.humpOffsetY = JobsWidth(22);
        config.lottieName = nil;
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
        config.vc = MSMsgVC.new;
        config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
        config.imageSelected = JobsIMG(@"消息_未点击");
        config.imageUnselected = JobsIMG(@"消息_未点击");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
        config.vc = MSMineVC.new;
        config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
        config.imageSelected = JobsIMG(@"我的_未点击");
        config.imageUnselected = JobsIMG(@"我的_未点击");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    return ConfigMutArr;
}
/// Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
#pragma mark —— UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application
didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
#pragma mark —— lazyLoad
/// 仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)window{
    if (!_window) {
        _window = UIWindow.new;
        _window.frame = UIScreen.mainScreen.bounds;
        self.configMutArr = self.makeConfigMutArr;
        _window.rootViewController = self.tabBarVC;
//        [self.tabBarVC ppBadge:YES];
        [_window makeKeyAndVisible];
    }return _window;
}
/// Core Data stack
@synthesize persistentContainer = _persistentContainer;
- (NSPersistentCloudKitContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentCloudKitContainer alloc] initWithName:HDAppDisplayName];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }return _persistentContainer;
}

@end
