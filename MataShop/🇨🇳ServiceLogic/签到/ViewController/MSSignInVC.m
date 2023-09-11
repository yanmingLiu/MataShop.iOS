//
//  MSSignInVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSSignInVC.h"

NSString *const 日历数组信息 = @"日历数组信息";
@interface MSSignInVC ()
/// UI
@property(nonatomic,strong)UIImageView *backIMGV;
@property(nonatomic,strong)UIImageView *calendarBack;// 日历的背景
@property(nonatomic,strong)UIButton *signBtn;// 签到按钮
@property(nonatomic,strong)FSCalendar *calendar;
/// Data
@property(nonatomic,strong)NSCalendar *gregorian;
@property(nonatomic,assign)NSInteger SignCount;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,strong)NSDateFormatter *dateFormatter;
@property(nonatomic,strong)NSDate *minimumDate;
@property(nonatomic,strong)NSDate *maximumDate;
@property(nonatomic,strong)NSCache *cache;
@property(nonatomic,assign)BOOL showsLunar;
@property(nonatomic,assign)BOOL showsEvents;
@property(nonatomic,strong)LunarFormatter *lunarFormatter;
@property(nonatomic,strong)NSArray<EKEvent *> *events;
@property(nonatomic,strong)NSArray *timeArr;
@property(nonatomic,strong)NSMutableArray *signInList;// 签到列表
@property(nonatomic,strong)NSString *dateStr;// 记录年月(正式使用时,不需要此属性)

@end

@implementation MSSignInVC

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

    self.viewModel.backBtnTitleModel.text = @"";
    self.viewModel.textModel.textCor = RGBA_COLOR(51, 51, 51, 1);
    self.viewModel.textModel.text = Internationalization(@"签到");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
