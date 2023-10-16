//
//  JobsShareView.m
//  MataShop
//
//  Created by Jobs Hi on 10/16/23.
//

#import "JobsShareView.h"

@interface JobsShareView ()

@end

@implementation JobsShareView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_shareViewOnceToken = 0;
    static_shareView = nil;
}

static MSShareView *static_shareView = nil;
static dispatch_once_t static_shareViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_shareViewOnceToken, ^{
        static_shareView = JobsShareView.new;
    });return static_shareView;
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
    JobsLock(self.size = [MSHomePopupView viewSizeWithModel:nil];)
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
    return CGSizeMake(JobsWidth(375), JobsWidth(148));
}
#pragma mark —— lazyLoad

@end
