//
//  MSDoorVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import "MSDoorVC.h"

@interface MSDoorVC ()
/// UI
@property(nonatomic,strong)UIImageView *logoImageView;
@property(nonatomic,strong)JobsContainerView *titleLab;
@property(nonatomic,strong)JXCategoryTitleView *categoryView;
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
@property(nonatomic,strong)UIButton *registerBtn;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *agreeBtn;/// 阅读并同意
@property(nonatomic,strong)UIButton *privacyBtn;/// 隐私政策
@property(nonatomic,strong)UILabel *label;/// 和
@property(nonatomic,strong)UIButton *userAgreementBtn;/// 用户协议
@property(nonatomic,strong)MSThirdPartyShortcutLoginPanelView *thirdPartyShortcutLoginPanelView;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsBtnModel *>*btnModelMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;

@end

@implementation MSDoorVC

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
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
//    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
//    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsCor(@"#FFFFFF");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.logoImageView.alpha = 1;
    self.titleLab.alpha = 1;
    self.categoryView.alpha = 1;
    self.registerBtn.alpha = 1;
    self.loginBtn.alpha = 1;
    
    self.agreeBtn.alpha = 1;
    self.privacyBtn.alpha = 1;
    self.label.alpha = 1;
    self.userAgreementBtn.alpha = 1;
    self.thirdPartyShortcutLoginPanelView.alpha = 1;
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
#pragma mark JXCategoryTitleViewDataSource
//// 如果将JXCategoryTitleView嵌套进UITableView的cell，每次重用的时候，JXCategoryTitleView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该代理方法返回给JXCategoryTitleView。
//// 如果实现了该方法就以该方法返回的宽度为准，不触发内部默认的文字宽度计算。
//- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView
//               widthForTitle:(NSString *)title{
//
//    return 10;
//}
#pragma mark JXCategoryListContainerViewDelegate
/**
 返回list的数量

 @param listContainerView 列表的容器视图
 @return list的数量
 */
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
    return self.titleMutArr.count;
}
/**
 根据index初始化一个对应列表实例，需要是遵从`JXCategoryListContentViewDelegate`协议的对象。
 如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIView即可。
 如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIViewController即可。

 @param listContainerView 列表的容器视图
 @param index 目标下标
 @return 遵从JXCategoryListContentViewDelegate协议的list实例
 */
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView
                                          initListForIndex:(NSInteger)index{
    return self.childVCMutArr[index];
}
#pragma mark JXCategoryViewDelegate
//传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
     [self.listContainerView didClickSelectedItemAtIndex:index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{}
//传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
scrollingFromLeftIndex:(NSInteger)leftIndex
        toRightIndex:(NSInteger)rightIndex
               ratio:(CGFloat)ratio {
    NSLog(@"");
//    [self.listContainerView scrollingFromLeftIndex:leftIndex
//                                      toRightIndex:rightIndex
//                                             ratio:ratio
//                                     selectedIndex:categoryView.selectedIndex];
}
#pragma mark —— lazyLoad
-(UIImageView *)logoImageView{
    if(!_logoImageView){
        _logoImageView = UIImageView.new;
        /// 添加阴影效果
        _logoImageView.layer.shadowColor = UIColor.blackColor.CGColor; // 阴影颜色
        _logoImageView.layer.shadowOpacity = 0.5; // 阴影不透明度
        _logoImageView.layer.shadowRadius = 5.0; // 阴影半径
        _logoImageView.layer.shadowOffset = CGSizeMake(0, 4); // 阴影偏移量
        
        _logoImageView.image = JobsIMG(@"Logo");
        [self.view addSubview:_logoImageView];
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(100)));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsWidth(70));
        }];
    }return _logoImageView;
}

-(JobsContainerView *)titleLab{
    if(!_titleLab){
        _titleLab = [JobsContainerView.alloc initWithWidth:JobsWidth(252)
                                              buttonModels:self.btnModelMutArr];
        [self.view addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_titleLab.jobsSize);
            make.top.equalTo(self.logoImageView.mas_bottom).offset(JobsWidth(10));
            make.centerX.equalTo(self.view);
        }];
    }return _titleLab;
}

