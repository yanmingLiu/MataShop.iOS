//
//  MSInternalRecruitmentCVCell2.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "MSInternalRecruitmentCVCell2.h"

@interface MSInternalRecruitmentCVCell2 ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)MSInternalRecruitmentModel *model;

@end

@implementation MSInternalRecruitmentCVCell2

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    [collectionView registerCollectionViewCellClass:MSInternalRecruitmentCVCell2.class];
    MSInternalRecruitmentCVCell2 *cell = (MSInternalRecruitmentCVCell2 *)[collectionView collectionViewCellClass:MSInternalRecruitmentCVCell2.class forIndexPath:indexPath];
    if (!cell) {
        cell = (MSInternalRecruitmentCVCell2 *)[collectionView collectionViewCellClass:MSInternalRecruitmentCVCell2.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(MSInternalRecruitmentModel *_Nullable)model{
    self.model = model;
    self.tableView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(MSInternalRecruitmentModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(36) * model.detailMutArr.count);
}
#pragma mark —— 一些私有方法

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
    return JobsWidth(36);
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.model.detailMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell cellStyleValue1WithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryNone;
    MSInternalRecruitmentDetailModel *model = self.model.detailMutArr[indexPath.row];
    
    cell.textLabel.text = model.title;
    cell.textLabel.textColor = RGB_SAMECOLOR(109);
    cell.textLabel.font = UIFontWeightRegularSize(14);

    cell.detailTextLabel.text = model.value;
    cell.detailTextLabel.textColor = RGB_SAMECOLOR(51);
    cell.detailTextLabel.font = UIFontWeightRegularSize(14);
    [cell.detailTextLabel makeLabelByShowingType:UILabelShowingType_03];
    
    return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
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
            _tableView.ly_emptyView.titleLabFont = UIFontWeightMediumSize(16);
        }
    
        [self.contentView addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _tableView;
}

@end

