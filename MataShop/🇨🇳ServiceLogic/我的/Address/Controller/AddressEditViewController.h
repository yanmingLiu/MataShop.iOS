//
//  AddressEdotViewController.h
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddressEditViewControllerDelegate <NSObject>

- (void)saveAddressSuccess;

@end

@interface AddressEditViewController : BaseViewController

@property (nonatomic, weak) id<AddressEditViewControllerDelegate> delegate;

@property (nonatomic, assign) BOOL isEdit;

@end

NS_ASSUME_NONNULL_END
