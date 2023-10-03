//
//  MSMySocialTitleView.m
//  MataShop
//
//  Created by Jobs Hi on 10/1/23.
//

#import "MSMySocialTitleView.h"

@interface MSMySocialTitleView ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*vcMutArr;

@end

@implementation MSMySocialTitleView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_mySocialTitleViewOnceToken = 0;
    static_mySocialTitleView = nil;
}

static MSMySocialTitleView *static_mySocialTitleView = nil;
static dispatch_once_t static_mySocialTitleViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_mySocialTitleViewOnceToken, ^{
        static_mySocialTitleView = MSMySocialTitleView.new;
    });return static_mySocialTitleView;
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
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.collectionView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(110));
}
#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MSMineView6CVCell *cell = [MSMineView6CVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.item]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
//    UIViewModel *viewModel = self.dataMutArr[indexPath.item];
//    [WHToast toastMsg:viewModel.textModel.text];
    /**
     滚动到指定位置
     _collectionView.contentOffset = CGPointMake(0,-100);
     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
     */
    [self forceComingToPushVC:self.vcMutArr[indexPath.item] requestParams:nil];
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.cls = self.class;
    return [MSMineView6CVCell cellSizeWithModel:viewModel];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(10);
}
/// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(25);
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(JobsWidth(25), JobsWidth(25), JobsWidth(25), JobsWidth(25));
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsWhiteColor;
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        [_collectionView registerCollectionViewClass];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"点赞");
            viewModel.image = JobsIMG(@"点赞");
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            viewModel.imageTitleSpace = JobsWidth(1);
            
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"粉丝");
            viewModel.image = JobsIMG(@"粉丝");
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            viewModel.imageTitleSpace = JobsWidth(1);
            
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"关注");
            viewModel.image = JobsIMG(@"关注");
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            viewModel.imageTitleSpace = JobsWidth(1);
            
            [_dataMutArr addObject:viewModel];
        }

        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"打赏");
            viewModel.image = JobsIMG(@"打赏");
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            viewModel.imageTitleSpace = JobsWidth(1);
            
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"评比");
            viewModel.image = JobsIMG(@"评比");
            viewModel.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
            viewModel.imageTitleSpace = JobsWidth(1);
            
            [_dataMutArr addObject:viewModel];
        }
        
    }return _dataMutArr;
}

-(NSMutableArray<UIViewController *> *)vcMutArr{
    if(!_vcMutArr){
        _vcMutArr = NSMutableArray.array;
        [_vcMutArr addObject:MSThumbsUpVC.new];/// 点赞作品
        
        {
            MSMyFansBaseVC *myFansBaseVC = MSMyFansBaseVC.new;
            myFansBaseVC.data = @(MSMyFansStyle_2);/// 我的粉丝——我的粉丝
            [_vcMutArr addObject:myFansBaseVC];
        }

        {
            MSMyFansBaseVC *myFansBaseVC = MSMyFansBaseVC.new;
            myFansBaseVC.data = @(MSMyFansStyle_1);/// 我的粉丝——我的关注
            [_vcMutArr addObject:myFansBaseVC];
        }
        
        {
            MSMyFansBaseVC *myFansBaseVC = MSMyFansBaseVC.new;
            myFansBaseVC.data = @(MSMyFansStyle_3);/// 我的粉丝——我打赏的用户
            [_vcMutArr addObject:myFansBaseVC];
        }
        
//        {
//            MSMyFansBaseVC *myFansBaseVC = MSMyFansBaseVC.new;
//            myFansBaseVC.requestParams = @(MSMyFansStyle_4);/// 我的粉丝——打赏我的用户
//            [_vcMutArr addObject:myFansBaseVC];
//        }
    
        [_vcMutArr addObject:MSMyAppraiseComparisonVC.new];/// 我的评比
        
    }return _vcMutArr;
}

@end
