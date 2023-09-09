//
//  BaiShaETProjHeaderIconModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSInteger {
    /// 一般模式
    HeaderIconCVCellStyleNormal = 0,
    /// 更换模式
    HeaderIconCVCellStyleChange
} HeaderIconCVCellStyle;

@interface BaiShaETProjHeaderIconModel : UIViewModel

@property(nonatomic,assign)HeaderIconCVCellStyle headerIconCellStyle;

@end

NS_ASSUME_NONNULL_END
