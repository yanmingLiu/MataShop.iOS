//
//  CustomContainerView.m
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import "CustomContainerView.h"

@interface CustomContainerView ()

@property(nonatomic,strong)NSArray<JobsBtnModel *> *buttonModels;
@property(nonatomic,assign)CGFloat offsetY;

@end

@implementation CustomContainerView
/// 禁止使用系统的alloc.init方法来进行创建对象
/// 强制用户使用-(instancetype)initWithButtonModels:(NSArray<JobsBtnModel *> *)buttonModels offsetY:(CGFloat)offsetY 来进行创建对象
-(instancetype)init{
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"`-init` unavailable. Use `-initWithReachability:` instead"
                                 userInfo:nil];
    return nil;
}
/// 禁止使用系统的new方法来进行创建对象
/// 强制用户使用-(instancetype)initWithButtonModels:(NSArray<JobsBtnModel *> *)buttonModels offsetY:(CGFloat)offsetY 来进行创建对象
+ (instancetype)new NS_UNAVAILABLE {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"'new' is not a valid method for this class. Use a custom initialization method instead."
                                 userInfo:nil];
}

-(instancetype)initWithButtonModels:(NSArray<JobsBtnModel *> *)buttonModels
                            offsetY:(CGFloat)offsetY{
    if (self = [super initWithFrame:CGRectZero]) {
        JobsIMG(<#NSString * _Nonnull imgName#>)
        self.buttonModels = buttonModels;
        self.offsetY = offsetY;
        CGFloat maxWidth = 0.0;
        CGFloat totalHeight = 0.0;
        
        for (JobsBtnModel *model in buttonModels) {
            UIButton *button = [self createButtonWithModel:model];
            [self addSubview:button];
            // 更新容器的最大宽度和总高度
            CGFloat buttonWidth = CGRectGetWidth(button.frame);
            maxWidth = MAX(maxWidth, buttonWidth);
            totalHeight += CGRectGetHeight(button.frame);
        }
        // 设置容器视图的大小
        self.frame = CGRectMake(0,
                                0,
                                maxWidth,
                                totalHeight + offsetY * (buttonModels.count - 1));
    }return self;
}

- (UIButton *)createButtonWithModel:(JobsBtnModel *)model {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = model.backgroundColor;
    [button setBackgroundImage:model.backgroundImage forState:UIControlStateNormal];
    [button setTitle:model.title forState:UIControlStateNormal];
    [button setTitleColor:model.titleColor forState:UIControlStateNormal];
    button.titleLabel.font = model.font;
    button.titleLabel.numberOfLines = model.wrapsText ? 0 : 1;
    button.contentHorizontalAlignment = model.contentHorizontalAlignment;
    
    if (model.image) {
        [button setImage:model.image forState:UIControlStateNormal];
        [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
        CGSize imageSize = model.imageSize.width > 0 && model.imageSize.height > 0 ? model.imageSize : button.imageView.image.size;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, model.contentSpacing);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, model.contentSpacing, 0, 0);
        [button setImageEdgeInsets:UIEdgeInsetsMake((button.frame.size.height - imageSize.height) / 2, 0, (button.frame.size.height - imageSize.height) / 2, model.contentSpacing)];
    } else {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    // 根据内容自动计算按钮大小
    CGSize buttonSize = [button intrinsicContentSize];
    button.frame = CGRectMake(0,
                              CGRectGetMaxY(self.subviews.lastObject.frame) + self.offsetY,
                              buttonSize.width,
                              buttonSize.height);
    
    return button;
}

@end
