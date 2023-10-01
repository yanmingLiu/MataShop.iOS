//
//  MSSearchBoardView.m
//  MataShop
//
//  Created by Jobs Hi on 9/10/23.
//

#import "MSSearchBoardView.h"

@interface MSSearchBoardView ()
/// UI
@property(nonatomic,strong)UIImageView *titleIMGV;
@property(nonatomic,strong)MSSearchView *searchView;

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
    self.titleIMGV.alpha = 1;
    self.searchView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(62));
}
#pragma mark —— lazyLoad
-(UIImageView *)titleIMGV{
    if(!_titleIMGV){
        _titleIMGV = UIImageView.new;
        _titleIMGV.image = JobsIMG(@"Mata商城");
        [self addSubview:_titleIMGV];
        [_titleIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(83), JobsWidth(18)));
            make.left.equalTo(self).offset(JobsWidth(16));
            make.centerY.equalTo(self);
        }];
    }return _titleIMGV;
}

-(MSSearchView *)searchView{
    if(!_searchView){
        _searchView = MSSearchView.new;
        [_searchView richElementsInViewWithModel:nil];
        [self addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSSearchView viewSizeWithModel:nil]);
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
        [_searchView cornerCutToCircleWithCornerRadius:JobsWidth(22)];
    }return _searchView;
}

@end
