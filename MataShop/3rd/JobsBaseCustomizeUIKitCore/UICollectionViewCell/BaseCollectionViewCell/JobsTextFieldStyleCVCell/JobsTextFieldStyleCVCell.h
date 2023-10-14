//
//  JobsTextFieldStyleCVCell.h
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "JobsBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN
/// 只在JobsBaseCollectionViewCell完整的盖一个TextField
@interface JobsTextFieldStyleCVCell : JobsBaseCollectionViewCell<UITextFieldDelegate>

-(ZYTextField *)getTextField;

@end

NS_ASSUME_NONNULL_END
