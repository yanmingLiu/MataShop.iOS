//
//  UIView+ZFPlayer.m
//  UBallLive
//
//  Created by Jobs on 2020/11/3.
//

#import "UIView+ZFPlayer.h"

@implementation UIView (ZFPlayer)
#pragma mark —— 一些公有方法
-(void)enterBackgroundStopPlayer{
    @jobs_weakify(self)
    [NSNotificationCenter.defaultCenter addObserverForName:UBLEnterBackgroundStopPlayer
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification * _Nonnull notification) {
        @jobs_strongify(self)
        NSString *notificationName = notification.name;
        if (objc_getAssociatedObject(self, UIView_ZFPlayer_avPlayerManager)) {
            [self.avPlayerManager stop];
        }
        
        if (objc_getAssociatedObject(self, UIView_ZFPlayer_ijkPlayerManager)) {
            [self.ijkPlayerManager stop];
        }
    }];
}
#pragma mark —— @property(nonatomic,strong,nullable)ZFPlayerController *playerCtr;
static char *UIView_ZFPlayer_playerCtr = "UIView_ZFPlayer_playerCtr";
@dynamic playerCtr;
-(ZFPlayerController *)playerCtr{
    ZFPlayerController *PlayerCtr = objc_getAssociatedObject(self, UIView_ZFPlayer_playerCtr);
    if (!PlayerCtr) {
        if (objc_getAssociatedObject(self, UIView_ZFPlayer_avPlayerManager)) {
            @jobs_weakify(self)
            PlayerCtr = [[ZFPlayerController alloc] initWithPlayerManager:self.avPlayerManager
                                                            containerView:self];
            PlayerCtr.controlView = self.customPlayerControlView;
            NSLog(@"%@",PlayerCtr.controlView);
            PlayerCtr.muted = YES;//静音播放
            [PlayerCtr setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
                @jobs_strongify(self)
                [self.avPlayerManager replay];//设置循环播放
            }];
        }
        
        if (objc_getAssociatedObject(self, UIView_ZFPlayer_ijkPlayerManager)) {
            @jobs_weakify(self)
            PlayerCtr = [ZFPlayerController.alloc initWithPlayerManager:self.ijkPlayerManager
                                                          containerView:self];
            PlayerCtr.controlView = self.customPlayerControlView;
            NSLog(@"%@",PlayerCtr.controlView);
            PlayerCtr.muted = YES;//静音播放
            [PlayerCtr setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
                @jobs_strongify(self)
                [self.ijkPlayerManager replay];//设置循环播放
            }];
        }
        [self setPlayerCtr:PlayerCtr];
    }return PlayerCtr;
}

-(void)setPlayerCtr:(ZFPlayerController *)playerCtr{
    objc_setAssociatedObject(self,
                             UIView_ZFPlayer_playerCtr,
                             playerCtr,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong,nullable)ZFAVPlayerManager *avPlayerManager;//默认不支持FLV流视频格式的
static char *UIView_ZFPlayer_avPlayerManager = "UIView_ZFPlayer_avPlayerManager";
@dynamic avPlayerManager;
-(ZFAVPlayerManager *)avPlayerManager{
    ZFAVPlayerManager *AVPlayerManager = objc_getAssociatedObject(self, UIView_ZFPlayer_avPlayerManager);
    if (!AVPlayerManager) {
        AVPlayerManager = ZFAVPlayerManager.new;
        AVPlayerManager.shouldAutoPlay = YES;
//        {
//            NSString *str = @"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4";//苹果官方给出的测试地址
//            AVPlayerManager.assetURL = str.jobsUrl;
//            AVPlayerManager.assetURL = [NSURL fileURLWithPath:[NSBundle.mainBundle pathForResource:@"iph_X" ofType:@"mp4"]];
//        }
        [self setAvPlayerManager:AVPlayerManager];
    }return AVPlayerManager;
}

-(void)setAvPlayerManager:(ZFAVPlayerManager *)avPlayerManager{
    objc_setAssociatedObject(self,
                             UIView_ZFPlayer_avPlayerManager,
                             avPlayerManager,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong,nullable)ZFIJKPlayerManager *ijkPlayerManager;//ZFPlayer的作者告诉我：如果要兼容FLV流视频格式请用这个
static char *UIView_ZFPlayer_ijkPlayerManager = "UIView_ZFPlayer_ijkPlayerManager";
@dynamic ijkPlayerManager;
-(ZFIJKPlayerManager *)ijkPlayerManager{
    ZFIJKPlayerManager *IJKPlayerManager = objc_getAssociatedObject(self, UIView_ZFPlayer_ijkPlayerManager);
    if (!IJKPlayerManager) {
        IJKPlayerManager = ZFIJKPlayerManager.new;
        [self setIjkPlayerManager:IJKPlayerManager];
    }return IJKPlayerManager;
}

-(void)setIjkPlayerManager:(ZFIJKPlayerManager *)ijkPlayerManager{
    objc_setAssociatedObject(self,
                             UIView_ZFPlayer_ijkPlayerManager,
                             ijkPlayerManager,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong,nullable)CustomZFPlayerControlView *customPlayerControlView;
static char *UIView_ZFPlayer_customPlayerControlView = "UIView_ZFPlayer_customPlayerControlView";
@dynamic customPlayerControlView;
-(CustomZFPlayerControlView *)customPlayerControlView{
    CustomZFPlayerControlView *playerControlView = objc_getAssociatedObject(self, UIView_ZFPlayer_customPlayerControlView);
    if (!playerControlView) {
        playerControlView = CustomZFPlayerControlView.new;
//        playerControlView.frame = self.bounds;
        [self setCustomPlayerControlView:playerControlView];
    }return playerControlView;
}

-(void)setCustomPlayerControlView:(CustomZFPlayerControlView *)customPlayerControlView{
    objc_setAssociatedObject(self,
                             UIView_ZFPlayer_customPlayerControlView,
                             customPlayerControlView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end



