//
//  MSHomeGoodsView.m
//  MataShop
//
//  Created by Jobs Hi on 9/19/23.
//

#import "MSHomeGoodsView.h"

@interface MSHomeGoodsView ()

@property(nonatomic,assign)CGPoint initialTouchPoint;
@property(nonatomic,assign)CGFloat minY; // 最小的 Y 坐标
@property(nonatomic,assign)CGFloat maxY; // 最大的 Y 坐标

@end

@implementation MSHomeGoodsView
//UILocationProtocol_synthesize
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_homeGoodsViewOnceToken = 0;
    static_homeGoodsView = nil;
}

static MSHomeGoodsView *static_homeGoodsView = nil;
static dispatch_once_t static_homeGoodsViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_homeGoodsViewOnceToken, ^{
        static_homeGoodsView = MSHomeGoodsView.new;
    });return static_homeGoodsView;
}
#pragma mark —— 系统初始化方法
-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NotificationAdd(self,
                        @selector(languageSwitchNotification:),
                        LanguageSwitchNotification,
                        nil);
    }return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    [self setupGesture];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
}
#pragma mark —— 一些私有方法
- (void)setupGesture {
    self.userInteractionEnabled = YES;
    self.target = self;
    @jobs_weakify(self)
    self.panGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable weakSelf,
                                                           UIPanGestureRecognizer *_Nullable sender) {
        @jobs_strongify(self)
        CGPoint translation = [sender translationInView:self.superview];
//        NSLog(@"translation = %f",translation.y);// 向上为负、向下为正
        self.jobsPoint = translation;
        
        if (sender.state == UIGestureRecognizerStateBegan) {
            self.initialTouchPoint = self.center;
        }

        if (sender.state == UIGestureRecognizerStateChanged) {
            
            // 更新视图的位置，让它跟随手指移动
            self.center = CGPointMake(self.initialTouchPoint.x,
                                      self.initialTouchPoint.y + translation.y);
            
//            // 计算新的位置
//            CGFloat newY = self.initialTouchPoint.y + translation.y;
//            // 限制在 minY 和 maxY 之间  -292 430
//            newY = MAX(-292, newY);
//            newY = MIN(430, newY);
//            self.center = CGPointMake(self.initialTouchPoint.x, newY);
        }
        if (sender.state == UIGestureRecognizerStateEnded) {
            NSLog(@"translation = %f",translation.y);// 向上为负、向下为正
            // 在手势结束时，检查视图的位置并执行你想要的操作
            if(self.objectBlock) self.objectBlock(self);
        }
        
    }];self.panGR.enabled = YES;
}
#pragma mark —— lazyLoad

@end
