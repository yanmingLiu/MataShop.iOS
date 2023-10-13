//
//  MSPersonalDataVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/18/23.
//

#import "MSPersonalDataVC.h"

@interface MSPersonalDataVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MSPersonalDataVC

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
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = Internationalization(@"个人资料");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
//    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = RGB_SAMECOLOR(245);
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.tableView.alpha = 1;
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
#pragma mark —— 一些私有方法

#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(48);
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *cell = [BaseTableViewCell cellStyleValue1WithTableView:tableView];
    cell.textLabel.text = self.dataMutArr[indexPath.row].textModel.text;
    cell.textLabel.textColor = RGB_SAMECOLOR(109);
    cell.textLabel.font = UIFontWeightRegularSize(16);
    
    cell.detailTextLabel.text = self.dataMutArr[indexPath.row].subTextModel.text;
    cell.detailTextLabel.font = UIFontWeightRegularSize(16);
    [cell.detailTextLabel makeLabelByShowingType:UILabelShowingType_03];
    
    if(indexPath.row){
        cell.detailTextLabel.textColor = RGB_SAMECOLOR(51);
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.imageView.image = self.dataMutArr[indexPath.row].image;
        cell.imageViewFrameOffsetX = JobsWidth(250);
        cell.textLabelFrameOffsetX = JobsWidth(-65);
        cell.imageViewFrameOffsetWidth = JobsWidth(-5);
        cell.imageViewFrameOffsetHeight = JobsWidth(-5);
        cell.detailTextLabel.textColor = JobsClearColor;
    }return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        [self dataLinkByTableView:_tableView];
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        [_tableView registerTableViewClass];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(345), self.dataMutArr.count * JobsWidth(48)));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
        }];
        [_tableView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"头像");
            viewModel.image = JobsIMG(@"用户默认头像");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"昵称");
            viewModel.subTextModel.text = Internationalization(@"JobsGo");
            [_dataMutArr addObject:viewModel];
        }

        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"实名认证");
            viewModel.subTextModel.text = Internationalization(@"");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"绑定银行卡");
            viewModel.subTextModel.text = Internationalization(@"");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"收货地址");
            viewModel.subTextModel.text = Internationalization(@"");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"修改密码");
            viewModel.subTextModel.text = Internationalization(@"");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"设置支付密码");
            viewModel.subTextModel.text = Internationalization(@"");
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

@end
