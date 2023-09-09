//
//  BaiShaETProjCreditRecordTBVCell.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaiShaETProjCreditRecordTBVCellModel : NSObject

@property(nonatomic,strong)UIImage *iconIMG;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *titleValue;
@property(nonatomic,strong)NSString *subTitle;
@property(nonatomic,strong)NSString *subTitleValue;
@property(nonatomic,assign)BOOL isIncrease;// 绿+、红-

@end

@interface BaiShaETProjCreditRecordTBVCell : UITableViewCell

@end

NS_ASSUME_NONNULL_END
