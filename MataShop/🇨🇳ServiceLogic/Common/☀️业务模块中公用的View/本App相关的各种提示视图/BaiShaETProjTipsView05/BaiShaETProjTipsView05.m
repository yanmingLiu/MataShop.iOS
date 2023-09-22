//
//  BaiShaETProjTipsView05.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjTipsView05.h"

@interface BaiShaETProjTipsView05 ()

@end

@implementation BaiShaETProjTipsView05

@synthesize viewModel = _viewModel;


#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_tipsView05OnceToken = 0;
    static_tipsView05 = nil;
}

static BaiShaETProjTipsView05 *static_tipsView05 = nil;
static dispatch_once_t static_tipsView05OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_tipsView05OnceToken, ^{
        static_tipsView05 = BaiShaETProjTipsView05.new;
    });return static_tipsView05;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.titleIMGV.image = JobsIMG(@"联系客服进行咨询");
    self.subTitleIMGV.alpha = 1;
    self.tipsLab.text = Internationalization(@"暫無可用的存款渠道，請聯繫客服\n諮詢");

    @jobs_weakify(self)
    [self.submitBtn jobsBtnClickEventBlock:^(id data) {
        @jobs_strongify(self)
//        [self JobsTestPopView:@"联系客服"];
    }];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— lazyLoad

@end
