//
//  MSVoteView.m
//  MataShop
//
//  Created by Jobs Hi on 10/1/23.
//

#import "MSVoteView.h"

@interface MSVoteView ()
/// UI
@property(nonatomic,strong)JobsContainerView *titleView;
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UILabel *titleLab;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsBtnModel *>*btnModelMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;

@end

@implementation MSVoteView

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_voteViewOnceToken = 0;
    static_voteView = nil;
}

static MSVoteView *static_voteView = nil;
static dispatch_once_t static_voteViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_voteViewOnceToken, ^{
        static_voteView = MSVoteView.new;
    });return static_voteView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
        [self registerKeyboard];
        JobsAddNotification(self,
                            @selector(languageSwitchNotification:),
                            LanguageSwitchNotification,
                            nil);
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.size = [MSPayView viewSizeWithModel:nil];
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
    self.textField.alpha = 1;
    self.cancelBtn.alpha = 1;
    self.sureBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(315), JobsWidth(201));
}
#pragma mark —— 一些私有方法
-(void)registerKeyboard{
    IQKeyboardManager.sharedManager.enable = NO;
    [self keyboard];
    @jobs_weakify(self)
    __block CGFloat gg = 0;// 修正间距
    [self actionkeyboardUpNotificationBlock:^id(NSNotificationKeyboardModel *data) {
        @jobs_strongify(self)
        NSLog(@"userInfo = %@",data.userInfo);
        NSLog(@"beginFrame = %@",NSStringFromCGRect(data.beginFrame));
        NSLog(@"endFrame = %@",NSStringFromCGRect(data.endFrame));
        NSLog(@"keyboardOffsetY = %f",data.keyboardOffsetY);
        NSLog(@"notificationName = %@",data.notificationName);
        
        // 键盘高度：data.keyboardOffsetY
        // view底的Y值：self.y + [MSPayView viewSizeWithModel:nil].height
        // 我希望的view距离键盘的固定距离为JobsWidth(20),即:data.keyboardOffsetY - (self.y + [MSPayView viewSizeWithModel:nil].height) = JobsWidth(20)
        CGFloat dd = data.keyboardOffsetY - (self.y + [MSPayView viewSizeWithModel:nil].height);// 实际间距
        CGFloat ff = JobsWidth(20) - dd;
        if(ff > 0){
            // 实际间距 小于 我希望的距离
            self.y -= JobsWidth(20);
            gg = ff;// 修正为补偿值
        }else{
            // 实际间距 大于 我希望的距离
            gg = JobsWidth(20);
        }
        self.y -= gg;
        return nil;
    }];
    
    [self actionkeyboardDownNotificationBlock:^id(id data) {
        @jobs_strongify(self)
        self.y += gg;
        NSLog(@"ddd = %f",self.origin.y);
        return nil;
    }];
}

-(void)textFieldBlock:(ZYTextField *)textField
       textFieldValue:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.objBindingParams = self.textFieldInputModel;
//
//    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
-(JobsContainerView *)titleView{
    if(!_titleView){
        _titleView = [JobsContainerView.alloc initWithWidth:JobsWidth(315)
                                               buttonModels:self.btnModelMutArr];
//        _titleView.backgroundColor = JobsRedColor;
        _titleView.userInteractionEnabled = NO;
        [self addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(315), JobsWidth(72)));
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
            model.backgroundColor = UIColor.whiteColor;
            model.normalTitle = Internationalization(@"请支付");
            model.titleFont = UIFontWeightBoldSize(18);
            model.normalTitleColor = JobsCor(@"#333333");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(0);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(80);

            [_btnModelMutArr addObject:model];
        }
//
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.whiteColor;
            model.titleFont = UIFontWeightRegularSize(16);
            model.normalTitleColor = JobsCor(@"#666666");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
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
        [_richTextMutArr addObject:Internationalization(@"2Mata值一票，一个账号可免费投票一次")];
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
        
    }return _richTextConfigMutArr;
}

-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        _textField.textColor = JobsBlackColor;
        _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.rightView = self.titleLab;
        _textField.rightViewMode = UITextFieldViewModeAlways;
        _textField.placeholder = Internationalization(@"投票数量");
        _textField.placeholderColor = JobsCor(@"#333333");
        _textField.placeholderFont = UIFontWeightRegularSize(12);

        _textField.drawPlaceholderInRect = CGRectMake(0, 0, JobsWidth(255 - 20 - 40 - 5), JobsWidth(32));
        _textField.rightViewRectForBounds = CGRectMake(JobsWidth(255 - 20 - 40), JobsWidth(10), JobsWidth(40), JobsWidth(12));
        _textField.placeholderRectForBounds = CGRectMake(JobsWidth(10), JobsWidth(10), JobsWidth(255 - 20 - 40 - 5), 12);
        _textField.textRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);
        _textField.editingRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);

        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            return YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            self.textField.text = x;
            [self textFieldBlock:self.textField
                  textFieldValue:x];
        }];
        [_textField cornerCutToCircleWithCornerRadius:JobsWidth(8)];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(255), JobsWidth(32)));
            make.centerX.equalTo(self);
            make.top.equalTo(self.titleView.mas_bottom).offset(JobsWidth(10));
        }];
    }return _textField;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"请输入");
        _titleLab.textColor = JobsCor(@"#999999");
        _titleLab.font = UIFontWeightRegularSize(12);
//        _titleLab.backgroundColor = JobsGreenColor;
        _titleLab.height = JobsWidth(15);
        [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    }return _titleLab;
}

-(UIButton *)cancelBtn{
    if(!_cancelBtn){
        _cancelBtn = UIButton.new;
        _cancelBtn.normalTitle = Internationalization(@"取消");
        _cancelBtn.normalTitleColor = JobsCor(@"#333333");
        _cancelBtn.titleFont = UIFontWeightRegularSize(14);
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake([MSPayView viewSizeWithModel:nil].width / 2, JobsWidth(14)));
            make.left.equalTo(self);
            make.bottom.equalTo(self).offset(JobsWidth(-20));
        }];
        [_cancelBtn makeBtnLabelByShowingType:UILabelShowingType_01];
        @jobs_weakify(self)
        [_cancelBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if(self.objectBlock) self.objectBlock(self.cancelBtn);
//            [self.textField endEditing:YES];
            NSLog(@"取消");
            return nil;
        }];
    }return _cancelBtn;
}

-(UIButton *)sureBtn{
    if(!_sureBtn){
        _sureBtn = UIButton.new;
        _sureBtn.normalTitle = Internationalization(@"确认");
        _sureBtn.normalTitleColor = JobsCor(@"#DD0000");
        _sureBtn.titleFont = UIFontWeightRegularSize(14);
        [self addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake([MSPayView viewSizeWithModel:nil].width / 2, JobsWidth(14)));
            make.right.equalTo(self);
            make.bottom.equalTo(self).offset(JobsWidth(-20));
        }];
        [_sureBtn makeBtnLabelByShowingType:UILabelShowingType_01];
        @jobs_weakify(self)
        [_sureBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if(self.objectBlock) self.objectBlock(self.sureBtn);
            NSLog(@"确认");
            return nil;
        }];
    }return _sureBtn;
}


@end
