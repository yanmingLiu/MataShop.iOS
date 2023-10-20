//
//  MSMineSectionHeader.h
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSMineSectionHeader : UICollectionReusableView

@property (nonatomic, strong) NSString *title;

+ (NSString *)reuseIdentifier;

@end

NS_ASSUME_NONNULL_END
