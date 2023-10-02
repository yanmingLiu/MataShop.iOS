//
//  MSMySocialVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMySocialVC.h"

@interface MSMySocialVC ()
/// UI
@property(nonatomic,strong)MSMySocialTitleView *mySocialTitleView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)MSCommentView *commentView;

@end

@implementation MSMySocialVC

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.mySocialTitleView.alpha = 1;
    self.titleLab.alpha = 1;
    self.commentView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
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
-(MSMySocialTitleView *)mySocialTitleView{
    if(!_mySocialTitleView){
        _mySocialTitleView = MSMySocialTitleView.new;
        [_mySocialTitleView richElementsInViewWithModel:nil];
        [self.view addSubview:_mySocialTitleView];
        [_mySocialTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view);
            make.size.mas_equalTo([MSMySocialTitleView viewSizeWithModel:nil]);
        }];
    }return _mySocialTitleView;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"评论");
        _titleLab.textColor = JobsCor(@"#333333");
        _titleLab.font = UIFontWeightBoldSize(18);
        [self.view addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(15));
            make.top.equalTo(self.mySocialTitleView.mas_bottom).offset(JobsWidth(25));
            make.height.mas_equalTo(JobsWidth(20));
        }];
        [_titleLab makeLabelByShowingType:UILabelShowingType_03];
    }return _titleLab;
}

-(MSCommentView *)commentView{
    if(!_commentView){
        _commentView = MSCommentView.new;
        [_commentView richElementsInViewWithModel:nil];
        [self.view addSubview:_commentView];
        [_commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }return _commentView;
}

@end
