//
//  JobsLabBaseModel.h
//  Casino
//
//  Created by Jobs on 2021/12/16.
//

#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSInteger {
    /// 以头部或者左边为对齐基准
    JobsUpDownLabAlign_TopLeft = 0,
    /// 以中心线为对齐基准
    JobsUpDownLabAlign_MiddleLine,
    /// 以底部或者右边为对齐基准
    JobsUpDownLabAlign_BottomRight,
} JobsUpDownLabAlign;/// JobsUpDownLabStyle的对齐基准

@interface JobsLabBaseModel : UIViewModel

@property(nonatomic,assign)CGFloat rate;/// UpLab 和 DownLab的上下占比,默认为0.5（上下均等分）
@property(nonatomic,assign)CGFloat space;/// 间距 【当对齐基准为JobsUpDownLabAlign_MiddleLine失效】
@property(nonatomic,assign)JobsUpDownLabAlign upLabVerticalAlign;/// 上控件的垂直对齐基准
@property(nonatomic,assign)JobsUpDownLabAlign upLabLevelAlign;/// 上控件的水平对齐基准
@property(nonatomic,assign)JobsUpDownLabAlign downLabVerticalAlign;/// 下控件的垂直对齐基准
@property(nonatomic,assign)JobsUpDownLabAlign downLabLevelAlign;/// 下控件的水平对齐基准
#pragma mark —— UpLab / LeftLab
@property(nonatomic,assign)CGFloat upLabWidth;/// 预设值宽
@property(nonatomic,assign)CGFloat upLabHeight;/// 预设值高
@property(nonatomic,strong)UIColor *upLabTextCor;
@property(nonatomic,strong)UIColor *upLabBgCor;
@property(nonatomic,strong)UIFont *upLabFont;
@property(nonatomic,strong)NSString *upLabText;
@property(nonatomic,strong)UIImage *upLabImage;
@property(nonatomic,strong)UIImage *upLabBgImage;
@property(nonatomic,assign)NSTextAlignment upLabTextAlignment;
@property(nonatomic,assign)NSLineBreakMode upLabLineBreakMode;
@property(nonatomic,assign)NSInteger upLabNumberOfLines;
@property(nonatomic,strong)NSAttributedString *upLabAttributedText;
/// SuppressWdeprecatedDeclarationsWarning
@property(nonatomic)UIEdgeInsets upLabContentEdgeInsets API_DEPRECATED("This property is ignored when using UIButtonConfiguration", ios(2.0,15.0), tvos(2.0,15.0)) UI_APPEARANCE_SELECTOR;/// default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.
@property(nonatomic)UIEdgeInsets upLabTitleEdgeInsets API_DEPRECATED("This property is ignored when using UIButtonConfiguration", ios(2.0,15.0), tvos(2.0,15.0));/// default is UIEdgeInsetsZero
@property(nonatomic)UIEdgeInsets upLabImageEdgeInsets API_DEPRECATED("This property is ignored when using UIButtonConfiguration", ios(2.0,15.0), tvos(2.0,15.0));/// default is UIEdgeInsetsZero
@property(nonatomic,assign)BOOL isUpLabMultiLineShows;// 是否多行行显示【默认单行显示】
#pragma mark —— DownLab / RightLab
@property(nonatomic,assign)CGFloat downLabWidth;/// 预设值宽
@property(nonatomic,assign)CGFloat downLabHeight;/// 预设值高
@property(nonatomic,strong)UIColor *downLabTextCor;
@property(nonatomic,strong)UIColor *downLabBgCor;
@property(nonatomic,strong)UIFont *downLabFont;
@property(nonatomic,strong)NSString *downLabText;
@property(nonatomic,strong)UIImage *downLabImage;
@property(nonatomic,strong)UIImage *downLabBgImage;
@property(nonatomic,assign)NSTextAlignment downLabTextAlignment;
@property(nonatomic,assign)NSLineBreakMode downLabLineBreakMode;
@property(nonatomic,assign)NSInteger downLabNumberOfLines;
@property(nonatomic,strong)NSAttributedString *downLabAttributedText;
//SuppressWdeprecatedDeclarationsWarning
@property(nonatomic)UIEdgeInsets downLabContentEdgeInsets API_DEPRECATED("This property is ignored when using UIButtonConfiguration", ios(2.0,15.0), tvos(2.0,15.0)) UI_APPEARANCE_SELECTOR;/// default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.
@property(nonatomic)UIEdgeInsets downLabTitleEdgeInsets API_DEPRECATED("This property is ignored when using UIButtonConfiguration", ios(2.0,15.0), tvos(2.0,15.0));/// default is UIEdgeInsetsZero
@property(nonatomic)UIEdgeInsets downLabImageEdgeInsets API_DEPRECATED("This property is ignored when using UIButtonConfiguration", ios(2.0,15.0), tvos(2.0,15.0));/// default is UIEdgeInsetsZero
@property(nonatomic,assign)BOOL isDownLabMultiLineShows;/// 是否多行行显示【默认单行显示】。如需多行显示，字符串内需要添加换行符，例如：@"開啟手勢密碼，系統將默認記住您的賬戶密碼\n進入免登陸狀態"

@end

NS_ASSUME_NONNULL_END
/**
 NSLineBreakMode是Objective-C中的一个枚举类型，用于定义文本在超出指定区域时如何进行换行处理。
 它决定了在什么地方文本会被切断成多行或如何处理文本的结尾部分，以适应指定的显示区域。
 NSLineBreakMode常用于文本绘制、文本布局和界面设计等方面。

 以下是NSLineBreakMode枚举的一些常见值和它们的含义：
 NSLineBreakByWordWrapping：按单词换行，文本会在单词之间断开，以确保整个单词都显示在同一行内，如果无法容纳整个单词，则将单词移到下一行。
 NSLineBreakByCharWrapping：按字符换行，文本会在字符之间断开，不考虑单词的边界。这意味着单词可能会被分割，以适应指定的区域。
 NSLineBreakByClipping：超出显示区域的文本部分会被剪切，而不会换行。文本将在显示区域的边缘处截断。
 NSLineBreakByTruncatingHead：如果文本超出显示区域，将在文本的开头部分添加省略号（...）以指示被截断的文本。
 NSLineBreakByTruncatingTail：如果文本超出显示区域，将在文本的结尾部分添加省略号（...）以指示被截断的文本。
 NSLineBreakByTruncatingMiddle：如果文本超出显示区域，将在文本的中间部分添加省略号（...）以指示被截断的文本。
 NSLineBreakMode允许你根据文本和显示需求选择适当的换行方式，以确保文本在界面上以可读的方式显示出来。
 
 这对于处理不同屏幕尺寸和方向以及文本长度不同的情况非常有用。
 你可以将其用于文本绘制、UILabel、UITextView等UI元素中的文本布局和显示配置。
 */
