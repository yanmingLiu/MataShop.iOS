//
//  MSChooseRechargeWayView.m
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "MSChooseRechargeWayView.h"

@interface MSChooseRechargeWayView ()

@end

@implementation MSChooseRechargeWayView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chooseRechargeWayViewOnceToken = 0;
    static_chooseRechargeWayView = nil;
}

static MSChooseRechargeWayView *static_chooseRechargeWayView = nil;
static dispatch_once_t static_chooseRechargeWayViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chooseRechargeWayViewOnceToken, ^{
        static_chooseRechargeWayView = MSChooseRechargeWayView.new;
    });return static_chooseRechargeWayView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
                            @selector(languageSwitchNotification:),
                            LanguageSwitchNotification,
                            nil);
        //        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    JobsLock(self.size = [MSChooseRechargeWayView viewSizeWithModel:nil];)
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(375), JobsWidth(532));
}
#pragma mark —— lazyLoad

@end
