//
//  UIView+MJRefresh.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/17.
//

#import "UIView+MJRefresh.h"

@implementation UIView (MJRefresh)
#pragma mark —— 一些私有方法
-(void)震动特效反馈{
    [self addObserver:self
           forKeyPath:@"state"
              options:NSKeyValueObservingOptionNew
              context:nil];
}
/*
 * 相关继承关系图谱 4个header + 9个Footer ;已经实现的👌
    MJRefreshGifHeader  👌 ->MJRefreshStateHeader->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshNormalHeader 👌->MJRefreshStateHeader->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshStateHeader 👌->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshHeader 👌->MJRefreshComponent->UIView
 
    MJRefreshAutoGifFooter  👌 ->MJRefreshAutoStateFooter->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoNormalFooter  👌 ->MJRefreshAutoStateFooter->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoStateFooter ->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoFooter ->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackGifFooter ->MJRefreshBackStateFooter->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackNormalFooter  👌 ->MJRefreshBackStateFooter->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackStateFooter ->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackFooter ->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshFooter->MJRefreshComponent->UIView
 *
 */
#pragma mark —— BaseViewProtocol
///下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    NSLog(@"下拉刷新");
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 结束刷新
//        [self.tableView.mj_header endRefreshing];
//    });
}
///上拉加载更多 （子类要进行覆写）
- (void)loadMoreRefresh{
    NSLog(@"上拉加载更多");
}
#pragma mark —— 覆写子类方法
/// KVO 监听 MJRefresh + 震动特效反馈
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if ([object isEqual:self.mjRefreshGifHeader] &&
        self.mjRefreshGifHeader.state == MJRefreshStatePulling) {
        [NSObject feedbackGenerator];
    }else if (([object isEqual:self.mjRefreshAutoGifFooter] ||
               [object isEqual:self.mjRefreshBackNormalFooter] ||
               [object isEqual:self.mjRefreshAutoNormalFooter]) && (self.mjRefreshAutoGifFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshBackNormalFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshAutoNormalFooter.state == MJRefreshStatePulling)
             ) {
        [NSObject feedbackGenerator];
    }else{}
}
#pragma mark —— @property(nonatomic,weak)UIScrollView *mjRefreshTargetView; MJRefresh 作用于targetView
@dynamic mjRefreshTargetView;
-(UIScrollView *)mjRefreshTargetView{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setMjRefreshTargetView:(UIScrollView *)mjRefreshTargetView{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshTargetView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshConfigModel *refreshConfigHeader;//头部的配置信息
@dynamic refreshConfigHeader;
-(MJRefreshConfigModel *)refreshConfigHeader{
    MJRefreshConfigModel *RefreshConfigHeader = objc_getAssociatedObject(self, _cmd);
    if (!RefreshConfigHeader) {
        RefreshConfigHeader = MJRefreshConfigModel.new;
        [self setRefreshConfigHeader:RefreshConfigHeader];
    }return RefreshConfigHeader;
}

-(void)setRefreshConfigHeader:(MJRefreshConfigModel *)refreshConfigHeader{
    objc_setAssociatedObject(self,
                             _cmd,
                             refreshConfigHeader,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshConfigModel *refreshConfigFooter;//尾部的配置信息
@dynamic refreshConfigFooter;
-(MJRefreshConfigModel *)refreshConfigFooter{
    MJRefreshConfigModel *RefreshConfigFooter = objc_getAssociatedObject(self, _cmd);
    if (!RefreshConfigFooter) {
        RefreshConfigFooter = MJRefreshConfigModel.new;
        [self setRefreshConfigFooter:RefreshConfigFooter];
    }return RefreshConfigFooter;
}

-(void)setRefreshConfigFooter:(MJRefreshConfigModel *)refreshConfigFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             refreshConfigFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 MJRefreshStateIdle,   //   普通闲置状态
 MJRefreshStatePulling,   //   松开就可以进行刷新的状态
 MJRefreshStateRefreshing,   //   正在刷新中的状态
 MJRefreshStateWillRefresh,   //   即将刷新的状态
 MJRefreshStateNoMoreData   //   所有数据加载完毕，没有更多的数据了
 */
#pragma mark —— MJRefreshHeader
#pragma mark —— @property(nonatomic,strong)LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
@dynamic lotAnimMJRefreshHeader;
-(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader = objc_getAssociatedObject(self, _cmd);
    NSLog(@"DDD = %@",lotAnimMJRefreshHeader);
    if (!lotAnimMJRefreshHeader) {
        @jobs_weakify(self)
        lotAnimMJRefreshHeader = [LOTAnimationMJRefreshHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self pullToRefresh];
        }];
        //图片
        {
            // 普通闲置状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.stateIdlePicsMutArr
                                     forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.pullingPicsMutArr
                                     forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.refreshingPicsMutArr
                                     duration:self.refreshConfigHeader.refreshingDuration
                                     forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.willRefreshPicsMutArr
                                     forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.noMoreDataPicsMutArr
                                     forState:MJRefreshStateNoMoreData];
        }
        //文字
        {
//            NSLog(@"%@",self.refreshConfigHeader.stateIdleTitle);
            NSLog(@"%@",self.refreshConfigHeader);
            // 普通闲置状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                    forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.pullingTitle
                                    forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                  forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                    forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                    forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            lotAnimMJRefreshHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            lotAnimMJRefreshHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) {
                [self 震动特效反馈];
            }
        }
        [self setLotAnimMJRefreshHeader:lotAnimMJRefreshHeader];
    }return lotAnimMJRefreshHeader;
}

