//
//  UIViewController+BWShareView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+BWShareView.h"

@implementation UIViewController (BWShareView)

static char *originX = "originX";
static char *originY = "originY";
static char *sizeW = "sizeW";
static char *sizeH = "sizeH";

#pragma mark —— @property(strong,nonatomic)BWShareView *shareView;
@dynamic shareView;
-(BWShareView *)shareView{
    BWShareView *ShareView = objc_getAssociatedObject(self, _cmd);
    switch (self.bWShareViewStyle) {
        case BWShareViewStyle_1:{
            if (!ShareView) {
                ShareView = [BWShareView.alloc initWithFrame:self.shareViewFrame
                                                  shareTitle:self.shareTitle
                                                  shareArray:self.shareViewDataMutArr];
            }
        }
            break;
        case BWShareViewStyle_2:{
            if (!ShareView) {
                ShareView = [BWShareView.alloc initWithFrame:self.shareViewFrame
                                                  shareTitle:self.shareTitle
                                                  firstArray:self.shareViewDataMutArr
                                                 secondArray:self.shareViewDataMutSecArr];
            }
        }
        default:
            ShareView = Nil;
            NSAssert(ShareView,@"ShareView 创建出现错误");
            break;
    }
    objc_setAssociatedObject(self,
                             _cmd,
                             ShareView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return ShareView;
}

-(void)setShareView:(BWShareView *)shareView{
    objc_setAssociatedObject(self,
                             _cmd,
                             shareView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(assign,nonatomic)CGRect shareViewFrame;
@dynamic shareViewFrame;
-(CGRect)shareViewFrame{
    CGFloat ShareViewFrameX = [objc_getAssociatedObject(self, originX) floatValue];
    CGFloat ShareViewFrameY = [objc_getAssociatedObject(self, originY) floatValue];
    CGFloat ShareViewFrameW = [objc_getAssociatedObject(self, sizeW) floatValue];
    CGFloat ShareViewFrameH = [objc_getAssociatedObject(self, sizeH) floatValue];
    return CGRectMake(ShareViewFrameX,
                      ShareViewFrameY,
                      ShareViewFrameW,
                      ShareViewFrameH);
}

-(void)setShareViewFrame:(CGRect)shareViewFrame{
    objc_setAssociatedObject(self,
                             originX,
                             [NSNumber numberWithFloat:shareViewFrame.origin.x],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             originY,
                             [NSNumber numberWithFloat:shareViewFrame.origin.y],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             sizeW,
                             [NSNumber numberWithFloat:shareViewFrame.size.width],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             sizeH,
                             [NSNumber numberWithFloat:shareViewFrame.size.height],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark —— @property(assign,nonatomic)BWShareViewStyle bWShareViewStyle;
@dynamic bWShareViewStyle;
-(BWShareViewStyle)bWShareViewStyle{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

-(void)setBWShareViewStyle:(BWShareViewStyle)bWShareViewStyle{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithInteger:bWShareViewStyle],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(strong,nonatomic)NSMutableArray *shareViewDataMutArr;
@dynamic shareViewDataMutArr;
-(NSMutableArray *)shareViewDataMutArr{
    NSMutableArray *ShareViewDataMutArr = objc_getAssociatedObject(self, _cmd);
    if (!ShareViewDataMutArr) {
        ShareViewDataMutArr = NSMutableArray.array;
        objc_setAssociatedObject(self,
                                 _cmd,
                                 ShareViewDataMutArr,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return ShareViewDataMutArr;
}

-(void)setShareViewDataMutArr:(NSMutableArray *)shareViewDataMutArr{
    objc_setAssociatedObject(self,
                             _cmd,
                             shareViewDataMutArr,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark —— @property(strong,nonatomic)NSMutableArray *shareViewDataMutSecArr;
@dynamic shareViewDataMutSecArr;
-(NSMutableArray *)shareViewDataMutSecArr{
    NSMutableArray *ShareViewDataMutSecArr = objc_getAssociatedObject(self, _cmd);
    if (!ShareViewDataMutSecArr) {
        ShareViewDataMutSecArr = NSMutableArray.array;
        objc_setAssociatedObject(self,
                                 _cmd,
                                 ShareViewDataMutSecArr,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return ShareViewDataMutSecArr;
}

-(void)setShareViewDataMutSecArr:(NSMutableArray *)shareViewDataMutSecArr{
    objc_setAssociatedObject(self,
                             _cmd,
                             shareViewDataMutSecArr,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(strong,nonatomic)NSString *shareTitle;
@dynamic shareTitle;
-(NSString *)shareTitle{
   return objc_getAssociatedObject(self, _cmd);
}

-(void)setShareTitle:(NSString *)shareTitle{
    objc_setAssociatedObject(self,
                             _cmd,
                             shareTitle,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
