//
//  UITextField+Placeholder.m
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
/// 修改Placeholder亦可以通过富文本来完成
-(NSAttributedString *)defaultAttributedPlaceholder{
    return [self richTextWithDataConfigMutArr:self.defaultAttributedDataForPlaceHolderMutArr];
}

-(UILabel *)placeholderLabel{
    //placeholder为nil或者为@"",placeholderLabel均为nil
    if (!self.placeholder.length || !self.placeholder) {
        self.placeholder = @" ";
    }
    Ivar ivar = class_getInstanceVariable(UITextField.class, "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self, ivar);
    placeholderLabel.numberOfLines = 0;/// 默认折行处理
    return placeholderLabel;
}
#pragma mark —— @property(nonatomic,strong)UIColor *placeholderColor;
@dynamic placeholderColor;
-(UIColor *)placeholderColor{
    UIColor *PlaceholderColor = objc_getAssociatedObject(self, _cmd);
    if (!PlaceholderColor) {
        PlaceholderColor = self.textColor;
        self.placeholderLabel.textColor = PlaceholderColor;
        objc_setAssociatedObject(self,
                                 _cmd,
                                 PlaceholderColor,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return PlaceholderColor;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    self.placeholderLabel.textColor = placeholderColor;
    objc_setAssociatedObject(self,
                             _cmd,
                             placeholderColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIFont *placeholderFont;
@dynamic placeholderFont;
-(UIFont *)placeholderFont{
    UIFont *PlaceholderFont = objc_getAssociatedObject(self, _cmd);
    if (!PlaceholderFont) {
        PlaceholderFont = self.font;
        self.placeholderLabel.font = PlaceholderFont;
        objc_setAssociatedObject(self,
                                 _cmd,
                                 PlaceholderFont,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return PlaceholderFont;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    self.placeholderLabel.font = placeholderFont;
    objc_setAssociatedObject(self,
                             _cmd,
                             placeholderFont,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <RichTextConfig *>*defaultAttributedDataMutArr;
@dynamic defaultAttributedDataForPlaceHolderMutArr;
-(NSMutableArray<RichTextConfig *> *)defaultAttributedDataForPlaceHolderMutArr{
    NSMutableArray *DefaultAttributedDataMutArr = objc_getAssociatedObject(self, _cmd);
    if (!DefaultAttributedDataMutArr) {
        DefaultAttributedDataMutArr = NSMutableArray.array;
        
        {
            RichTextConfig *richTextConfig = RichTextConfig.new;
            richTextConfig.targetString = self.placeholder;
            richTextConfig.font = UIFontWeightRegularSize(10);
            richTextConfig.textCor = UIColor.blueColor;
    //        richTextConfig.underlineStyle;
    //        richTextConfig.paragraphStyle;
    //        richTextConfig.urlStr;
            richTextConfig.range =  NSMakeRange(0, self.placeholder.length);
            [DefaultAttributedDataMutArr addObject:richTextConfig];
        }
        objc_setAssociatedObject(self,
                                 _cmd,
                                 DefaultAttributedDataMutArr,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return DefaultAttributedDataMutArr;
}

-(void)setDefaultAttributedDataForPlaceHolderMutArr:(NSMutableArray<RichTextConfig *> *)defaultAttributedDataMutArr{
    objc_setAssociatedObject(self,
                             _cmd,
                             defaultAttributedDataMutArr,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
