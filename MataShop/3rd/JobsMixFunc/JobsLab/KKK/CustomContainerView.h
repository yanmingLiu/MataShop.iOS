//
//  CustomContainerView.h
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import <UIKit/UIKit.h>
#import "JobsBtnModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomContainerView : UIView
/// 禁止使用系统的 alloc.init 和 new方法来进行创建对象
+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;
-(instancetype)initWithButtonModels:(NSArray<JobsBtnModel *> *)buttonModels
                            offsetY:(CGFloat)offsetY;
@end

NS_ASSUME_NONNULL_END
/**

 要求：
 1、用OC代码作答下列需求；
 2、自定义一个容器View；
     2.1、这个容器有个属性：每个子元素之间的垂直距离offsetY；
 3、里面从上至下首尾相接铺满UIButton；
 4、UIButton的个数是根据外界传入的数组A决定的；
     4.1、这个数组是可变数组；
     4.2、数组里面存放的元素是一个继承于NSObject的Model；
     4.3、这个Model的属性是对UIButton的配置信息：
         4.3.1、UIButton的背景色、
     4.3.2、背景图片、
     4.3.3、文字内容、
     4.3.4、字体、
     4.3.5、字体颜色、
     4.3.6、图片、
     4.3.7、图片的Size、
     4.3.8、图片和文字的相对位置（图左文字右/图右文字左/图上文字下/图下文字上）、
     4.3.9、图片和文字之间的距离、
     4.3.10、文字是否换行显示；
 5、这两个UIButton是铺满整个容器View的；
     5.1、这个容器View的宽 = 是依据外界传入的数组A里面对UIButton的配置而来的所有UIButton相比较以后得的最大宽度距离；
     5.2、这个容器View的高 = 是依据外界传入的数组A里面对UIButton的配置而来的所有UIButton的高 + 每个子元素之间的垂直距离offsetY；
     5.3、第一个UIButton的上边界与这个容器View的上边界对齐；
     5.4、最后一个UIButton的上边界与这个容器View的下边界对齐；
     5.5、容器View里面装着的是依据外界传入的数组A（数组里面装的是UIButton各项配置），自上而下紧挨着排布的，子元素之间的垂直距离offsetY。UIButton的个数 = 数组A的元素个数
 
 */
