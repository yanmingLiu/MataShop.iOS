//
//  SubCell.h
//  shadow
//
//  Created by wang on 2019/6/19.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubCellShadowView :UIView

@property (nonatomic, strong) CAShapeLayer *shadowLayer;

@property (nonatomic, strong) CALayer *separatorLine;

@end

@interface SubCell : UITableViewCell
@property (nonatomic, strong) SubCellShadowView *bgView;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic) NSInteger rowInSection;//每一组的行数


@end

NS_ASSUME_NONNULL_END
