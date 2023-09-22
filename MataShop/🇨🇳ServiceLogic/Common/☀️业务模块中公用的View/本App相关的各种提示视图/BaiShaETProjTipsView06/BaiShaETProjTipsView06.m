//
//  BaiShaETProjTipsView06.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjTipsView06.h"

@interface BaiShaETProjTipsView06 ()

@end

@implementation BaiShaETProjTipsView06

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_tipsView06OnceToken = 0;
    static_tipsView06 = nil;
}

static BaiShaETProjTipsView06 *static_tipsView06 = nil;
static dispatch_once_t static_tipsView06OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_tipsView06OnceToken, ^{
        static_tipsView06 = BaiShaETProjTipsView06.new;
    });return static_tipsView06;
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
    self.titleIMGV.image = JobsIMG(@"搜索无结果");
    self.subTitleIMGV.alpha = 1;
    self.tipsLab.text = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"沒有搜索到“百家樂”相關遊戲信息\n您可以重新搜索其他關鍵詞"): self.viewModel.textModel.text;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— lazyLoad

@end
