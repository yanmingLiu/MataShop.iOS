//
//  BaiShaETProjTipsView02.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjTipsView02.h"

@interface BaiShaETProjTipsView02 ()

@end

@implementation BaiShaETProjTipsView02

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_tipsView02OnceToken = 0;
    static_tipsView02 = nil;
}

static BaiShaETProjTipsView02 *static_tipsView02 = nil;
static dispatch_once_t static_tipsView02OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_tipsView02OnceToken, ^{
        static_tipsView02 = BaiShaETProjTipsView02.new;
    });return static_tipsView02;
}

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
    self.titleIMGV.image = JobsIMG(@"暂无记录");
    self.subTitleIMGV.alpha = 1;
    self.tipsLab.text = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"暂无记录"): self.viewModel.textModel.text;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— lazyLoad

@end