-(void)setLotAnimMJRefreshHeader:(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    objc_setAssociatedObject(self,
                             _cmd,
                             lotAnimMJRefreshHeader,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshNormalHeader *mjRefreshNormalHeader;
@dynamic mjRefreshNormalHeader;
-(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    MJRefreshNormalHeader *MjRefreshNormalHeader = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshNormalHeader) {
        @jobs_weakify(self)
        MjRefreshNormalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self pullToRefresh];
        }];
        //文字
        {
            // 普通闲置状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                   forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.pullingTitle
                                   forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                   forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                   forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                   forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshNormalHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            MjRefreshNormalHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) {
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshNormalHeader:MjRefreshNormalHeader];
    }return MjRefreshNormalHeader;
}

-(void)setMjRefreshNormalHeader:(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshNormalHeader,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshStateHeader *mjRefreshStateHeader;
@dynamic mjRefreshStateHeader;
-(MJRefreshStateHeader *)mjRefreshStateHeader{
    MJRefreshStateHeader *MjRefreshStateHeader = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshStateHeader) {
        @jobs_weakify(self)
        MjRefreshStateHeader = [MJRefreshStateHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self pullToRefresh];
        }];
        //文字
        {
            // 普通闲置状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                  forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.pullingTitle
                                  forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                  forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                  forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                  forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshStateHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            MjRefreshStateHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) {
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshStateHeader:MjRefreshStateHeader];
    }return MjRefreshStateHeader;
}

-(void)setMjRefreshStateHeader:(MJRefreshStateHeader *)mjRefreshStateHeader{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshStateHeader,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshHeader *mjRefreshHeader;
@dynamic mjRefreshHeader;
-(MJRefreshHeader *)mjRefreshHeader{
    MJRefreshHeader *MjRefreshHeader = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshHeader) {
        @jobs_weakify(self)
        MjRefreshHeader = [MJRefreshHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self pullToRefresh];
        }];
        //其他
        {
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) {
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshHeader:MjRefreshHeader];
    }return MjRefreshHeader;
}

-(void)setMjRefreshHeader:(MJRefreshHeader *)mjRefreshHeader{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshHeader,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshGifHeader *mjRefreshGifHeader;
@dynamic mjRefreshGifHeader;
-(MJRefreshGifHeader *)mjRefreshGifHeader{
    MJRefreshGifHeader *MjRefreshGifHeader = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshGifHeader) {
        @jobs_weakify(self)
        MjRefreshGifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self pullToRefresh];
        }];
        //图片
        {
            // 普通闲置状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.stateIdlePicsMutArr
                                 forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.pullingPicsMutArr
                                 forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.refreshingPicsMutArr
                                 duration:self.refreshConfigHeader.refreshingDuration
                                 forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.willRefreshPicsMutArr
                                 forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.noMoreDataPicsMutArr
                                 forState:MJRefreshStateNoMoreData];
        }
        //文字
        {
            // 普通闲置状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.pullingTitle
                                forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshGifHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            MjRefreshGifHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) {
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshGifHeader:MjRefreshGifHeader];
    }return MjRefreshGifHeader;
}

-(void)setMjRefreshGifHeader:(MJRefreshGifHeader *)mjRefreshGifHeader{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshGifHeader,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— MJRefreshFooter
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
@dynamic mjRefreshAutoGifFooter;
-(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    MJRefreshAutoGifFooter *MjRefreshAutoGifFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshAutoGifFooter) {
        @jobs_weakify(self)
        MjRefreshAutoGifFooter = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        // 图片
        {
            // 普通闲置状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.stateIdlePicsMutArr
                                     forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.pullingPicsMutArr
                                     forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.refreshingPicsMutArr
                                     duration:self.refreshConfigFooter.refreshingDuration
                                     forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.willRefreshPicsMutArr
                                     forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.noMoreDataPicsMutArr
                                     forState:MJRefreshStateNoMoreData];
        }
        // 文字
        {
            // 普通闲置状态
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                    forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.pullingTitle
                                    forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                    forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                    forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                    forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshAutoGifFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshAutoGifFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshAutoGifFooter:MjRefreshAutoGifFooter];
    }return MjRefreshAutoGifFooter;
}

-(void)setMjRefreshAutoGifFooter:(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshAutoGifFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
@dynamic mjRefreshBackNormalFooter;
-(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    MJRefreshBackNormalFooter *MjRefreshBackNormalFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshBackNormalFooter) {
        @jobs_weakify(self)
        MjRefreshBackNormalFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        // 文字 (此模式下只有文字而没有图片)
        {
            // 普通闲置状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                       forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.pullingTitle
                                       forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                       forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                       forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                       forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshBackNormalFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshBackNormalFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshBackNormalFooter:MjRefreshBackNormalFooter];
    }return MjRefreshBackNormalFooter;
}

