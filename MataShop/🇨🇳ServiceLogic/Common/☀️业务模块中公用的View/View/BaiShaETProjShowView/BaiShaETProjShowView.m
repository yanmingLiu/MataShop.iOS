//
//  BaiShaETProjShowView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/27.
//

#import "BaiShaETProjShowView.h"

@interface BaiShaETProjShowView ()
// UI
@property(nonatomic,strong)JobsLeftRightLab *amountValueLab;// 投注额
@property(nonatomic,strong)JobsLeftRightLab *resultValueLab;// 输赢
@property(nonatomic,strong)JobsLeftRightLab *totalValueLab;// 单数
// Data
@property(nonatomic,strong)JobsLeftRightLabModel *amountValueModel;
@property(nonatomic,strong)JobsLeftRightLabModel *resultValueModel;
@property(nonatomic,strong)JobsLeftRightLabModel *totalValueModel;

@end

@implementation BaiShaETProjShowView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_showViewOnceToken = 0;
    static_showView = nil;
}

static BaiShaETProjShowView *static_showView = nil;
static dispatch_once_t static_showViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_showViewOnceToken, ^{
        static_showView = BaiShaETProjShowView.new;
    });return static_showView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xFFFCF7);
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    MakeDataNull
    self.amountValueLab.alpha = 1;
    self.resultValueLab.alpha = 1;
    self.totalValueLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— lazyLoad
-(JobsLeftRightLab *)amountValueLab{
    if (!_amountValueLab) {
        _amountValueLab = JobsLeftRightLab.new;
        [self addSubview:_amountValueLab];
        [_amountValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(16));
            {
                UIViewModel *vm = UIViewModel.new;
                
                vm.textModel.textLineSpacing = 0;
                vm.textModel.font = UIFontWeightRegularSize(14);
                vm.textModel.jobsHeight = JobsWidth(20);
                vm.textModel.text = Internationalization([@"投注额" stringByAppendingString:@"2.99"]);
                vm.textModel.textCor = HEXCOLOR(0x757575);
                
                CGFloat width = [UIView widthByData:vm];
                width += self.amountValueModel.space + JobsWidth(5);// JobsWidth(5) 是补偿值
                
                make.size.mas_equalTo(CGSizeMake(width, JobsWidth(20)));
            }
        }];
        [_amountValueLab richElementsInViewWithModel:self.amountValueModel];
    }return _amountValueLab;
}

-(JobsLeftRightLab *)resultValueLab{
    if (!_resultValueLab) {
        _resultValueLab = JobsLeftRightLab.new;
        [self addSubview:_resultValueLab];
        [_resultValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            
            {
                UIViewModel *vm = UIViewModel.new;
                
                vm.textModel.textLineSpacing = 0;
                vm.textModel.font = UIFontWeightRegularSize(14);
                vm.textModel.jobsHeight = JobsWidth(20);
                vm.textModel.text = Internationalization([@"输赢" stringByAppendingString:@"+2.99"]);
                
                CGFloat width = [UIView widthByData:vm];
                width += self.resultValueModel.space + JobsWidth(5);// JobsWidth(5) 是补偿值
                
                make.size.mas_equalTo(CGSizeMake(width, JobsWidth(20)));
            }
        }];
        [_resultValueLab richElementsInViewWithModel:self.resultValueModel];
    }return _resultValueLab;
}

-(JobsLeftRightLab *)totalValueLab{
    if (!_totalValueLab) {
        _totalValueLab = JobsLeftRightLab.new;
        [self addSubview:_totalValueLab];
        [_totalValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-16));
            
            {
                UIViewModel *vm = UIViewModel.new;
                
                vm.textModel.textLineSpacing = 0;
                vm.textModel.font = UIFontWeightRegularSize(14);
                vm.textModel.jobsHeight = JobsWidth(20);
                vm.textModel.text = Internationalization([@"    |    " stringByAppendingString:@"总33单"]);
                
                CGFloat width = [UIView widthByData:vm];
                width += self.resultValueModel.space + JobsWidth(5);// JobsWidth(5) 是补偿值
                
                make.size.mas_equalTo(CGSizeMake(width, JobsWidth(20)));
            }
        }];
        [_totalValueLab richElementsInViewWithModel:self.totalValueModel];
    }return _totalValueLab;
}

-(JobsLeftRightLabModel *)amountValueModel{
    if (!_amountValueModel) {
        _amountValueModel = JobsLeftRightLabModel.new;
        _amountValueModel.upLabText = Internationalization(@"投注额");
        _amountValueModel.upLabTextAlignment = NSTextAlignmentCenter;
        _amountValueModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _amountValueModel.upLabTextCor = HEXCOLOR(0x757575);
        _amountValueModel.upLabBgCor = UIColor.clearColor;

        _amountValueModel.downLabText = @"2.99";
        _amountValueModel.downLabTextAlignment = NSTextAlignmentCenter;
        _amountValueModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightBold];
        _amountValueModel.downLabTextCor = HEXCOLOR(0x757575);
        _amountValueModel.downLabBgCor = UIColor.clearColor;

        _amountValueModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _amountValueModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _amountValueModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _amountValueModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;

        _amountValueModel.space = JobsWidth(12);
        _amountValueModel.labelShowingType = UILabelShowingType_03;
    }return _amountValueModel;
}

-(JobsLeftRightLabModel *)resultValueModel{
    if (!_resultValueModel) {
        _resultValueModel = JobsLeftRightLabModel.new;
        _resultValueModel.upLabText = Internationalization(@"输赢");
        _resultValueModel.upLabTextAlignment = NSTextAlignmentCenter;
        _resultValueModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _resultValueModel.upLabTextCor = HEXCOLOR(0x757575);
        _resultValueModel.upLabBgCor = UIColor.clearColor;

        _resultValueModel.downLabText = @"+2.99";
        _resultValueModel.downLabTextAlignment = NSTextAlignmentCenter;
        _resultValueModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightBold];
        _resultValueModel.downLabTextCor = HEXCOLOR(0x757575);
        _resultValueModel.downLabBgCor = UIColor.clearColor;

        _resultValueModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _resultValueModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _resultValueModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _resultValueModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;

        _resultValueModel.space = JobsWidth(12);
        _resultValueModel.labelShowingType = UILabelShowingType_03;
    }return _resultValueModel;
}

-(JobsLeftRightLabModel *)totalValueModel{
    if (!_totalValueModel) {
        _totalValueModel = JobsLeftRightLabModel.new;
        _totalValueModel.upLabText = Internationalization(@"    |    ");
        _totalValueModel.upLabTextAlignment = NSTextAlignmentCenter;
        _totalValueModel.upLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _totalValueModel.upLabTextCor = HEXCOLOR(0x757575);
        _totalValueModel.upLabBgCor = UIColor.clearColor;

        _totalValueModel.downLabText = @"总33单";
        _totalValueModel.downLabTextAlignment = NSTextAlignmentCenter;
        _totalValueModel.downLabFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightBold];
        _totalValueModel.downLabTextCor = HEXCOLOR(0x757575);
        _totalValueModel.downLabBgCor = UIColor.clearColor;

        _totalValueModel.upLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _totalValueModel.upLabLevelAlign = JobsUpDownLabAlign_TopLeft;
        _totalValueModel.downLabVerticalAlign = JobsUpDownLabAlign_TopLeft;
        _totalValueModel.downLabLevelAlign = JobsUpDownLabAlign_TopLeft;

        _totalValueModel.space = JobsWidth(12);
        _totalValueModel.labelShowingType = UILabelShowingType_03;
    }return _totalValueModel;
}

@end