-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.delegate = self;
        _categoryView.backgroundColor = UIColor.clearColor;
        _categoryView.titleSelectedColor = JobsCor(@"#DD0000");
        _categoryView.titleColor = JobsCor(@"#666666");
        _categoryView.titleFont = UIFontWeightRegularSize(16);
        _categoryView.titleSelectedFont = UIFontWeightRegularSize(16);
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.contentScrollView = self.listContainerView.scrollView;// 关联cotentScrollView，关联之后才可以互相联动！！!
        _categoryView.indicators = @[self.lineView];
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(83));
            make.left.equalTo(self.view);
            make.height.mas_equalTo(listContainerViewDefaultOffset);
            make.width.mas_equalTo(JobsMainScreen_WIDTH() / 2);
        }];
        [self.view layoutIfNeeded];
    }return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.indicatorColor = JobsCor(@"#DD0000");
        _lineView.indicatorHeight = JobsWidth(4);
        _lineView.indicatorWidthIncrement = JobsWidth(10);
        _lineView.verticalMargin = 0;
    }return _lineView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        [self.view addSubview:_listContainerView];
        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(listContainerViewDefaultOffset + JobsWidth(83));
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(132 + 30));
        }];
        [self.view layoutIfNeeded];
    }return _listContainerView;
}

-(UIButton *)registerBtn{
    if(!_registerBtn){
        _registerBtn = UIButton.new;
        _registerBtn.normalTitle = Internationalization(@"注册账号");
        _registerBtn.normalTitleColor = JobsCor(@"#333333");
        _registerBtn.titleFont = UIFontWeightRegularSize(JobsWidth(14));
        [self.view addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(14)));
            make.height.mas_equalTo(JobsWidth(14));
            make.left.equalTo(self.view).offset(JobsWidth(40));
            make.top.equalTo(self.listContainerView.mas_bottom);
        }];
        [_registerBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        @jobs_weakify(self)
        [_registerBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"注册账号");
        }];
    }return _registerBtn;
}

-(UIButton *)loginBtn{
    if(!_loginBtn){
        _loginBtn = UIButton.new;
        _loginBtn.normalTitle = Internationalization(@"登录");
        _loginBtn.titleFont = UIFontWeightRegularSize(JobsWidth(14));
        _loginBtn.normalTitleColor = JobsWhiteColor;
        _loginBtn.backgroundColor = JobsCor(@"#DD0000");
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(315), JobsWidth(48)));
            make.left.equalTo(self.view).offset(JobsWidth(40));
            make.top.equalTo(self.registerBtn.mas_bottom).offset(JobsWidth(50));
        }];
        [_loginBtn cornerCutToCircleWithCornerRadius:JobsWidth(24)];
        @jobs_weakify(self)
        [_loginBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"登录账号");
        }];
    }return _loginBtn;
}

-(UIButton *)agreeBtn{
    if(!_agreeBtn){
        _agreeBtn = UIButton.new;
        _agreeBtn.normalTitle = Internationalization(@"阅读并同意");
        _agreeBtn.normalTitleColor = JobsCor(@"#333333");
        _agreeBtn.titleFont = UIFontWeightRegularSize(JobsWidth(12));
        _agreeBtn.normalImage = JobsIMG(@"登录-未同意");
        _agreeBtn.selectedImage = JobsIMG(@"登录-同意");
        _agreeBtn.backgroundColor = UIColor.clearColor;
        [self.view addSubview:_agreeBtn];
        [_agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.left.equalTo(self.loginBtn);
            make.top.equalTo(self.loginBtn.mas_bottom).offset(JobsWidth(20));
        }];
        [_agreeBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        [self.view layoutIfNeeded];
        [_agreeBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleLeft
                                   imageTitleSpace:JobsWidth(4)];
        @jobs_weakify(self)
        [_agreeBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"阅读并同意");
            x.selected = !x.selected;
        }];
    }return _agreeBtn;
}

