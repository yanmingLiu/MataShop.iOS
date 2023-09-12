//
//  MSAboutChuBaoVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/12/23.
//

#import "MSAboutChuBaoVC.h"

@interface MSAboutChuBaoVC ()
/// UI
@property(nonatomic,strong)UITextView *textView;

@end

@implementation MSAboutChuBaoVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
    self.viewModel.textModel.textCor = RGBA_COLOR(51, 51, 51, 1);
    self.viewModel.textModel.text = Internationalization(@"关于储宝");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.textView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad
-(UITextView *)textView{
    if (!_textView) {
        _textView = UITextView.new;
        _textView.text = Internationalization(@"\n\n    1、储宝会次日结算上一结息日的利息；\n\n    2、关于储宝各产品利率：\n        2.2、储宝当前活期日化利率：0.078%\n        2.3、储宝当前7日封闭定期日化利率：7天日化率利0.162%赎回时间D➕0<未满时间赎回扣除15%违约手续金>\n        2.4、储宝当前30日封闭定期日化利率：0.242%\n        2.5、储宝当前120日封闭定期日化利率：0.357%\n        2.6、储宝当前1年封闭定期日化利率：0.526%\n        2.7、储宝当前3年封闭定期日化利率：0.688%\n        2.8、储宝当前5年封闭定期日化利率：0.914%\n\n    3、关于推荐奖\n        3.1、直接推荐奖 = 5% * 盈利分红\n        3.2、助力（间推）奖 = 10% * 盈利分红\n        3.3、对于奖励，需要进行理财产品结算分红以后，以后方可获得");
        _textView.font = UIFontWeightRegularSize(12);
        _textView.textColor = RGBA_COLOR(51, 51, 51, 1);
        _textView.editable = NO;
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(339)));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(5));
        }];
        [_textView cornerCutToCircleWithCornerRadius:8];
        [_textView layerBorderColour:RGBA_COLOR(255, 255, 144, 1) andBorderWidth:0.5f];
    }return _textView;
}

@end
