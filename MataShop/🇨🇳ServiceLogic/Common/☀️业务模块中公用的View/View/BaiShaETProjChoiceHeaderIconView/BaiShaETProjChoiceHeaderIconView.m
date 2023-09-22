//
//  BaiShaETProjChoiceHeaderIconView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "BaiShaETProjChoiceHeaderIconView.h"

@interface BaiShaETProjChoiceHeaderIconView ()
// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
// Data
@property(nonatomic,strong)NSMutableArray <BaiShaETProjHeaderIconModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <UICollectionViewCell *>*cvcellMutArr;

@end

@implementation BaiShaETProjChoiceHeaderIconView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_choiceHeaderIconViewOnceToken = 0;
    static_choiceHeaderIconView = nil;
}

static BaiShaETProjChoiceHeaderIconView *static_choiceHeaderIconView = nil;
static dispatch_once_t static_choiceHeaderIconViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_choiceHeaderIconViewOnceToken, ^{
        static_choiceHeaderIconView = BaiShaETProjChoiceHeaderIconView.new;
    });return static_choiceHeaderIconView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
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
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.collectionView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(UIViewModel *_Nullable)model{
    return CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsWidth(198));
}
///下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [NSObject feedbackGenerator];//震动反馈
}
///上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BaiShaETProjHeaderIconCVCell *cell = (BaiShaETProjHeaderIconCVCell *)[BaiShaETProjHeaderIconCVCell cellWithCollectionView:self.collectionView forIndexPath:indexPath];
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

    for (BaiShaETProjHeaderIconCVCell *cell in collectionView.visibleCells) {
        [cell layerBorderCor:UIColor.clearColor andBorderWidth:JobsWidth(1)];
    }
    
    if (indexPath.item == self.dataMutArr.count - 1) {
        if (self.voidBlock) self.voidBlock();
    }else{
        BaiShaETProjHeaderIconCVCell *cell = (BaiShaETProjHeaderIconCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell layerBorderCor:UIColor.redColor andBorderWidth:JobsWidth(1)];
    }
    
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
    return [BaiShaETProjHeaderIconCVCell cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(18);
}
/// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(24);
}
///内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout*)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(JobsWidth(17), JobsWidth(18), JobsWidth(17), JobsWidth(18));
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
        _collectionView.backgroundColor = RGB_SAMECOLOR(246);
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerCollectionViewClass];
        
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _collectionView;
}

-(NSMutableArray<BaiShaETProjHeaderIconModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        for (int i = 1; i <= 7; i++) {
            BaiShaETProjHeaderIconModel *viewModel = BaiShaETProjHeaderIconModel.new;
            viewModel.image = JobsIMG([NSString stringWithFormat:i < 10 ? @"头像0%d" : @"头像%d",i]);
            [_dataMutArr addObject:viewModel];
        }
        
        if (1) {
            BaiShaETProjHeaderIconModel *viewModel = BaiShaETProjHeaderIconModel.new;
            viewModel.image = JobsIMG(@"未设置用户头像");
            viewModel.headerIconCellStyle = HeaderIconCVCellStyleNormal;
            [_dataMutArr addObject:viewModel];
        }else{
            BaiShaETProjHeaderIconModel *viewModel = BaiShaETProjHeaderIconModel.new;
            viewModel.image = JobsIMG(@"头像01");
            viewModel.headerIconCellStyle = HeaderIconCVCellStyleChange;
            [_dataMutArr addObject:viewModel];
        }
        
    }return _dataMutArr;
}

@end
