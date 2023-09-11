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
@property(nonatomic,strong)BaseButton *searchBtn;
@property(nonatomic,strong)UITextField *searchTF;

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
    self.titleLab.alpha = 1;
    self.searchBtn.alpha = 1;
    self.searchTF.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(102));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"Mata商城");
        _titleLab.textColor = JobsBlackColor;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(50)));
            make.left.equalTo(self).offset(JobsWidth(10));
            make.centerY.equalTo(self);
        }];
    }return _titleLab;
}

-(BaseButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = BaseButton.new;
        [_searchBtn handelAdjustsImageWhenHighlighted];
        _searchBtn.jobsVisible = NO;
        /// 0、下列配置要依据的参数【执行顺序一定是从上至下👇🏻】
        _searchBtn.normalTitle = Internationalization(@"搜索");
        _searchBtn.normalImage = self.readUserInfo.userHeaderIMG;
        _searchBtn.normalTitleColor = HEXCOLOR(0x3D4A58);
        _searchBtn.titleFont = notoSansRegular(14);
        /// 1、约束关于Button的imageView
        _searchBtn.imageViewFrameOffsetX = JobsWidth(10);
        _searchBtn.imageViewSize = CGSizeMake(JobsWidth(30), JobsWidth(30));
        [_searchBtn.imageView layerBorderColour:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
        [_searchBtn.imageView cornerCutToCircleWithCornerRadius:JobsWidth(15)];
        // 如果要设置Button的imageView为纯圆形
        //[_userHeaderBtn.imageView cornerCutToCircleWithCornerRadius:_userHeaderBtn.imageView.image.height / 2];
        /// 2、自动约束
        [_searchBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        [_searchBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleLeft imageTitleSpace:JobsWidth(8)];
        /// 3、如果设置的还不满意
        _searchBtn.imageView.y = -JobsWidth(12);
        _searchBtn.imageView.x = 0;
        _searchBtn.titleLabel.x = JobsWidth(80);
        
        @jobs_weakify(self)
        [_searchBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"获取节日事件需要权限呀大宝贝!")];
        }];
        
    }return _searchBtn;
}

-(UITextField *)searchTF{
    if (!_searchTF) {
        _searchTF = UITextField.new;
        _searchTF.placeholder = Internationalization(@"搜索关键词");
        [self addSubview:_searchTF];
        [_searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(28)));
            make.centerY.equalTo(self.titleLab);
        }];
        
        [_searchTF textFieldEventFilterBlock:^BOOL(id data) {
            return YES;
        } subscribeNextBlock:^(id data) {
            
        }];
        [self layoutIfNeeded];
        [_searchTF setBorderWithColor:HEXCOLOR(0xEAEBED)
                          borderWidth:JobsWidth(2)
                           borderType:UIBorderSideTypeBottom];
    }return _searchTF;
}



@end
