//
//  MSMineVC.m
//  MataShop
//
//  Created by Jobs Hi on 9/9/23.
//

#import "MSMineVC.h"
#import "MSMineSectionHeader.h"
#import "MSInternalRecruitmentVC.h"
#import "AddressViewController.h"
#import "SettingViewController.h"
#import "RealNameAuthViewController.h"
#import "FeedbackViewController.h"
#import "NotificationViewController.h"

@interface MSMineVC () <MSMineCollectionReusableViewDelegate>
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIViewModel *>*>*dataMutArr;
@property(nonatomic,strong)NSArray<NSString *> *sections;

@end

@implementation MSMineVC

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
    
    self.view.backgroundColor = JobsCor(@"#E81C12");
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = NO;
    self.collectionView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self updateStatusBarCor:JobsCor(@"#E81C12")];/// 在具体子类实现，不要写在父类
}

#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MSMineView6CVCell *cell = [MSMineView6CVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section][indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr[section].count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
viewForSupplementaryElementOfKind:(NSString *)kind
atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        switch (indexPath.section) {
            case 0:{
                MSMineCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MSMineCollectionReusableView reuseIdentifier] forIndexPath:indexPath];
                header.delegate = self;
                return header;
            }
            default:{
                MSMineSectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MSMineSectionHeader reuseIdentifier] forIndexPath:indexPath];
                header.title = self.sections[indexPath.section];
                return header;
            }
        }
    }
    else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        BaseCollectionReusableView *footerView = [collectionView UICollectionElementKindSectionFooterClass:BaseCollectionReusableView.class forIndexPath:indexPath];
        footerView.backgroundColor = indexPath.section == 2 ? UIColor.clearColor : JobsCor(@"#F5F5F5");
        return footerView;
    }
    else ReturnBaseCollectionReusableHeaderView;
}
#pragma mark —— UICollectionViewDelegate

/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewModel *viewModel = self.dataMutArr[indexPath.section][indexPath.item];
    [self jobsToastMsg:viewModel.textModel.text];
    
    {
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"钱包"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"我的店铺"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"我的团队"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"信用分数"))){
            
        }
    }
    
    {
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"培训课程"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"我的课件"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"店铺数据"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"实名认证"))){
            RealNameAuthViewController *vc = [[RealNameAuthViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"邀请好友"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"分享二维码"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"每日签到"))){
            [self forceComingToPushVC:MSSignInVC.new requestParams:@""];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"邀请领红包"))){
            [self forceComingToPushVC:MSRedEnvelopeDetailVC.new requestParams:@""];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"共享收益"))){
            [self forceComingToPushVC:MSChuBaoVC.new requestParams:@""];
        }
    }
    
    {
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"个人资料"))){
            [self forceComingToPushVC:MSPersonalDataVC.new requestParams:nil];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"意见反馈"))){
            FeedbackViewController *vc = [[FeedbackViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"消息通知"))){
            NotificationViewController *vc = [[NotificationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"收货地址"))){
            AddressViewController *vc = [[AddressViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"修改密码"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"设置"))){
            SettingViewController *vc = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if(viewModel.textModel.text.isEqualToString(Internationalization(@"购物车"))){
            
        }
    }
}

#pragma mark —— UICollectionViewDelegateFlowLayout
/// header 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(collectionView.bounds.size.width, 242);
    }
    NSString *title = self.sections[section];
    return title.length ? CGSizeMake(collectionView.bounds.size.width, 44) : CGSizeZero;
}

#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.itemSize = CGSizeMake(JobsWidth(70), JobsWidth(70));
        _layout.footerReferenceSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(10));
        _layout.sectionInset = UIEdgeInsetsMake(0, 16, 0, 16);
    }
    return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsCor(@"#FFFFFF");
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

        [_collectionView registerCollectionViewClass];
        [_collectionView registerCollectionViewCellClass:MSMineView6CVCell.class];
        [_collectionView registerCollectionElementKindSectionFooterClass:JobsHeaderFooterView.class];
        [_collectionView registerClass:[MSMineSectionHeader class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:[MSMineSectionHeader reuseIdentifier]];
        [_collectionView registerClass:[MSMineCollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:[MSMineCollectionReusableView reuseIdentifier]];

        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self.view);
            make.top.equalTo(self.view).offset(self.navigationBar.bounds.size.height);
        }];
    }
    return _collectionView;
}

