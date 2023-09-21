//
//  MSChuBaoView2.m
//  MataShop
//
//  Created by Jobs Hi on 9/11/23.
//

#import "MSChuBaoView2.h"

@interface MSChuBaoView2 ()
/// UI
//@property(nonatomic,strong)JobsUpDownLab *lab1;// 定期余额
//@property(nonatomic,strong)JobsUpDownLab *lab2;// 活期余额
//@property(nonatomic,strong)JobsUpDownLab *lab3;// 前一日定期收益
//@property(nonatomic,strong)JobsUpDownLab *lab4;// 前一日活期收益
//@property(nonatomic,strong)JobsUpDownLab *lab5;// 前一日总收益
//@property(nonatomic,strong)JobsUpDownLab *lab6;// 储宝总资产
/// Data
//@property(nonatomic,strong)JobsUpDownLabModel *labModel1;// 定期余额Data
//@property(nonatomic,strong)JobsUpDownLabModel *labModel2;// 活期余额Data
//@property(nonatomic,strong)JobsUpDownLabModel *labModel3;// 前一日定期收益Data
//@property(nonatomic,strong)JobsUpDownLabModel *labModel4;// 前一日活期收益Data
//@property(nonatomic,strong)JobsUpDownLabModel *labModel5;// 前一日总收益Data
//@property(nonatomic,strong)JobsUpDownLabModel *labModel6;// 储宝总资产Data

@end

@implementation MSChuBaoView2
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_chuBaoView2OnceToken = 0;
    static_chuBaoView2 = nil;
}

static MSChuBaoView2 *static_chuBaoView2 = nil;
static dispatch_once_t static_chuBaoView2OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_chuBaoView2OnceToken, ^{
        static_chuBaoView2 = MSChuBaoView2.new;
    });return static_chuBaoView2;
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
    MakeDataNull
