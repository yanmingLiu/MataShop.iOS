//
//  MSDisburseVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/18/23.
//

#import "MSDisburseVC.h"

@interface MSDisburseVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <MSRedEnvelopeDetailModel *>*dataMutArr;

@end

@implementation MSDisburseVC

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB_SAMECOLOR(245);
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
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
#pragma mark —— UITableViewDelegate,UITableViewDataSource
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
    return [MSMSRedEnvelopeDetailTBVCell cellHeightWithModel:nil];
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSMSRedEnvelopeDetailTBVCell *cell = [MSMSRedEnvelopeDetailTBVCell cellStyleValue1WithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryNone;
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = AppMainCor_02;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        [self dataLinkByTableView:_tableView];
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        [_tableView registerTableViewClass];

        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                titleStr:Internationalization(@"暂无数据")
                                                               detailStr:Internationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _tableView.ly_emptyView.titleLabFont = UIFontWeightMediumSize(JobsWidth(16));
        }
    
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsWidth(12));
            make.width.mas_equalTo(JobsWidth(343));
            make.height.mas_equalTo([MSMSRedEnvelopeDetailTBVCell cellHeightWithModel:nil] * self.dataMutArr.count);
        }];
        [_tableView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return _tableView;
}

-(NSMutableArray<MSRedEnvelopeDetailModel *> *)dataMutArr{
    if(!_dataMutArr){
        _dataMutArr = NSMutableArray.array;
        {
            MSRedEnvelopeDetailModel *model = MSRedEnvelopeDetailModel.new;
            model.amountValue = Internationalization(@"-￥888.99");
            model.timeValue = Internationalization(@"2023.2.4 23:44:20");
            [_dataMutArr addObject:model];
        }
        
        {
            MSRedEnvelopeDetailModel *model = MSRedEnvelopeDetailModel.new;
            model.amountValue = Internationalization(@"-￥888.99");
            model.timeValue = Internationalization(@"2023.2.4 23:44:20");
            [_dataMutArr addObject:model];
        }
        
        {
            MSRedEnvelopeDetailModel *model = MSRedEnvelopeDetailModel.new;
            model.amountValue = Internationalization(@"-￥888.99");
            model.timeValue = Internationalization(@"2023.2.4 23:44:20");
            [_dataMutArr addObject:model];
        }
        
        {
            MSRedEnvelopeDetailModel *model = MSRedEnvelopeDetailModel.new;
            model.amountValue = Internationalization(@"-￥888.99");
            model.timeValue = Internationalization(@"2023.2.4 23:44:20");
            [_dataMutArr addObject:model];
        }
    }return _dataMutArr;
}

@end
