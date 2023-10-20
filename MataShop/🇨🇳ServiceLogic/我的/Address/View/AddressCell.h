//
//  AddressCell.h
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import <UIKit/UIKit.h>
#import "AddressItemViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddressCellDelegate <NSObject>

- (void)onTapDefault:(AddressItemViewModel *)viewModel;
- (void)onTapDelete:(AddressItemViewModel *)viewModel;
- (void)onTapEdit:(AddressItemViewModel *)viewModel;

@end

@interface AddressCell : UITableViewCell

@property (nonatomic, weak) id<AddressCellDelegate> delegate;

+ (NSString *)reuseIdentifier;

- (void)fill:(AddressItemViewModel *)viewModel;


@end

NS_ASSUME_NONNULL_END