#pragma makr - MSMineCollectionReusableViewDelegate

- (void)onTapJoinMata {
    [self forceComingToPushVC:MSInternalRecruitmentVC.new requestParams:nil];
}

- (void)onTapUserInfo {
    [self forceComingToPushVC:MSPersonalDataVC.new requestParams:nil];
}


#pragma makr - Data

-(NSMutableArray<NSMutableArray<UIViewModel *> *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            NSMutableArray *mutArr = NSMutableArray.array;

            {
                NSMutableArray *headerViewDataMutArr = NSMutableArray.array;
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"1");
                viewModel.textModel.textCor = JobsBlackColor;
                viewModel.textModel.font = UIFontWeightBoldSize(16);
                [headerViewDataMutArr addObject:viewModel];
                mutArr.data = headerViewDataMutArr;
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"钱包");
                viewModel.image = JobsIMG(@"钱包");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的店铺");
                viewModel.image = JobsIMG(@"我的店铺");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的团队");
                viewModel.image = JobsIMG(@"我的团队");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"信用分数");
                viewModel.image = JobsIMG(@"信用分数");
                [mutArr addObject:viewModel];
            }
            
            [_dataMutArr addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            
            {
                NSMutableArray *headerViewDataMutArr = NSMutableArray.array;
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"小助手");
                viewModel.textModel.textCor = JobsBlackColor;
                viewModel.textModel.font = UIFontWeightBoldSize(16);
                [headerViewDataMutArr addObject:viewModel];
                mutArr.data = headerViewDataMutArr;
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"培训课程");
                viewModel.image = JobsIMG(@"培训课程");
                [mutArr addObject:viewModel];
            }

            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"我的课件");
                viewModel.image = JobsIMG(@"我的课件");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"店铺数据");
                viewModel.image = JobsIMG(@"店铺数据");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"实名认证");
                viewModel.image = JobsIMG(@"实名认证");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"邀请好友");
                viewModel.image = JobsIMG(@"邀请好友");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"分享二维码");
                viewModel.image = JobsIMG(@"分享二维码");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"每日签到");
                viewModel.image = JobsIMG(@"每日签到");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"邀请领红包");
                viewModel.image = JobsIMG(@"邀请领红包");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"共享收益");
                viewModel.image = JobsIMG(@"共享收益");
                [mutArr addObject:viewModel];
            }
            
            [_dataMutArr addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            
            {
                NSMutableArray *headerViewDataMutArr = NSMutableArray.array;
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"服务功能");
                viewModel.textModel.textCor = JobsBlackColor;
                viewModel.textModel.font = UIFontWeightBoldSize(16);
                [headerViewDataMutArr addObject:viewModel];
                mutArr.data = headerViewDataMutArr;
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"个人资料");
                viewModel.image = JobsIMG(@"个人资料");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"意见反馈");
                viewModel.image = JobsIMG(@"意见反馈");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"消息通知");
                viewModel.image = JobsIMG(@"消息通知");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"店铺数据");
                viewModel.image = JobsIMG(@"店铺数据");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"收货地址");
                viewModel.image = JobsIMG(@"收货地址");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"修改密码");
                viewModel.image = JobsIMG(@"修改密码");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"设置");
                viewModel.image = JobsIMG(@"设置");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"购物车");
                viewModel.image = JobsIMG(@"购物车");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"订单");
                viewModel.image = JobsIMG(@"订单");
                [mutArr addObject:viewModel];
            }
            
            [_dataMutArr addObject:mutArr];
        }
    }return _dataMutArr;
}

- (NSArray<NSString *> *)sections {
    return @[@"",@"小助手",@"服务功能"];
}

@end
