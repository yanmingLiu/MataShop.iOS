//
//  MSSearchBoardView.m
//  MataShop
//
//  Created by Jobs Hi on 9/10/23.
//

#import "MSSearchBoardView.h"

@interface MSSearchBoardView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UITextField *searchTF;
@property(nonatomic,strong)UIButton *searchBtn;

@end

@implementation MSSearchBoardView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_searchBoardViewOnceToken = 0;
    searchBoardView = nil;
}

static MSSearchBoardView *searchBoardView = nil;
static dispatch_once_t static_searchBoardViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_searchBoardViewOnceToken, ^{
        searchBoardView = MSSearchBoardView.new;
    });return searchBoardView;
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
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(102));
}
#pragma mark —— lazyLoad
//property(nonatomic,strong)UILabel *titleLab;
//@property(nonatomic,strong)UITextField *searchTF;
//@property(nonatomic,strong)UIButton *searchBtn;
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
    }return _titleLab;
}

@end
