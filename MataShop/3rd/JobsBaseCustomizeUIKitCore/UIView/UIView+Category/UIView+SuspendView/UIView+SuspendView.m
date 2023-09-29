//
//  UIView+SuspendView.m
//  Search
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIView+SuspendView.h"

@implementation UIView (SuspendView)
#pragma mark —— 一些私有方法
-(void)handlePanGesture:(UIPanGestureRecognizer *)recognizer{
    //移动状态
    UIGestureRecognizerState recState = recognizer.state;
    switch (recState) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:{
            CGPoint translation = [recognizer translationInView:self.vc.navigationController.view];
            recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                                 recognizer.view.center.y + translation.y);
        }
            break;
        case UIGestureRecognizerStateEnded:{
            CGPoint stopPoint = CGPointMake(0, JobsMainScreen_HEIGHT() / 2.0);
            if (recognizer.view.center.x < JobsMainScreen_WIDTH() / 2.0) {
                if (recognizer.view.center.y <= JobsMainScreen_HEIGHT()/2.0) {
                    //左上
                    if (recognizer.view.center.x  >= recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(self.width/2.0,
                                                recognizer.view.center.y);
                    }
                }else{
                    //左下
                    if (recognizer.view.center.x  >= JobsMainScreen_HEIGHT() - recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                JobsMainScreen_HEIGHT() - self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(self.width / 2.0,
                                                recognizer.view.center.y);
                    }
                }
            }else{
                if (recognizer.view.center.y <= JobsMainScreen_HEIGHT()/2.0) {
                    //右上
                    if (JobsMainScreen_WIDTH() - recognizer.view.center.x  >= recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(JobsMainScreen_WIDTH() - self.width/2.0,
                                                recognizer.view.center.y);
                    }
                }else{
                    //右下
                    if (JobsMainScreen_WIDTH() - recognizer.view.center.x  >= JobsMainScreen_HEIGHT() - recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                JobsMainScreen_HEIGHT() - self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(JobsMainScreen_WIDTH() - self.width/2.0,
                                                recognizer.view.center.y);
                    }
                }
            }
            //如果按钮超出屏幕边缘
            if (stopPoint.y + self.width + 40 >= JobsMainScreen_HEIGHT()) {
                stopPoint = CGPointMake(stopPoint.x, JobsMainScreen_HEIGHT() - self.width / 2.0 - 49);
                NSLog(@"超出屏幕下方了！！"); //这里注意iphoneX的适配。。X的SCREEN高度算法有变化。
            }
            if (stopPoint.x - self.width / 2.0 <= 0) {
                stopPoint = CGPointMake(self.width / 2.0, stopPoint.y);
            }
            if (stopPoint.x + self.width / 2.0 >= JobsMainScreen_WIDTH()) {
                stopPoint = CGPointMake(JobsMainScreen_WIDTH() - self.width/2.0, stopPoint.y);
            }
            if (stopPoint.y - self.width / 2.0 <= 0) {
                stopPoint = CGPointMake(stopPoint.x, self.width/2.0);
            }
  
            [UIView animateWithDuration:0.5 animations:^{
                recognizer.view.center = stopPoint;
            }];
        }
            break;
        default:
            break;
    }
    [recognizer setTranslation:CGPointMake(0, 0)
                        inView:self.vc.view];
}
#pragma mark —— @property(nonatomic,weak)UIViewController *vc;
@dynamic vc;
-(UIViewController *)vc{
    UIViewController *VC = objc_getAssociatedObject(self, _cmd);
    if (!VC) {
        NSLog(@"VC 不能为空");
    }return VC;
}

-(void)setVc:(UIViewController *)vc{
    objc_setAssociatedObject(self,
                             _cmd,
                             vc,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIPanGestureRecognizer *panRcognize;
@dynamic panRcognize;
-(UIPanGestureRecognizer *)panRcognize{
    UIPanGestureRecognizer *PanRcognize = objc_getAssociatedObject(self, _cmd);
    if (!PanRcognize) {
        self.panGR.enabled = YES;
        self.panGR.minimumNumberOfTouches = 1;
        self.panGR.delaysTouchesEnded = YES;
        self.panGR.cancelsTouchesInView = YES;
        self.target = self;/// ⚠️注意：任何手势这一句都要写
        @jobs_weakify(self)
        self.panGR_SelImp.selector = [self jobsSelectorBlock:^(id  _Nullable target,
                                                               UIPanGestureRecognizer *_Nullable arg) {
            @jobs_strongify(self)
            [self handlePanGesture:arg];
        }];
        [self setPanRcognize:self.panGR];
    }return PanRcognize;
}

-(void)setPanRcognize:(UIPanGestureRecognizer *)panRcognize{
    objc_setAssociatedObject(self,
                             _cmd,
                             panRcognize,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