-(void)setMjRefreshBackNormalFooter:(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshBackNormalFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
@dynamic mjRefreshAutoNormalFooter;
-(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    MJRefreshAutoNormalFooter *MjRefreshAutoNormalFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshAutoNormalFooter) {
        @jobs_weakify(self)
        MjRefreshAutoNormalFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        
        // 文字
        {
            // 普通闲置状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                       forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.pullingTitle
                                       forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                       forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                       forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                       forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshAutoNormalFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshAutoNormalFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshAutoNormalFooter:MjRefreshAutoNormalFooter];
    }return MjRefreshAutoNormalFooter;
}

-(void)setMjRefreshAutoNormalFooter:(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshAutoNormalFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
@dynamic mjRefreshAutoStateFooter;
-(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    MJRefreshAutoStateFooter *MjRefreshAutoStateFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshAutoStateFooter) {
        @jobs_weakify(self)
        MjRefreshAutoStateFooter = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        // 文字
        {
            // 普通闲置状态
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                      forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.pullingTitle
                                      forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                      forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                      forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                      forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshAutoStateFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshAutoStateFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshAutoStateFooter:MjRefreshAutoStateFooter];
    }return MjRefreshAutoStateFooter;
}

-(void)setMjRefreshAutoStateFooter:(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshAutoStateFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoFooter *mjRefreshAutoFooter;
@dynamic mjRefreshAutoFooter;
-(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    MJRefreshAutoFooter *MjRefreshAutoFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshAutoFooter) {
        @jobs_weakify(self)
        MjRefreshAutoFooter = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        [self setMjRefreshAutoFooter:MjRefreshAutoFooter];
    }return MjRefreshAutoFooter;
}

-(void)setMjRefreshAutoFooter:(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshAutoFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackGifFooter *mjRefreshBackGifFooter;
@dynamic mjRefreshBackGifFooter;
-(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    MJRefreshBackGifFooter *MjRefreshBackGifFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshBackGifFooter) {
        @jobs_weakify(self)
        MjRefreshBackGifFooter = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        // 图片
        {
            // 普通闲置状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.stateIdlePicsMutArr
                                     forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.pullingPicsMutArr
                                     forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.refreshingPicsMutArr
                                     duration:self.refreshConfigFooter.refreshingDuration
                                     forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.willRefreshPicsMutArr
                                     forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.noMoreDataPicsMutArr
                                     forState:MJRefreshStateNoMoreData];
        }
        // 文字
        {
            // 普通闲置状态
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                    forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.pullingTitle
                                    forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                    forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                    forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                    forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshBackGifFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshBackGifFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshBackGifFooter:MjRefreshBackGifFooter];
    }return MjRefreshBackGifFooter;
}

-(void)setMjRefreshBackGifFooter:(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshBackGifFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackStateFooter *mjRefreshBackStateFooter;
@dynamic mjRefreshBackStateFooter;
-(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    MJRefreshBackStateFooter *MjRefreshBackStateFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshBackStateFooter) {
        @jobs_weakify(self)
        MjRefreshBackStateFooter = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        // 文字
        {
            // 普通闲置状态
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                      forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.pullingTitle
                                      forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                      forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                      forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                      forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshBackStateFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshBackStateFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshBackStateFooter:MjRefreshBackStateFooter];
    }return MjRefreshBackStateFooter;
}

-(void)setMjRefreshBackStateFooter:(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshBackStateFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackFooter *mjRefreshBackFooter;
@dynamic mjRefreshBackFooter;
-(MJRefreshBackFooter *)mjRefreshBackFooter{
    MJRefreshBackFooter *MjRefreshBackFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshBackFooter) {
        @jobs_weakify(self)
        MjRefreshBackFooter = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        //其他
        {
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshBackFooter:MjRefreshBackFooter];
    }return MjRefreshBackFooter;
}

-(void)setMjRefreshBackFooter:(MJRefreshBackFooter *)mjRefreshBackFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshBackFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshFooter *mjRefreshFooter;
@dynamic mjRefreshFooter;
-(MJRefreshFooter *)mjRefreshFooter{
    MJRefreshFooter *MjRefreshFooter = objc_getAssociatedObject(self, _cmd);
    if (!MjRefreshFooter) {
        @jobs_weakify(self)
        MjRefreshFooter = [MJRefreshFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self loadMoreRefresh];
        }];
        //其他
        {
            if (self.refreshConfigFooter.isShake) {
                //震动特效反馈
                [self 震动特效反馈];
            }
        }
        [self setMjRefreshFooter:MjRefreshFooter];
    }return MjRefreshFooter;
}

-(void)setMjRefreshFooter:(MJRefreshFooter *)mjRefreshFooter{
    objc_setAssociatedObject(self,
                             _cmd,
                             mjRefreshFooter,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
