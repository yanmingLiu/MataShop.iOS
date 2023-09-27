//
//  MSMineView1.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMineView1.h"

@interface MSMineView1 ()
/// UI
@property(nonatomic,strong)UIImageView *avatarIMGV;
@property(nonatomic,strong)JobsContainerView *userInfoView;
@property(nonatomic,strong)UIButton *leftArrowBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsBtnModel *>*btnModelMutArr;

@end

@implementation MSMineView1
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_mineView1OnceToken = 0;
    static_mineView1 = nil;
}

static MSMineView1 *static_mineView1 = nil;
static dispatch_once_t static_mineView1OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_mineView1OnceToken, ^{
        static_mineView1 = MSMineView1.new;
    });return static_mineView1;
}
#pragma mark —— SysMethod
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
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.userInteractionEnabled = YES;
    self.image = JobsIMG(@"个人中心背景图片");
    self.avatarIMGV.alpha = 1;
    self.userInfoView.alpha = 1;
    self.leftArrowBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(182));
}
#pragma mark —— lazyLoad
-(UIImageView *)avatarIMGV{
    if(!_avatarIMGV){
        _avatarIMGV = UIImageView.new;
        _avatarIMGV.image = JobsIMG(@"用户默认头像");
        [self addSubview:_avatarIMGV];
        [_avatarIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(56)));
            make.left.equalTo(self).offset(JobsWidth(16));
            make.bottom.equalTo(self).offset(JobsWidth(-20));
        }];
    }return _avatarIMGV;
}

-(JobsContainerView *)userInfoView{
    if(!_userInfoView){
        _userInfoView = [JobsContainerView.alloc initWithWidth:JobsWidth(120)
                                                  buttonModels:self.btnModelMutArr];
        [self addSubview:_userInfoView];
        [_userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(43)));
            make.centerY.equalTo(self.avatarIMGV);
            make.left.equalTo(self.avatarIMGV.mas_right).offset(JobsWidth(16));
        }];
    }return _userInfoView;
}

-(UIButton *)leftArrowBtn{
    if(!_leftArrowBtn){
        _leftArrowBtn = UIButton.new;
        _leftArrowBtn.normalImage = JobsIMG(@"向右箭头");
        [self addSubview:_leftArrowBtn];
        [_leftArrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(20), JobsWidth(20)));
            make.centerY.equalTo(self.avatarIMGV);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
        @jobs_weakify(self)
        [_leftArrowBtn jobsBtnClickEventBlock:^(id data) {
            @jobs_strongify(self)
            [WHToast toastMsg:Internationalization(@"编辑个人资料")];
        }];
    }return _leftArrowBtn;
}

-(NSMutableArray<JobsBtnModel *> *)btnModelMutArr{
    if(!_btnModelMutArr){
        _btnModelMutArr = NSMutableArray.array;
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.clearColor;
            model.title = Internationalization(@"赵露思");
            model.font = UIFontWeightBoldSize(18);
            model.titleColor = JobsWhiteColor;
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            model.contentSpacing = JobsWidth(8);
            model.lineBreakMode = NSLineBreakByWordWrapping;
//            model.btnWidth = JobsWidth(160);
            [_btnModelMutArr addObject:model];
        }
//
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.clearColor;
            model.title = Internationalization(@"138****8888");
            model.font = UIFontWeightRegularSize(14);
            model.titleColor = JobsWhiteColor;
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            model.contentSpacing = JobsWidth(10);
            model.lineBreakMode = NSLineBreakByWordWrapping;
//            model.btnWidth = JobsWidth(252);

            [_btnModelMutArr addObject:model];
        }
        
    }return _btnModelMutArr;
}

@end
