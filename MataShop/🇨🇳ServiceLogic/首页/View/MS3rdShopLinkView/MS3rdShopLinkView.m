//
//  MS3rdShopLinkView.m
//  MataShop
//
//  Created by Jobs Hi on 9/14/23.
//

#import "MS3rdShopLinkView.h"

@interface MS3rdShopLinkView ()
/// UI
@property(nonatomic,strong)NSMutableArray <BaseButton *>*btnMutArr;
/// Data
@property(nonatomic,strong)NSMutableArray <UIImage *>*btnIMGMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*btnTitleMutArr;

@end

@implementation MS3rdShopLinkView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_shopLinkViewOnceToken = 0;
    static_shopLinkView = nil;
}

static MS3rdShopLinkView *static_shopLinkView = nil;
static dispatch_once_t static_shopLinkViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_shopLinkViewOnceToken, ^{
        static_shopLinkView = MS3rdShopLinkView.new;
    });return static_shopLinkView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
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
#pragma mark —— 一些私有方法
-(void)masonry{
    // 实现masonry水平固定间隔方法
    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:0
                                     leadSpacing:0
                                     tailSpacing:0];
    // 设置array的垂直方向的约束
    [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self);
    }];
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
    [self masonry];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(96));
}
#pragma mark —— lazyLoad
-(NSMutableArray<BaseButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
        
        for (int i = 0; i < self.btnIMGMutArr.count; i++) {
            BaseButton *btn = BaseButton.new;
            
            btn.normalTitle = self.btnTitleMutArr[i];
            btn.normalImage = self.btnIMGMutArr[i];
            btn.normalTitleColor = RGBA_COLOR(20, 17, 38, 1);
            btn.titleFont = UIFontWeightRegularSize(JobsWidth(14));
            btn.imageViewSize = CGSizeMake(JobsWidth(36), JobsWidth(36));
            [btn makeBtnLabelByShowingType:UILabelShowingType_03];
            [btn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:JobsWidth(10)];
            [self addSubview:btn];
            [_btnMutArr addObject:btn];
        }
        
    }return _btnMutArr;
}

-(NSMutableArray<UIImage *> *)btnIMGMutArr{
    if(!_btnIMGMutArr){
        _btnIMGMutArr = NSMutableArray.array;
        [_btnIMGMutArr addObject:JobsIMG(@"淘宝")];
        [_btnIMGMutArr addObject:JobsIMG(@"京东")];
        [_btnIMGMutArr addObject:JobsIMG(@"美团")];
        [_btnIMGMutArr addObject:JobsIMG(@"唯品会")];
        [_btnIMGMutArr addObject:JobsIMG(@"拼多多")];
    }return _btnIMGMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if(!_btnTitleMutArr){
        _btnTitleMutArr = NSMutableArray.array;
        [_btnTitleMutArr addObject:Internationalization(@"淘宝")];
        [_btnTitleMutArr addObject:Internationalization(@"京东")];
        [_btnTitleMutArr addObject:Internationalization(@"美团")];
        [_btnTitleMutArr addObject:Internationalization(@"唯品会")];
        [_btnTitleMutArr addObject:Internationalization(@"拼多多")];
    }return _btnTitleMutArr;
}

@end