-(UIButton *)privacyBtn{
    if(!_privacyBtn){
        _privacyBtn = UIButton.new;
        _privacyBtn.normalTitle = Internationalization(@"《隐私政策》");
        _privacyBtn.normalTitleColor = JobsCor(@"#DD0000");
        _privacyBtn.titleFont = UIFontWeightRegularSize(JobsWidth(12));
        _privacyBtn.backgroundColor = UIColor.clearColor;
        [self.view addSubview:_privacyBtn];
        [_privacyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.top.equalTo(self.agreeBtn);
            make.left.equalTo(self.agreeBtn.mas_right);
        }];
        [_privacyBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        @jobs_weakify(self)
        [_privacyBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"隐私政策");
        }];
    }return _privacyBtn;
}

-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.text = Internationalization(@" 和 ");
        _label.textColor = JobsCor(@"#333333");
        _label.font = UIFontWeightRegularSize(JobsWidth(12));
        _label.backgroundColor = UIColor.clearColor;
        [self.view addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.top.equalTo(self.agreeBtn);
            make.left.equalTo(self.privacyBtn.mas_right);
        }];
    }return _label;
}

-(UIButton *)userAgreementBtn{
    if(!_userAgreementBtn){
        _userAgreementBtn = UIButton.new;
        _userAgreementBtn.normalTitle = Internationalization(@"《用户协议》");
        _userAgreementBtn.normalTitleColor = JobsCor(@"#DD0000");
        _userAgreementBtn.titleFont = UIFontWeightRegularSize(JobsWidth(12));
        _userAgreementBtn.backgroundColor = UIColor.clearColor;
        [self.view addSubview:_userAgreementBtn];
        [_userAgreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.top.equalTo(self.agreeBtn);
            make.left.equalTo(self.label.mas_right);
        }];
        [_userAgreementBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        @jobs_weakify(self)
        [_userAgreementBtn jobsBtnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            NSLog(@"用户协议");
        }];
    }return _userAgreementBtn;
}

-(MSThirdPartyShortcutLoginPanelView *)thirdPartyShortcutLoginPanelView{
    if(!_thirdPartyShortcutLoginPanelView){
        _thirdPartyShortcutLoginPanelView = MSThirdPartyShortcutLoginPanelView.new;
        [self.view addSubview:_thirdPartyShortcutLoginPanelView];
        [_thirdPartyShortcutLoginPanelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([MSThirdPartyShortcutLoginPanelView viewSizeWithModel:nil]);
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
    }return _thirdPartyShortcutLoginPanelView;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        [_childVCMutArr addObject:MSPasswordLoginVC.new];/// 密码登录
        [_childVCMutArr addObject:MSMessageLoginVC.new];/// 短信登录
    }return _childVCMutArr;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:Internationalization(@"密码登录")];
        [_titleMutArr addObject:Internationalization(@"短信登录")];
    }return _titleMutArr;
}

-(NSMutableArray<JobsBtnModel *> *)btnModelMutArr{
    if(!_btnModelMutArr){
        _btnModelMutArr = NSMutableArray.array;
        {
            JobsBtnModel *model = JobsBtnModel.new;
            model.backgroundColor = UIColor.clearColor;
            model.title = Internationalization(@"欢迎来到Mata商城");
            model.font = UIFontWeightBoldSize(26);
            model.titleColor = JobsCor(@"#333333");
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
            model.title = Internationalization(@"登陆探索更多潮玩惊喜");
            model.font = UIFontWeightRegularSize(16);
            model.titleColor = JobsCor(@"#666666");
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentSpacing = JobsWidth(10);
            model.lineBreakMode = NSLineBreakByWordWrapping;
            model.btnWidth = JobsWidth(145);

            [_btnModelMutArr addObject:model];
        }
        
    }return _btnModelMutArr;
}

@end
