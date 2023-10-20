//
//  MSMineCollectionReusableView.h
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MSMineCollectionReusableViewDelegate <NSObject>

- (void)onTapUserInfo;
- (void)onTapJoinMata;

@end

@interface MSMineCollectionReusableView : UICollectionReusableView

@property(nonatomic, weak) id<MSMineCollectionReusableViewDelegate> delegate;

+ (NSString *)reuseIdentifier;


@end

NS_ASSUME_NONNULL_END
