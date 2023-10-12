//
//  MSLastDynamicCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import "MSLastDynamicCVCell.h"

@interface MSLastDynamicCVCell ()
/// UI
@property(nonatomic,strong)UIButton *userInfoBtn;
@property(nonatomic,strong)UILabel *timeLab;
@property(nonatomic,strong)UIButton *praiseBtn;
@property(nonatomic,strong)UIButton *commentsBtn;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)MSLastDynamicModel *lastDynamicModel;

@end

@implementation MSLastDynamicCVCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSLastDynamicCVCell *cell = (MSLastDynamicCVCell *)[collectionView collectionViewCellClass:MSLastDynamicCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:MSLastDynamicCVCell.class];
        cell = (MSLastDynamicCVCell *)[collectionView collectionViewCellClass:MSLastDynamicCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell 圆切角
//    [cell.contentView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
//    [cell.contentView layerBorderCor:RGBA_COLOR(255, 225, 144, 1) andBorderWidth:JobsWidth(0.5f)];
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSLastDynamicModel *_Nullable)model{
    self.contentView.backgroundColor = self.backgroundColor = JobsWhiteColor;
    self.lastDynamicModel = model;
    
    self.userInfoBtn.alpha = 1;
    self.collectionView.alpha = 1;
    self.timeLab.alpha = 1;
    self.commentsBtn.alpha = 1;
    self.praiseBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(NSMutableArray <MSLastDynamicModel *>*_Nullable)model{
    return CGSizeMake(JobsWidth(345), JobsWidth(210));
}
#pragma mark —— 一些私有方法
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
///
-(void)btn:(UIButton *)btn
  isPraise:(BOOL)isPraise{
    if(isPraise){
        self.lastDynamicModel.praise = [self addPraise:self.lastDynamicModel.praise];
        [btn jobsSetBtnTitleFont:UIFontWeightBoldSize(12)
                     btnTitleCor:JobsCor(@"#DD0000")];
        btn.jobsResetImage(JobsIMG(@"圈子点赞.已点击"));
//        [self jobsToastMsg:Internationalization(@"点赞")];
    }else{
        self.lastDynamicModel.praise = [self subtractionPraise:self.lastDynamicModel.praise];
        [btn jobsSetBtnTitleFont:UIFontWeightBoldSize(12)
                     btnTitleCor:JobsCor(@"#999999")];
        btn.jobsResetImage(JobsIMG(@"圈子点赞.未点击"));
//        [self jobsToastMsg:Internationalization(@"取消点赞")];
    }
    btn.jobsResetTitle(self.lastDynamicModel.praise);
}
/// 点赞数加1
-(NSString *)addPraise:(NSString *)praise{
    NSInteger num = praise.intValue;
    num += 1;
    return [NSString stringWithFormat:@"%ld",num];
}
/// 点赞数减1
-(NSString *)subtractionPraise:(NSString *)praise{
    NSInteger num = praise.intValue;
    num -= 1;
    return [NSString stringWithFormat:@"%ld",num];
}
#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MSForLastDynamicCVCell *cell = [MSForLastDynamicCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.lastDynamicModel.imageDataMutArr[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.lastDynamicModel.imageDataMutArr.count;
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
    /**
     滚动到指定位置
     _collectionView.contentOffset = CGPointMake(0,-100);
     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
     */
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
    return [MSForLastDynamicCVCell cellSizeWithModel:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(10);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return (UIEdgeInsetsMake(JobsWidth(20),
                             JobsWidth(0),
                             JobsWidth(20),
                             JobsWidth(0)));
}
#pragma mark —— lazyLoad
-(UIButton *)userInfoBtn{
    if(!_userInfoBtn){
        @jobs_weakify(self)
        _userInfoBtn = [BaseButton.alloc jobsInitBtnByConfiguration:UIButtonConfiguration.plainButtonConfiguration
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:nil
                                                           subTitle:nil
                                                          titleFont:UIFontWeightMediumSize(14)
                                                       subTitleFont:UIFontWeightBoldSize(14)
                                                           titleCor:JobsCor(@"#666666")
                                                        subTitleCor:JobsCor(@"#333333")
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:UIColor.whiteColor
                                                       imagePadding:JobsWidth(10)
                                                       titlePadding:JobsWidth(10)
                                                     imagePlacement:NSDirectionalRectEdgeLeading
                                         contentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft
                                           contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                      contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                  cornerRadiusValue:JobsWidth(0)
                                                    roundingCorners:UIRectCornerAllCorners
                                               roundingCornersRadii:CGSizeZero
                                                     layerBorderCor:nil
                                                        borderWidth:JobsWidth(0)
                                                      primaryAction:nil
                                                    clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self.contentView addSubview:_userInfoBtn];
        [_userInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(58));
            make.top.equalTo(self.contentView).offset(JobsWidth(0));
            make.left.equalTo(self.contentView).offset(JobsWidth(15));
            make.right.equalTo(self.contentView).offset(JobsWidth(-0));
        }];
    }
    _userInfoBtn.jobsResetImage(self.lastDynamicModel.userImage);
    _userInfoBtn.jobsResetTitle(self.lastDynamicModel.userTitle);
    _userInfoBtn.jobsResetSubtitle(self.lastDynamicModel.userSubTitle);
    return _userInfoBtn;
}

