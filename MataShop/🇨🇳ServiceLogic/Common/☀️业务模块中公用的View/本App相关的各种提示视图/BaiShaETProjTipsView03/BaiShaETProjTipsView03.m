//
//  BaiShaETProjTipsView03.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaiShaETProjTipsView03.h"

@interface BaiShaETProjTipsView03 (){
    CGSize submitBtnSize;
}

@end

@implementation BaiShaETProjTipsView03

@synthesize viewModel = _viewModel;
@synthesize submitBtn = _submitBtn;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_tipsView03OnceToken = 0;
    static_tipsView03 = nil;
}

static BaiShaETProjTipsView03 *static_tipsView03 = nil;
static dispatch_once_t static_tipsView03OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_tipsView03OnceToken, ^{
        static_tipsView03 = BaiShaETProjTipsView03.new;
    });return static_tipsView03;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
        submitBtnSize = CGSizeMake(JobsWidth(114), JobsWidth(36));
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.titleIMGV.image = JobsIMG(@"404");
    [self.titleIMGV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(100)));
    }];
    self.subTitleIMGV.alpha = 1;
    self.tipsLab.text = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"您的網絡出現異常，請檢杳網絡是\n否正常或刷新試試 "): self.viewModel.textModel.text;
    @jobs_weakify(self)
    [self.submitBtn btnClickEventBlock:^(id data) {
        @jobs_strongify(self)
        [self JobsTestPopView:@"点我刷新"];
    }];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— lazyLoad
-(UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = UIButton.new;
        _submitBtn.normalTitle = Internationalization(@"点我刷新");
        _submitBtn.normalBackgroundImage = JobsIMG(@"充值提交");
        _submitBtn.normalTitleColor = JobsBlackColor;
        [self.subTitleIMGV addSubview:_submitBtn];
        [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo(submitBtnSize);
            make.top.equalTo(self.tipsLab.mas_bottom).offset(JobsWidth(50));
        }];
        [_submitBtn cornerCutToCircleWithCornerRadius:submitBtnSize.height / 2];
    }return _submitBtn;
}

@end