//    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    
    self.backIMGV.alpha = 1;
    self.calendarBack.alpha = 1;
    self.signBtn.alpha = 1;
    
    [self calendarConfig];/// 日历配置
    [self getCache];/// 1.加载缓存的日期,并选中
    [self getSign];/// 2.从网络获取其签到结果,如果发现请求的结果中存在没有被选中,就将其选中,并加载到缓存中
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    //布局FSCalendar
    self.calendar.frame = CGRectMake(0,
                                     CGRectGetMaxY(self.navigationController.navigationBar.frame),
                                     JobsMainScreen_WIDTH() - JobsWidth(50),
                                     JobsWidth(300));
    [self.calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(JobsMainScreen_WIDTH() - JobsWidth(50));
        make.height.mas_equalTo(JobsWidth(300));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(JobsWidth(50));
    }];

    //布局签到按钮
    int signHeight = JobsWidth(60);
    [self.signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.calendar.width / JobsWidth(1.2));
        make.height.mas_equalTo(35);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(CGRectGetMaxY(self.calendar.frame) + signHeight + JobsWidth(44));
    }];
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

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    DeleUserDefaultWithKey(日历数组信息);/// 清除缓存
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"");
}
#pragma mark —— 一些私有方法
/// 加载缓存
- (void)getCache{
    /// 从缓存中先把数据取出来
    NSMutableArray *cache = GetUserDefaultObjForKey(日历数组信息);
    /// 允许用户选择,其实是允许系统来选中签到日期
    self.calendar.allowsSelection = YES;
    self.calendar.allowsMultipleSelection = YES;
    if (cache.count) {//如果cache里面有数据
        /// 选中日期,只有不在选中之列的才去选中它
        for (NSInteger i = 0; i<cache.count; i++) {
            if (![self.calendar.selectedDates containsObject:cache[i]]) {
                [self.calendar selectDate:cache[i]];
            }
        }
    }else{/// 如果cache里面没有数据,说明第一次启动
        /// 创建个可变数组储存进缓存(必要)
        SetUserDefaultKeyWithValue(日历数组信息, NSMutableArray.array);
        UserDefaultSynchronize;
    }
    /// 选择完毕后关闭可选项,不让用户自己点
    self.calendar.allowsSelection = NO;
}
/// 从网络获取所有签到结果
- (void)getSign{
    //在这里假装网络请求所有的签到结果(signInList)成功了
    NSLog(@"%@",self.signInList);
    //获取签到总数量
    self.SignCount = self.signInList.count;
    //常见临时数组dataArrayCache,用于存放签到结果(可能有的人觉得这一步不需要,但是咱们假设的签到结果里面只有纯日期,正式项目中可不一定如此)
    NSMutableArray *dataArrayCache = NSMutableArray.array;
    if (self.SignCount) {//如果请求的数据有效
        for (NSString *dateStr in self.signInList) {
            //把所有签到数据取出来添加进临时数组
            NSDate *date = [self.dateFormatter dateFromString:dateStr];
            if(date){
                [dataArrayCache addObject:date];
            }
        }
        //用偏好设置保存签到数据到本地缓存
        SetUserDefaultKeyWithValue(日历数组信息, dataArrayCache);
        UserDefaultSynchronize;
        //保存后重新加载缓存数据
        [self getCache];
    }
}
/// 获取日历范围,让日历出现时就知道该显示哪个月了哪一页了(根据系统时间来获取)
+(NSArray *)getStartTimeAndFinalTime{
    NSDateFormatter *formatter = NSDateFormatter.new;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *currentTimeString = [formatter stringFromDate:NSDate.date];
    
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    
    NSDate *newDate = [formatter dateFromString:currentTimeString];
    BOOL OK = [NSCalendar.currentCalendar rangeOfUnit:NSCalendarUnitMonth
                                            startDate:&firstDate
                                             interval:&interval
                                              forDate:newDate];
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
    }else {
        return @[@"",@""];
    }
    NSString *firstString = [formatter stringFromDate: firstDate];
    NSString *lastString = [formatter stringFromDate: lastDate];
    /// 返回数据为日历要显示的最小日期firstString和最大日期lastString
    return @[firstString, lastString];
}
/// 配置日历
- (void)calendarConfig{
    //载入节假日
    [self loadCalendarEvents];
    //显示农历
    [self lunarItemClicked];
    //显示节假日
    [self eventItemClicked];
}
/// 显示农历
- (void)lunarItemClicked{
    self.showsLunar = !self.showsLunar;
    [self.calendar reloadData];
}
/// 显示节日
- (void)eventItemClicked{
    self.showsEvents = !self.showsEvents;
    [self.calendar reloadData];
}
/// 数据源方法,根据是否显示节日和农历
- (NSString *)calendar:(FSCalendar *)calendar
       subtitleForDate:(NSDate *)date{
    if (self.showsEvents) {// 如果要求显示节日
        EKEvent *event = [self eventsForDate:date].firstObject;
        if (event) return event.title;
    }
    if (self.showsLunar) {// 如果要求显示农历
        return [self.lunarFormatter stringFromDate:date];
    }return nil;
}
// 加载节日到日历中
-(void)loadCalendarEvents{
    @jobs_weakify(self)
    EKEventStore *store = EKEventStore.new;
    /// 请求访问日历
    [store requestAccessToEntityType:EKEntityTypeEvent
                          completion:^(BOOL granted,
                                       NSError *error) {
        @jobs_strongify(self)
        /// 允许访问
        if(granted) {
            NSDate *startDate = self.minimumDate;
            NSDate *endDate = self.maximumDate;
            NSPredicate *fetchCalendarEvents = [store predicateForEventsWithStartDate:startDate
                                                                              endDate:endDate
                                                                            calendars:nil];
            NSArray<EKEvent *> *eventList = [store eventsMatchingPredicate:fetchCalendarEvents];
            NSArray<EKEvent *> *events = [eventList filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(EKEvent * _Nullable event,
                                                                                                                      NSDictionary<NSString *,id> * _Nullable bindings) {
                return event.calendar.subscribed;
            }]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!self) return;
                self.events = events;
                [self.calendar reloadData];
            });
            
        } else {
            [WHToast toastErrMsg:Internationalization(@"获取节日事件需要权限呀大宝贝!")];
        }
    }];
}
/// 根据日期来显示事件
- (NSArray<EKEvent *> *)eventsForDate:(NSDate *)date{
    NSArray<EKEvent *> *events = [self.cache objectForKey:date];
    if ([events isKindOfClass:NSNull.class]) {
        return nil;
    }
    NSArray<EKEvent *> *filteredEvents = [self.events filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(EKEvent * _Nullable evaluatedObject,
                                                                                                                        NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject.occurrenceDate isEqualToDate:date];
    }]];
    filteredEvents.count ? [self.cache setObject:filteredEvents forKey:date] : [self.cache setObject:NSNull.null forKey:date];
    return filteredEvents;
}
#pragma mark —— FSCalendarDataSource
/// 日期范围(最小)
- (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar{
    return self.minimumDate;
}
/// 日期范围(最大)
- (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar{
    return self.maximumDate;
}
#pragma mark —— FSCalendarDelegate
/// 手动选中了某个日期(本项目暂时被隐藏)
- (void)calendar:(FSCalendar *)calendar
   didSelectDate:(NSDate *)date
 atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    NSLog(@"did select %@",[self.dateFormatter stringFromDate:date]);
}
/// 当前页被改变,日历翻动时调用(本项目暂时没用到)
- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar{
    NSLog(@"did change page %@",[self.dateFormatter stringFromDate:calendar.currentPage]);
}
/// 返回节日数量
- (NSInteger)calendar:(FSCalendar *)calendar
numberOfEventsForDate:(NSDate *)date{
    if (!self.showsEvents) return 0;
    if (!self.events) return 0;
    NSArray<EKEvent *> *events = [self eventsForDate:date];
    return events.count;
}
/// calendar的events的偏好设置
- (NSArray<UIColor *> *)calendar:(FSCalendar *)calendar
                      appearance:(FSCalendarAppearance *)appearance
       eventDefaultColorsForDate:(NSDate *)date{
    if (!self.showsEvents) return nil;//如果不允许显示节日
    if (!self.events) return nil;     //如果当前日期范围内根本没有节日
    //根据日期来获取事件数组
    NSArray<EKEvent *> *events = [self eventsForDate:date];
    NSMutableArray<UIColor *> *colors = [NSMutableArray arrayWithCapacity:events.count];
    //遍历事件,设置事件文字颜色
    [events enumerateObjectsUsingBlock:^(EKEvent * _Nonnull obj,
                                         NSUInteger idx,
                                         BOOL * _Nonnull stop) {
        [colors addObject:[UIColor colorWithCGColor:obj.calendar.CGColor]];
    }];return colors.copy;
}
#pragma mark —— lazyLoad
-(UIButton *)signBtn{
    if(!_signBtn){
        _signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _signBtn.backgroundColor = JobsYellowColor;
        _signBtn.normalTitle = Internationalization(@"签到");
        @jobs_weakify(self)
        [_signBtn btnClickEventBlock:^(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            
            //假设在这里网络请求签到成功,成功后需要重新请求签到所有结果
            if (self.count > 31) {
                NSLog(@"别点了");
                return;
            }else if (!self.count){
                self.count = 1;
            }
            NSString *dateStr = [NSString stringWithFormat:@"%@-%ld",self.dateStr,self.count];
            self.count++;
            [self.signInList addObject:dateStr];
            [self getSign];
        }];
        
        [_signBtn cornerCutToCircleWithCornerRadius:5];
        
        if(UIDevice.currentDevice.systemVersion.floatValue < 15.0){
            SuppressWdeprecatedDeclarationsWarning(_signBtn.showsTouchWhenHighlighted = YES;);
        }
        
        [self.view addSubview:_signBtn];
    }return _signBtn;
}

-(UIImageView *)calendarBack{
    if(!_calendarBack){
        _calendarBack = UIImageView.new;
        _calendarBack.image = JobsIMG(@"signInCalandarBack");
        _calendarBack.frame = CGRectMake(JobsWidth(10),
                                         self.navigationController.navigationBar.height * 2 + JobsWidth(30),
                                         self.calendar.width + JobsWidth(30),
                                         self.calendar.height + JobsWidth(45));
        [self.view insertSubview:_calendarBack atIndex:1];
    }return _calendarBack;
}

-(UIImageView *)backIMGV{
    if(!_backIMGV){
        _backIMGV = UIImageView.new;
        _backIMGV.image = JobsIMG(@"signInback.png");
        _backIMGV.frame = CGRectMake(0,
                                     0,
                                     JobsMainScreen_WIDTH(),
                                     JobsMainScreen_HEIGHT());
        [self.view insertSubview:_backIMGV atIndex:0];
    }return _backIMGV;
}

-(FSCalendar *)calendar{
    if(!_calendar){
        _calendar = FSCalendar.new;
        _calendar.frame = CGRectMake(0,
                                     self.navigationController.navigationBar.frame.size.height,//❤️
                                     JobsMainScreen_WIDTH() - JobsWidth(50),
                                     JobsWidth(300));
        _calendar.backgroundColor = JobsWhiteColor;
        _calendar.dataSource = self;
        _calendar.delegate = self;
        /// 日历语言为中文
        _calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
        /// 允许多选,可以选中多个日期
        _calendar.allowsMultipleSelection = YES;
        /// 如果值为1,那么周日就在第一列,如果为2,周日就在最后一列
        _calendar.firstWeekday = 1;
        /// 周一\二\三...或者头部的2017年11月的显示方式
        _calendar.appearance.caseOptions = FSCalendarCaseOptionsWeekdayUsesSingleUpperCase|FSCalendarCaseOptionsHeaderUsesUpperCase;
        _calendar.accessibilityIdentifier = @"calendar";
        /// title显示方式
        _calendar.appearance.headerDateFormat = @"yyyy年MM月";
        /// 关闭字体自适应,设置字体大小\颜色
        _calendar.appearance.subtitleFont = UIFontWeightLightSize(8);
        _calendar.appearance.headerTitleColor = JobsWhiteColor;
        _calendar.appearance.weekdayTextColor = JobsWhiteColor;
        _calendar.appearance.selectionColor = JobsOrangeColor;
        /// 日历头部颜色
        _calendar.calendarHeaderView.backgroundColor = JobsRedColor;
        _calendar.calendarWeekdayView.backgroundColor = JobsRedColor;
        [self.view addSubview:_calendar];
    }return _calendar;
}
//设置最小和最大日期(在最小和最大日期之外的日期不能被选中,日期范围如果大于一个月,则日历可翻动)
-(NSDate *)minimumDate{
    if(!_minimumDate){
        _minimumDate = [self.dateFormatter dateFromString:self.timeArr[0]];
    }return _minimumDate;
}
//设置最小和最大日期(在最小和最大日期之外的日期不能被选中,日期范围如果大于一个月,则日历可翻动)
-(NSDate *)maximumDate{
    if(!_maximumDate){
        _maximumDate = [self.dateFormatter dateFromString:self.timeArr[1]];
    }return _maximumDate;
}

-(NSArray *)timeArr{
    if(!_timeArr){
        _timeArr = [self.class getStartTimeAndFinalTime];
    }return _timeArr;
}

-(NSString *)dateStr{
    if(!_dateStr){
        _dateStr = [self.timeArr[0] substringToIndex:7];
    }return _dateStr;
}

-(NSCalendar *)gregorian{
    if(!_gregorian){
        _gregorian = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }return _gregorian;
}

- (NSMutableArray *)signInList{
    if (!_signInList) {
        _signInList = NSMutableArray.array;
    }return _signInList;
}

- (LunarFormatter *)lunarFormatter{
    if (!_lunarFormatter) {
        _lunarFormatter = LunarFormatter.new;
    }return _lunarFormatter;
}

- (NSDateFormatter *)dateFormatter{
    if (!_dateFormatter) {
        _dateFormatter = NSDateFormatter.new;
        _dateFormatter.dateFormat = @"yyyy-MM-dd";
    }return _dateFormatter;
}

@end
