//
//  MSChuBaoView1.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView1.h"

@interface MSChuBaoView1 ()
/// UI
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)JobsContainerView *titleView;
@property(nonatomic,strong)BaseButton *rechargeBtn;// 充值
@property(nonatomic,strong)BaseButton *withdrawBtn;// 提现
/// Data
@property(nonatomic,strong)NSMutableArray <JobsBtnModel *>*btnModelMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)UIButtonConfiguration *withdrawBtnConfig;
@property(nonatomic,strong)UIButtonConfiguration *rechargeBtnConfig;

@end

@implementation MSChuBaoView1
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoView1OnceToken = 0;
    static_chuBaoView1 = nil;
}

static MSChuBaoView1 *static_chuBaoView1 = nil;
static dispatch_once_t static_chuBaoView1OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoView1OnceToken, ^{
        static_chuBaoView1 = MSChuBaoView1.new;
    });return static_chuBaoView1;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
        self.userInteractionEnabled = YES;
        self.image = JobsIMG(@"储宝背景图");
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
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
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    MakeDataNull
    self.imgV.alpha = 1;
    self.titleView.alpha = 1;
    self.withdrawBtn.alpha = 1;
    self.rechargeBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(92));
}
#pragma mark —— lazyLoad
-(UIImageView *)imgV{
    if(!_imgV){
        _imgV = UIImageView.new;
        _imgV.image = JobsIMG(@"FAFB4239-814A-436E-8C3B-3B18D88B1D53");
        [self addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(23), JobsWidth(23)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(16));
        }];
    }return _imgV;
}

-(JobsContainerView *)titleView{
    if(!_titleView){
        _titleView = [JobsContainerView.alloc initWithWidth:JobsWidth(100)
                                               buttonModels:self.btnModelMutArr];
//        _titleView.backgroundColor = JobsRedColor;
        _titleView.userInteractionEnabled = NO;
        [self addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgV.mas_right).offset(JobsWidth(8));
            make.top.equalTo(self).offset(JobsWidth(24));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(44)));
        }];
    }return _titleView;
}

-(BaseButton *)withdrawBtn{
    if(!_withdrawBtn){
        if(self.deviceSystemVersion.floatValue >= 15.0){
            _withdrawBtn = [BaseButton buttonWithConfiguration:self.withdrawBtnConfig primaryAction:nil];
        }else{
            _withdrawBtn = BaseButton.new;
            _withdrawBtn.backgroundColor = JobsCor(@"#EA2918");
            _withdrawBtn.titleFont = UIFontWeightBoldSize(12);
            _withdrawBtn.normalTitle = Internationalization(@"提现");
            _withdrawBtn.normalTitleColor = JobsWhiteColor;
            
            // 在按钮高亮状态变化时，使用 configurationUpdateHandler 来自定义图像样式
            // 关于UIButtonConfiguration 和 configurationUpdateHandler 的使用
            _withdrawBtn.configurationUpdateHandler = ^(UIButton * _Nonnull updatedButton) {
                if (updatedButton.isHighlighted) {
                    // 按钮处于高亮状态，切换到高亮状态的图像样式
                    UIImage *highlightedImage = [UIImage imageNamed:@"highlighted_image"];
                    updatedButton.configuration.image = highlightedImage;
                } else {
                    // 按钮处于正常状态，切换到正常状态的图像样式
                    UIImage *normalImage = [UIImage imageNamed:@"normal_image"];
                    updatedButton.configuration.image = normalImage;
                }};
        }
        // 添加按钮到视图中
        [self addSubview:_withdrawBtn];
        [_withdrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
        if(self.deviceSystemVersion.floatValue < 15.0){
            [_withdrawBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                             imagePadding:JobsWidth(8)];
        }
        [_withdrawBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        @jobs_weakify(self)
        [_withdrawBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [WHToast toastErrMsg:Internationalization(@"提现")];
            return nil;
        }];
    }return _withdrawBtn;
}

-(BaseButton *)rechargeBtn{
    if(!_rechargeBtn){
        if(self.deviceSystemVersion.floatValue >= 15.0){
            _rechargeBtn = [BaseButton buttonWithConfiguration:self.rechargeBtnConfig primaryAction:nil];
        }else{
            _rechargeBtn = BaseButton.new;
            _rechargeBtn.backgroundColor = JobsClearColor;
            _rechargeBtn.titleFont = UIFontWeightBoldSize(12);
            _rechargeBtn.normalTitle =  Internationalization(@"充值");
            _rechargeBtn.normalTitleColor = RGBA_COLOR(136, 79, 2, 1);
            
            // 在按钮高亮状态变化时，使用 configurationUpdateHandler 来自定义图像样式
            // 关于UIButtonConfiguration 和 configurationUpdateHandler 的使用
            _rechargeBtn.configurationUpdateHandler = ^(UIButton * _Nonnull updatedButton) {
                if (updatedButton.isHighlighted) {
                // 按钮处于高亮状态，切换到高亮状态的图像样式
                UIImage *highlightedImage = [UIImage imageNamed:@"highlighted_image"];
                updatedButton.configuration.image = highlightedImage;
            } else {
                // 按钮处于正常状态，切换到正常状态的图像样式
                UIImage *normalImage = [UIImage imageNamed:@"normal_image"];
                updatedButton.configuration.image = normalImage;
            }
        };
        }
        // 添加按钮到视图中
        [self addSubview:_rechargeBtn];
        [_rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(32)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-104));
        }];
        if(self.deviceSystemVersion.floatValue < 15.0){
            [_rechargeBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading 
                                             imagePadding:JobsWidth(8)];
        }
        [_rechargeBtn layerBorderCor:JobsCor(@"#FFE4BE") andBorderWidth:1];
        [_rechargeBtn cornerCutToCircleWithCornerRadius:JobsWidth(16)];
        @jobs_weakify(self)
        [_rechargeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self forceComingToPushVC:MSTopUpVC.new requestParams:@""];
            return nil;
        }];
    }return _rechargeBtn;
}

