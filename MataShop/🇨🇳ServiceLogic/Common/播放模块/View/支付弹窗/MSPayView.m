//
//  MSPayView.m
//  MataShop
//
//  Created by Jobs Hi on 9/27/23.
//

#import "MSPayView.h"

@interface MSPayView ()
/// UI
@property(nonatomic,strong)JobsContainerView *titleView;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *sureBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsBtnModel *>*btnModelMutArr;

@end

@implementation MSPayView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_payViewOnceToken = 0;
    static_payView = nil;
}

static MSPayView *static_payView = nil;
static dispatch_once_t static_payViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_payViewOnceToken, ^{
        static_payView = MSPayView.new;
    });return static_payView;
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
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerAllCorners
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
    self.titleView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(315), JobsWidth(201));
}
#pragma mark —— lazyLoad
-(JobsContainerView *)titleView{
    if(!_titleView){
        _titleView = [JobsContainerView.alloc initWithWidth:JobsWidth(252)
                                              buttonModels:self.btnModelMutArr];
        [self addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(218), JobsWidth(72)));
            make.top.equalTo(self).offset(JobsWidth(20));
            make.centerX.equalTo(self);
        }];
    }return _titleView;
}

-(NSMutableArray<JobsBtnModel *> *)btnModelMutArr{
    if(!_btnModelMutArr){
        _btnModelMutArr = NSMutableArray.array;
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.clearColor;
            model.normalTitle = Internationalization(@"请支付");
            model.titleFont = UIFontWeightBoldSize(26);
            model.normalTitleColor = JobsCor(@"#333333");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(8);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(252);

            [_btnModelMutArr addObject:model];
        }
//
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.clearColor;
            model.normalTitle = Internationalization(@"观看完整教学视频需支付99Mata值");
            model.titleFont = UIFontWeightRegularSize(16);
            model.normalTitleColor = JobsCor(@"#666666");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(10);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(145);
//            model.normalAttributedTitle;
            
            [_btnModelMutArr addObject:model];
        }
        
    }return _btnModelMutArr;
}

@end