-(UILabel *)timeLab{
    if(!_timeLab){
        _timeLab = UILabel.new;
        _timeLab.textColor = JobsCor(@"#AAAAAA");
        _timeLab.font = UIFontWeightMediumSize(11);
        [self.contentView addSubview:_timeLab];
        [_timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userInfoBtn);
            make.top.equalTo(self.collectionView.mas_bottom).offset(JobsWidth(17));
            make.height.mas_equalTo(JobsWidth(11));
        }];
    }
    _timeLab.text = self.lastDynamicModel.time;
    [_timeLab makeLabelByShowingType:UILabelShowingType_03];
    return _timeLab;
}

-(UIButton *)commentsBtn{
    if(!_commentsBtn){
        @jobs_weakify(self)
        _commentsBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                                     titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:JobsIMG(@"圈子评论")
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:nil
                                                           subTitle:nil
                                                          titleFont:UIFontWeightRegularSize(12)
                                                       subTitleFont:nil
                                                           titleCor:JobsCor(@"#999999")
                                                        subTitleCor:nil
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:UIColor.clearColor
                                                       imagePadding:JobsWidth(5)
                                                       titlePadding:JobsWidth(0)
                                                     imagePlacement:NSDirectionalRectEdgeLeading
                                         contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                           contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                      contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                  cornerRadiusValue:JobsWidth(0)
                                                    roundingCorners:UIRectCornerAllCorners
                                               roundingCornersRadii:CGSizeZero
                                                     layerBorderCor:nil
                                                        borderWidth:JobsWidth(0)
                                                      primaryAction:nil
                                                    clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            [self jobsToastMsg:Internationalization(@"提现")];
            return nil;
        }];
        [self.contentView addSubview:_commentsBtn];
        [_commentsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(-15));
            make.top.equalTo(self.collectionView.mas_bottom).offset(JobsWidth(15));
            make.height.mas_equalTo(JobsWidth(20));
        }];
    }
    _commentsBtn.jobsResetTitle(self.lastDynamicModel.comments);
    [_commentsBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    return _commentsBtn;
}

-(UIButton *)praiseBtn{
    if(!_praiseBtn){
        @jobs_weakify(self)
        _praiseBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                                   titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:nil
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:nil
                                                         subTitle:nil
                                                        titleFont:nil
                                                     subTitleFont:nil
                                                         titleCor:nil
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:UIColor.clearColor
                                                     imagePadding:JobsWidth(5)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeLeading
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(0)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                                  clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [self btn:x isPraise:x.selected];
            if (self.objectBlock) self.objectBlock(x);
//            [self jobsToastMsg:Internationalization(@"点赞")];
            return nil;
        }];
        [self.contentView addSubview:_praiseBtn];
        [_praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(20));
            make.right.equalTo(self.commentsBtn.mas_left).offset(JobsWidth(-10));
            make.top.equalTo(self.commentsBtn);
        }];
    }
    [self btn:_praiseBtn isPraise:self.lastDynamicModel.isPraise];
    
    _praiseBtn.jobsResetTitle(self.lastDynamicModel.praise);
    [_praiseBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    return _praiseBtn;
}

-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsWhiteColor;
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerCollectionViewClass];
        [_collectionView registerCollectionViewCellClass:MSForMoreMomentsCVCell.class];
        [self.contentView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userInfoBtn.mas_bottom);
            make.height.mas_equalTo([MSForLastDynamicCVCell cellSizeWithModel:nil].height);
            make.centerX.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(JobsWidth(0));
            make.right.equalTo(self.contentView).offset(JobsWidth(-0));
        }];
    }return _collectionView;
}

@end
