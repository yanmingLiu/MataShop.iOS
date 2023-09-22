//
//  MSHomeGoodsView.m
//  MataShop
//
//  Created by Jobs Hi on 9/19/23.
//

#import "MSHomeGoodsView.h"

@interface MSHomeGoodsView ()
/// UI
@property(nonatomic,strong)JXCategoryTimelineView *categoryView;/// 文字
@property(nonatomic,strong)JXCategoryIndicatorBackgroundView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
@property(nonatomic,assign)CGPoint initialTouchPoint;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*subTitleMutArr;

@end

@implementation MSHomeGoodsView
//UILocationProtocol_synthesize
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_homeGoodsViewOnceToken = 0;
    static_homeGoodsView = nil;
}

static MSHomeGoodsView *static_homeGoodsView = nil;
static dispatch_once_t static_homeGoodsViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_homeGoodsViewOnceToken, ^{
        static_homeGoodsView = MSHomeGoodsView.new;
    });return static_homeGoodsView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NotificationAdd(self,
                        @selector(languageSwitchNotification:),
                        LanguageSwitchNotification,
                        nil);
    }return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
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
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    [self setupGesture];
    self.categoryView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
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
///【点击的结果】点击选中的情况才会调用该方法。传递didClickSelectedItemAt事件给listContainerView
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}
///【点击选中或者滚动选中的结果】点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView
didSelectedItemAtIndex:(NSInteger)index {
    
}
///【滚动选中的结果】滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{
    
}
/// 传递scrolling事件给listContainerView，必须调用！！！
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
#pragma mark —— 一些私有方法
- (void)setupGesture{
    self.userInteractionEnabled = YES;
    self.target = self;
    @jobs_weakify(self)
    self.panGR_SelImp.selector = [self jobsSelectorBlock:^(id _Nullable weakSelf,
                                                           UIPanGestureRecognizer *_Nullable sender) {
        @jobs_strongify(self)
        CGPoint translation = [sender translationInView:self.superview];
        self.jobsPoint = translation;
        
        if (sender.state == UIGestureRecognizerStateBegan) {
            self.initialTouchPoint = self.center;
        }

        if (sender.state == UIGestureRecognizerStateChanged) {
            CGFloat maxH = JobsMainScreen_HEIGHT() / 2 + 初始位置;
            CGFloat minH = JobsMainScreen_HEIGHT() / 2 + 终点位置;
            // 计算新的位置
            CGFloat newY = self.initialTouchPoint.y + translation.y;
            // 限制在 minY 和 maxY 之间
            newY = MAX(minH, newY);
            newY = MIN(maxH, newY);
            self.center = CGPointMake(self.initialTouchPoint.x, newY);
        }
        if (sender.state == UIGestureRecognizerStateEnded) {
            NSLog(@"translation = %f",translation.y);// 向上为负、向下为正
            NSLog(@"fdfd = %f",self.center.y);//541.333328 703.666672
            // 在手势结束时，检查视图的位置并执行你想要的操作
            if(self.objectBlock) self.objectBlock(self);
        }
        
    }];self.panGR.enabled = YES;
}
#pragma mark —— lazyLoad
-(JXCategoryTimelineView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTimelineView.new;
        _categoryView.delegate = self;
        _categoryView.backgroundColor = UIColor.clearColor;
        
        _categoryView.titles = self.subTitleMutArr;
        _categoryView.timeTitles = self.titleMutArr;
        
        _categoryView.titleFont = UIFontWeightRegularSize(12);
        _categoryView.titleColor = RGBA_COLOR(159, 153, 147, 1);
        _categoryView.titleSelectedFont = UIFontWeightSemiboldSize(12);
        _categoryView.titleSelectedColor = UIColor.whiteColor;
        
        _categoryView.timeTitleSelectedColor = UIColor.blackColor;
        _categoryView.timeTitleNormalColor = RGB_SAMECOLOR(108);
        _categoryView.timeTitleFont = UIFontWeightBoldSize(JobsWidth(16));
        _categoryView.timeTitleSelectedFont = UIFontWeightBoldSize(JobsWidth(16));
        
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        _categoryView.titleLabelVerticalOffset = JobsWidth(13);/// _lineView.verticalMargin = JobsWidth(-13);
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.contentScrollView = self.listContainerView.scrollView;//
        [self addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        }];
        [self layoutIfNeeded];
    }return _categoryView;
}

-(JXCategoryIndicatorBackgroundView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorBackgroundView.new;
        _lineView.indicatorHeight = JobsWidth(20);
        _lineView.indicatorCornerRadius = JobsWidth(10);
        _lineView.verticalMargin = JobsWidth(-13);
        _lineView.indicatorColor = HEXCOLOR(0xEA2819);
    }return _lineView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        [self addSubview:_listContainerView];
        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(listContainerViewDefaultOffset);
            make.left.right.equalTo(self);
            make.height.mas_equalTo(JobsMainScreen_HEIGHT() - 终点位置 - listContainerViewDefaultOffset);
        }];
        [self layoutIfNeeded];
        /// ❤️在需要的地方写❤️
        NSNumber *currentIndex = self.listContainerView.valueForKeyBlock(@"currentIndex");
        NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);
    }return _listContainerView;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        for (NSString *str in self.titleMutArr) {
            [_childVCMutArr addObject:MSHomeGoodsBaseVC.new];
        }
    }return _childVCMutArr;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:Internationalization(@"全部活动")];
        [_titleMutArr addObject:Internationalization(@"限时活动")];
        [_titleMutArr addObject:Internationalization(@"新人首存")];
        [_titleMutArr addObject:Internationalization(@"日常活动")];
    }return _titleMutArr;
}

-(NSMutableArray<NSString *> *)subTitleMutArr{
    if (!_subTitleMutArr) {
        _subTitleMutArr = NSMutableArray.array;
        [_subTitleMutArr addObject:Internationalization(@"全部活动1")];
        [_subTitleMutArr addObject:Internationalization(@"限时活动1")];
        [_subTitleMutArr addObject:Internationalization(@"新人首存1")];
        [_subTitleMutArr addObject:Internationalization(@"日常活动1")];
    }return _subTitleMutArr;
}

@end
