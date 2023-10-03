//
//  MSMyPostDynamicVC.h
//  MataShop
//
//  Created by Jobs Hi on 10/2/23.
//

#import "BaseViewController.h"
#import "JobsPostDelView.h"
#import "JobsTextView.h"

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#import "JobsUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSMyPostDynamicVC : BaseViewController
<
HXPhotoViewDelegate
,UITextViewDelegate
>

@end

NS_ASSUME_NONNULL_END
