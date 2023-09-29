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
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;

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
        _titleView = [JobsContainerView.alloc initWithWidth:JobsWidth(315)
                                              buttonModels:self.btnModelMutArr];
        _titleView.backgroundColor = JobsRedColor;
        [self addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(252), JobsWidth(72)));
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
            model.backgroundColor = UIColor.yellowColor;
            model.normalTitle = Internationalization(@"请支付");
            model.titleFont = UIFontWeightBoldSize(26);
            model.normalTitleColor = JobsCor(@"#333333");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(8);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(54);

            [_btnModelMutArr addObject:model];
        }
//
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.blueColor;
            model.titleFont = UIFontWeightRegularSize(16);
            model.normalTitleColor = JobsCor(@"#666666");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(10);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(315);
            model.normalAttributedTitle = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr];
            
            [_btnModelMutArr addObject:model];
        }
        
    }return _btnModelMutArr;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    if (!_richTextMutArr) {
        _richTextMutArr = NSMutableArray.array;
        [_richTextMutArr addObject:Internationalization(@"观看完整教学视频需支付")];
        [_richTextMutArr addObject:Internationalization(@"Mata值")];
    }return _richTextMutArr;
}

-(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
    if (!_richTextConfigMutArr) {
        _richTextConfigMutArr = NSMutableArray.array;
        
        RichTextConfig *config_01 = RichTextConfig.new;
        config_01.font = UIFontWeightRegularSize(14);
        config_01.textCor = JobsCor(@"#666666");
        config_01.targetString = self.richTextMutArr[0];
        [_richTextConfigMutArr addObject:config_01];
        
        RichTextConfig *config_02 = RichTextConfig.new;
        config_02.font = UIFontWeightRegularSize(14);
        config_02.textCor = JobsCor(@"#BA9B77");
        config_02.targetString = Internationalization(@"99");
        [_richTextConfigMutArr addObject:config_02];
        
        RichTextConfig *config_03 = RichTextConfig.new;
        config_03.font = UIFontWeightRegularSize(14);
        config_03.textCor = JobsCor(@"#666666");
        config_03.targetString = self.richTextMutArr[1];
        [_richTextConfigMutArr addObject:config_03];
        
    }return _richTextConfigMutArr;
}

@end
