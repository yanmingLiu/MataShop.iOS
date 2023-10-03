//
//  JobsContainerView.m
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import "JobsContainerView.h"

@interface JobsContainerView (){
    CGFloat maxWidth;/// 根据数据源得出的，当前的最大宽
    CGFloat totalHeight;
}

@property(nonatomic,strong)NSArray<JobsBtnModel *> *buttonModels;
@property(nonatomic,assign)CGFloat widthBySelf;/// 本容器的最大宽
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;

@end

@implementation JobsContainerView
#pragma mark —— 初始化方法
/// 禁止使用系统的alloc.init方法来进行创建对象
/// 强制用户使用-(instancetype)initWithValues:(id)firstValue, ... 来进行创建对象
-(instancetype)init{
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"`-init` unavailable. Use `-initWithReachability:` instead"
                                 userInfo:nil];
    return nil;
}
/// 禁止使用系统的new方法来进行创建对象
/// 强制用户使用-(instancetype)initWithValues:(id)firstValue, ... 来进行创建对象
+ (instancetype)new NS_UNAVAILABLE {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"'new' is not a valid method for this class. Use a custom initialization method instead."
                                 userInfo:nil];
}

- (instancetype)initWithWidth:(CGFloat)widthBySelf
                 buttonModels:(NSArray<JobsBtnModel *> *)buttonModels{
    if (self = [super initWithFrame:CGRectZero]) {
        if([buttonModels isKindOfClass:NSArray.class]){
            
            self.widthBySelf = widthBySelf;
            self.buttonModels = buttonModels;
            maxWidth = 0.f;
            totalHeight = 0.f;
            totalHeight = 0.f;
            
            [self createByModels:buttonModels];
            /// 重设Btn中心X
            for (UIButton *btn in self.btnMutArr) {
                btn.centerX = maxWidth / 2;
            }
        }
    }return self;
}
#pragma mark —— 一些私有方法
-(void)createByModels:(NSArray<JobsBtnModel *> *)buttonModels{

    CGFloat nbtnY = 0.0f;// 本次的Btn的头Y
    CGFloat btnBottom = 0.f;// 本次的Btn的底Y
    
    NSInteger index = 0;
    CGFloat buttonHeight = 0.0;

    for (JobsBtnModel *model in buttonModels) {

        if(model.btnWidth){
            maxWidth = MAX(maxWidth, model.btnWidth);
        }else{
            if(model.lineBreakMode){// 不提行的情况下，因为字数超出，子控件是可以超出父视图容器的
                NSDictionary *attributes = @{NSFontAttributeName: model.titleFont};
                maxWidth = MAX(maxWidth, [model.normalTitle sizeWithAttributes:attributes].width);
            }else{
                maxWidth = self.widthBySelf;
            }
        }
        
        UIButton *button = [self createButtonWithModel:model];
        [self.btnMutArr addObject:button];
        [self addSubview:button];
        
        buttonHeight = CGRectGetHeight(button.frame);
        totalHeight += buttonHeight + model.contentSpacing;
        
        if(index){
            nbtnY += btnBottom + model.contentSpacing;
        }else{
            btnBottom = button.height;
        }
        button.y = nbtnY;
        index += 1;
    }
    // 设置容器视图的大小
    self.jobsSize = CGSizeMake(maxWidth, totalHeight);
}
/// 批量创建UIButton（使之兼容图文）
/// - Parameter model: 数据源
-(UIButton *)createButtonWithModel:(JobsBtnModel *)model{
    @jobs_weakify(self)
    BaseButton *button = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                           background:nil
                                                       titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                        textAlignment:NSTextAlignmentCenter
                                                          normalImage:model.normalImage
                                                       highlightImage:nil
                                                      attributedTitle:model.normalAttributedTitle
                                              selectedAttributedTitle:nil
                                                   attributedSubtitle:nil
                                                                title:model.normalTitle
                                                             subTitle:nil
                                                            titleFont:model.titleFont
                                                         subTitleFont:nil
                                                             titleCor:model.normalTitleColor
                                                          subTitleCor:nil
                                                   titleLineBreakMode:model.lineBreakMode
                                                subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                  baseBackgroundColor:model.backgroundColor
                                                         imagePadding:JobsWidth(0)
                                                         titlePadding:JobsWidth(0)
                                                       imagePlacement:NSDirectionalRectEdgeLeading
                                           contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                             contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                        contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                    cornerRadiusValue:JobsWidth(16)
                                                      roundingCorners:UIRectCornerAllCorners
                                                 roundingCornersRadii:CGSizeZero
                                                       layerBorderCor:nil
                                                          borderWidth:JobsWidth(1)
                                                        primaryAction:nil
                                                      clickEventBlock:^id(BaseButton *x) {
        @jobs_strongify(self)
        x.selected = !x.selected;
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }];
    button.width = maxWidth;
    // 计算按钮文本所需的高度
    CGSize buttonSize = [button.titleLabel sizeThatFits:CGSizeMake(button.frame.size.width, CGFLOAT_MAX)];
    // 调整按钮的高度，确保文本不超出按钮的边界
    button.height = buttonSize.height;
    return button;
}
#pragma mark —— lazyLoad
-(NSMutableArray<UIButton *> *)btnMutArr{
    if(!_btnMutArr){
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}

@end
