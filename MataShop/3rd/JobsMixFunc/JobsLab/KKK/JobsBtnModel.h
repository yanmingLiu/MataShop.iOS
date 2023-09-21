//
//  JobsBtnModel.h
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsBtnModel : NSObject

@property(nonatomic,strong)UIColor *backgroundColor;
@property(nonatomic,strong)UIImage *backgroundImage;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,strong)UIColor *titleColor;
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,assign)CGSize imageSize;
@property(nonatomic,assign)UIControlContentHorizontalAlignment contentHorizontalAlignment;
@property(nonatomic,assign)CGFloat contentSpacing;
@property(nonatomic,assign)BOOL wrapsText;

@end

NS_ASSUME_NONNULL_END
