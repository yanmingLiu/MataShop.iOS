//
//  UITipsViewProtocol.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UITipsViewProtocol <NSObject>

@optional
@property(nonatomic,strong)UIImageView *titleIMGV;
@property(nonatomic,strong)UIImageView *subTitleIMGV;
@property(nonatomic,strong)UILabel *tipsLab;
@property(nonatomic,strong)UIButton *submitBtn;

@end

NS_ASSUME_NONNULL_END
