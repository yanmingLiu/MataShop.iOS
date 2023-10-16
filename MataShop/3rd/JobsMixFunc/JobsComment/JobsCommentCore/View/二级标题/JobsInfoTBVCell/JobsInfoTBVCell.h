//
//  InfoTBVCell.h
//  commentList
//
//  Created by Jobs on 2020/7/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellProtocol.h"
#import "UITableViewCellProtocol.h"
#import "UIImage+YBGIF.h"
#import "UIButton+UI.h"
#import "UIView+Measure.h"
#import "MacroDef_QUEUE.h"

#import "RBCLikeButton.h"
#import "JobsCommentConfig.h"
#import "JobsCommentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsInfoTBVCell : UITableViewCell
<
BaseCellProtocol
,UITableViewCellProtocol
>

-(RBCLikeButton *)getLikeBtn;

@end

NS_ASSUME_NONNULL_END
