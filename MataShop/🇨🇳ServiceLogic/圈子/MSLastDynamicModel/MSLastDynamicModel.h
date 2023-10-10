//
//  MSLastDynamicModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSLastDynamicModel : NSObject

@property(nonatomic,strong)NSURL *userImageUrl;/// 用户头像URL
@property(nonatomic,strong)UIImage *userImage;/// 用户头像Image
@property(nonatomic,strong)NSString *userTitle;/// 用户名
@property(nonatomic,strong)NSString *userSubTitle;/// 用户发表的内容
@property(nonatomic,strong)NSMutableArray <UIImage *>*imageDataMutArr;/// 图片数组
@property(nonatomic,strong)NSString *time;/// 发表时间
@property(nonatomic,strong)NSString *praise;/// 点赞数
@property(nonatomic,strong)NSString *comments;/// 评论数
@property(nonatomic,assign)BOOL isPraise;/// 是否点赞

@end

NS_ASSUME_NONNULL_END