//    self.lab1.alpha = 1;
//    self.lab2.alpha = 1;
//    self.lab3.alpha = 1;
//    self.lab4.alpha = 1;
//    self.lab5.alpha = 1;
//    self.lab6.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(156));
}
#pragma mark —— 一些私有方法
/// 配置数据源
//-(void)configLabModel:(JobsUpDownLabModel *)labModel{
//    labModel.upLabTextAlignment = NSTextAlignmentCenter;
//    labModel.upLabFont = JobsFontRegular(12);
//    labModel.upLabTextCor = RGBA_COLOR(136, 79, 2, 1);
//    labModel.upLabBgCor = JobsClearColor;
//
//    labModel.downLabTextAlignment = NSTextAlignmentCenter;
//    labModel.downLabFont = JobsFontBold(16);
//    labModel.downLabTextCor = RGBA_COLOR(51, 51, 51, 1);
//    labModel.downLabBgCor = JobsClearColor;
//
//    labModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    labModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//    labModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
//    labModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;
//
//    labModel.space = JobsWidth(3);
//}
#pragma mark —— lazyLoad
//-(JobsUpDownLab *)lab1{
//    if(!_lab1){
//        _lab1 = JobsUpDownLab.new;
//        [self addSubview:_lab1];
//        [_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).offset(JobsWidth(38));
//            make.top.equalTo(self).offset(JobsWidth(16));
//        }];
//        [_lab1 richElementsInViewWithModel:self.labModel1];
//        [self layoutIfNeeded];
//    }return _lab1;
//}
//
//-(JobsUpDownLab *)lab2{
//    if(!_lab2){
//        _lab2 = JobsUpDownLab.new;
//        [self addSubview:_lab2];
//        [_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self).offset(JobsWidth(-120));
//            make.top.equalTo(self).offset(JobsWidth(16));
//        }];
//        [_lab2 richElementsInViewWithModel:self.labModel2];
//        [self layoutIfNeeded];
//    }return _lab2;
//}
//
//-(JobsUpDownLab *)lab3{
//    if(!_lab3){
//        _lab3 = JobsUpDownLab.new;
//        [self addSubview:_lab3];
//        [_lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.lab1);
//            make.top.equalTo(self.lab1.mas_bottom).offset(JobsWidth(43));
//        }];
//        [_lab3 richElementsInViewWithModel:self.labModel3];
//        [self layoutIfNeeded];
//    }return _lab3;
//}
//
//-(JobsUpDownLab *)lab4{
//    if(!_lab4){
//        _lab4 = JobsUpDownLab.new;
//        [self addSubview:_lab4];
//        [_lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.lab2);
//            make.top.equalTo(self.lab3);
//        }];
//        [_lab4 richElementsInViewWithModel:self.labModel4];
//        [self layoutIfNeeded];
//    }return _lab4;
//}
//
//-(JobsUpDownLab *)lab5{
//    if(!_lab5){
//        _lab5 = JobsUpDownLab.new;
//        [self addSubview:_lab5];
//        [_lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.lab3);
//            make.top.equalTo(self.lab3.mas_bottom).offset(JobsWidth(43));
//        }];
//        [_lab5 richElementsInViewWithModel:self.labModel5];
//        [self layoutIfNeeded];
//    }return _lab5;
//}
//
//-(JobsUpDownLab *)lab6{
//    if(!_lab6){
//        _lab6 = JobsUpDownLab.new;
//        [self addSubview:_lab6];
//        [_lab6 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.lab4);
//            make.top.equalTo(self.lab5);
//        }];
//        [_lab6 richElementsInViewWithModel:self.labModel6];
//        [self layoutIfNeeded];
//    }return _lab6;
//}
//
//-(JobsUpDownLabModel *)labModel1{
//    if (!_labModel1) {
//        _labModel1 = JobsUpDownLabModel.new;
//    }
//    _labModel1.upLabText = Internationalization(@"定期余额") ;
//    _labModel1.downLabText = Internationalization(@"0000");
//    [self configLabModel:_labModel1];
//    return _labModel1;
//}
//
//-(JobsUpDownLabModel *)labModel2{
//    if (!_labModel2) {
//        _labModel2 = JobsUpDownLabModel.new;
//    }
//    _labModel2.upLabText = Internationalization(@"活期余额") ;
//    _labModel2.downLabText = Internationalization(@"1111");
//    [self configLabModel:_labModel2];
//    return _labModel2;
//}
//
//-(JobsUpDownLabModel *)labModel3{
//    if (!_labModel3) {
//        _labModel3 = JobsUpDownLabModel.new;
//    }
//    _labModel3.upLabText = Internationalization(@"前一日定期收益") ;
//    _labModel3.downLabText = Internationalization(@"2222");
//    [self configLabModel:_labModel3];
//    return _labModel3;
//}
//
//-(JobsUpDownLabModel *)labModel4{
//    if (!_labModel4) {
//        _labModel4 = JobsUpDownLabModel.new;
//    }
//    _labModel4.upLabText = Internationalization(@"前一日活期收益") ;
//    _labModel4.downLabText = Internationalization(@"3333");
//    [self configLabModel:_labModel4];
//    return _labModel4;
//}
//
//-(JobsUpDownLabModel *)labModel5{
//    if (!_labModel5) {
//        _labModel5 = JobsUpDownLabModel.new;
//    }
//    _labModel5.upLabText = Internationalization(@"前一日总收益") ;
//    _labModel5.downLabText = Internationalization(@"4444");
//    [self configLabModel:_labModel5];
//    return _labModel5;
//}
//
//-(JobsUpDownLabModel *)labModel6{
//    if (!_labModel6) {
//        _labModel6 = JobsUpDownLabModel.new;
//    }
//    _labModel6.upLabText = Internationalization(@"储宝总资产") ;
//    _labModel6.downLabText = Internationalization(@"5555");
//    [self configLabModel:_labModel6];
//    return _labModel6;
//}


@end
