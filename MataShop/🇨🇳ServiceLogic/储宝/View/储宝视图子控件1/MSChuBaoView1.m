//
//  MSChuBaoView1.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView1.h"

@interface MSChuBaoView1 ()

@end

@implementation MSChuBaoView1

@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoView1OnceToken = 0;
    static_chuBaoView1 = nil;
}

static MSChuBaoView1 *static_chuBaoView1 = nil;
static dispatch_once_t static_chuBaoView1OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoView1OnceToken, ^{
        static_chuBaoView1 = MSChuBaoView1.new;
    });return static_chuBaoView1;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
        self.image = JobsIMG(@"0B2D074D-A661-4476-8536-E2D7EA4E41D3");
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NotificationAdd(self,
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
    return CGSizeMake(JobsWidth(343), JobsWidth(92));
}
#pragma mark —— lazyLoad

@end
