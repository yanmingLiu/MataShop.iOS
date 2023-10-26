//
//  NavigationViewController.h
//  ShengAi
//
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "MacroDef_Cor.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationVC : UINavigationController<UINavigationControllerDelegate>

-(void)setupBarButtonItem:(UIViewController * __nonnull)vc
                    title:(NSString * __nullable)title
                 selector:(SEL __nonnull)selector;

@end

NS_ASSUME_NONNULL_END
