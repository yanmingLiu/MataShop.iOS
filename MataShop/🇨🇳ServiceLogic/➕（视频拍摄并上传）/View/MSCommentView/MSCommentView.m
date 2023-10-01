//
//  MSCommentView.m
//  MataShop
//
//  Created by Jobs Hi on 10/1/23.
//

#import "MSCommentView.h"
#define kTableViewHeaderID @"kTableViewHeaderID"
@interface MSCommentView ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray *dataList;

@end

@implementation MSCommentView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_commentViewOnceToken = 0;
    static_commentView = nil;
}

static MSCommentView *static_commentView = nil;
static dispatch_once_t static_commentViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_commentViewOnceToken, ^{
        static_commentView = MSCommentView.new;
    });return static_commentView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsAddNotification(self,
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
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— 一些私有方法
- (void)gestureTapped:(UIGestureRecognizer *)gesture{
    UIView *header = gesture.view;
    NSInteger section = header.tag;
    [self.tableView ww_foldSection:section fold:![self.tableView ww_isSectionFolded:section]];
    
}
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.tableView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return BaiShaETProjTipsViewSize();
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    BaseTableViewCell *cell = (BaseTableViewCell *)self.tableViewCellMutArr[indexPath.section][indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.indexPath = indexPath;
//    switch (indexPath.section) {
//        case 0:
//            [cell richElementsInCellWithModel:nil];
//            break;
//        case 1:
//        case 2:
//            [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section - 1][indexPath.row]];
//            break;
//        default:
//            [cell richElementsInCellWithModel:nil];
//            break;
//    }return cell;
    
    static NSString *reuseId = @"CELLID";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    NSString *rowData = self.dataList[indexPath.row];
    
    NSString *rowName = rowData;
    NSArray *nameArray = [rowData componentsSeparatedByString:@"-"];
    if(nameArray.count == 2){
        rowName = nameArray[0];
    }
    
    cell.textLabel.text = rowName;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = nil;
    
    header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableViewHeaderID];
    if(!header){
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kTableViewHeaderID];
        UITapGestureRecognizer *tapgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapped:)];
        [header addGestureRecognizer:tapgr];
    }
    
    if(header){
        header.textLabel.text = [NSString stringWithFormat:@"第%@组", @(section+1)];
        header.tag = section;
    }
    
    return header;
}
#pragma mark —— lazyLoad
-(NSMutableArray *)dataList{
    if(!_dataList){
        _dataList = NSMutableArray.array;
        [_dataList addObject:@"FileManage"];
        [_dataList addObject:@"ViewControllerTransition"];
        [_dataList addObject:@"ThreadViewController"];
        [_dataList addObject:@"MemoryLeak"];
        [_dataList addObject:@"——————————————————"];
    }return _dataList;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStyleGrouped;
        _tableView.ww_foldable = YES;
        [self dataLinkByTableView:_tableView];
        _tableView.backgroundColor = AppMainCor_02;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = Internationalization(@"");
            refreshConfigFooter.pullingTitle = Internationalization(@"");;
            refreshConfigFooter.refreshingTitle = Internationalization(@"");;
            refreshConfigFooter.willRefreshTitle = Internationalization(@"");;
            refreshConfigFooter.noMoreDataTitle = Internationalization(@"");;
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                titleStr:Internationalization(@"暂无数据")
                                                               detailStr:Internationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _tableView.ly_emptyView.titleLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightMedium];
        }
        
//        {/// 设置tabAnimated相关属性
//            // 可以不进行手动初始化，将使用默认属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:DDSignlePeopleCell.class
//                                                                  cellHeight:74.5];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
//        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

    }return _tableView;
}

@end