-(UIButtonConfiguration *)withdrawBtnConfig{
    if(!_withdrawBtnConfig){
        _withdrawBtnConfig = UIButtonConfiguration.filledButtonConfiguration;

        {// 一般的文字
            _withdrawBtnConfig.title = Internationalization(@"提现");
            _withdrawBtnConfig.subtitle = @"";
            _withdrawBtnConfig.baseForegroundColor = JobsCor(@"#EA2918");// 前景颜色（= 文字颜色）
        }
        
        {// 富文本
            // 设置按钮标题的文本属性
            _withdrawBtnConfig.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
                NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
                [newTextAttributes addEntriesFromDictionary:@{
                    NSFontAttributeName:UIFontWeightBoldSize(12), // 替换为你想要的字体和大小
                    NSForegroundColorAttributeName: JobsCor(@"#EA2918") // 替换为你想要的文本颜色
                }];
                return newTextAttributes.copy;
            };
            _withdrawBtnConfig.attributedTitle = [NSAttributedString.alloc initWithString:Internationalization(@"提现") attributes:@{NSForegroundColorAttributeName:JobsCor(@"#EA2918")}];
        }
        
        {// 其他
            _withdrawBtnConfig.baseBackgroundColor = UIColor.whiteColor;// 背景颜色
            _withdrawBtnConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0); // 内边距
        }
    }return _withdrawBtnConfig;
}

-(UIButtonConfiguration *)rechargeBtnConfig{
    if(!_rechargeBtnConfig){
        _rechargeBtnConfig = UIButtonConfiguration.filledButtonConfiguration;

        {// 一般的文字
            _rechargeBtnConfig.title = Internationalization(@"充值");
            _rechargeBtnConfig.subtitle = @"";
            _rechargeBtnConfig.baseForegroundColor = JobsClearColor;// 前景颜色（= 文字颜色）
        }
        
        {// 富文本
            // 设置按钮标题的文本属性
            _rechargeBtnConfig.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
                NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
                [newTextAttributes addEntriesFromDictionary:@{
                    NSFontAttributeName:UIFontWeightBoldSize(12), // 替换为你想要的字体和大小
                    NSForegroundColorAttributeName: RGBA_COLOR(136, 79, 2, 1) // 替换为你想要的文本颜色
                }];
                return newTextAttributes.copy;
            };
            _rechargeBtnConfig.attributedTitle = [NSAttributedString.alloc initWithString:Internationalization(@"充值") attributes:@{NSForegroundColorAttributeName:RGBA_COLOR(136, 79, 2, 1)}];
        }
        
        {// 其他
            _rechargeBtnConfig.baseBackgroundColor = UIColor.whiteColor;// 背景颜色
            _rechargeBtnConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0); // 内边距
        }
    }return _rechargeBtnConfig;
}

-(NSMutableArray<JobsBtnModel *> *)btnModelMutArr{
    if(!_btnModelMutArr){
        _btnModelMutArr = NSMutableArray.array;
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.whiteColor;
            model.normalTitle = Internationalization(@"我的余额");
            model.titleFont = UIFontWeightRegularSize(6);
            model.normalTitleColor = RGBA_COLOR(51, 51, 51, 1);
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(10);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(100);

            [_btnModelMutArr addObject:model];
        }
//
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.whiteColor;
            model.normalTitle = Internationalization(@"45466");
            model.titleFont = UIFontWeightRegularSize(24);
            model.normalTitleColor = RGBA_COLOR(236, 86, 40, 1);
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(10);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(100);
            
            [_btnModelMutArr addObject:model];
        }
        
    }return _btnModelMutArr;
}

@end
