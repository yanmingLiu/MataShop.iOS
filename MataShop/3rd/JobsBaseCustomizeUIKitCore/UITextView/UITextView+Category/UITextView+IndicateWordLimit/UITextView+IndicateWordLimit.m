//
//  UITextView+IndicateWordLimit.m
//  DouDong-II
//
//  Created by Jobs on 2021/2/25.
//

#import "UITextView+IndicateWordLimit.h"

@implementation UITextView (IndicateWordLimit)
#pragma mark —— @property(nonatomic,strong)UILabel *indicateWordLimitLab;
@dynamic indicateWordLimitLab;
-(UILabel *)indicateWordLimitLab{
    UILabel *IndicateWordLimitLab = objc_getAssociatedObject(self, _cmd);
    if (!IndicateWordLimitLab) {
        IndicateWordLimitLab = UILabel.new;
        IndicateWordLimitLab.textColor = RGB_COLOR(132, 134, 140);
        IndicateWordLimitLab.textAlignment = NSTextAlignmentCenter;
        IndicateWordLimitLab.font = UIFontWeightMediumSize(10);
        IndicateWordLimitLab.text = [NSString stringWithFormat:@"   %ld / %ld   ",self.currentWordNum,self.wordLimitNum];
        [IndicateWordLimitLab makeLabelByShowingType:UILabelShowingType_03];
        [self addSubview:IndicateWordLimitLab];
        IndicateWordLimitLab.right = self.width - self.offsetX;
        IndicateWordLimitLab.bottom = self.height - self.offsetY;
        [self setIndicateWordLimitLab:IndicateWordLimitLab];
    }return IndicateWordLimitLab;
}

-(void)setIndicateWordLimitLab:(UILabel *)indicateWordLimitLab{
    objc_setAssociatedObject(self,
                             _cmd,
                             indicateWordLimitLab,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)NSInteger currentWordNum;//当前输入的字符数
@dynamic currentWordNum;
-(NSInteger)currentWordNum{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

-(void)setCurrentWordNum:(NSInteger)currentWordNum{
    self.indicateWordLimitLab.text = [NSString stringWithFormat:@"   %ld / %ld   ",currentWordNum,self.wordLimitNum];
    [self.indicateWordLimitLab makeLabelByShowingType:UILabelShowingType_03];
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithInteger:currentWordNum],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)NSInteger wordimitNum;//字符输入上限
@dynamic wordLimitNum;
-(NSInteger)wordLimitNum{
    NSInteger WordLimitNum = [objc_getAssociatedObject(self, _cmd) integerValue];
    if (!WordLimitNum) {
        WordLimitNum = 500;
        [self setWordLimitNum:WordLimitNum];
    }return WordLimitNum;
}

-(void)setWordLimitNum:(NSInteger)wordLimitNum{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithInteger:wordLimitNum],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)CGFloat offsetX;
@dynamic offsetX;
-(CGFloat)offsetX{
    CGFloat OffsetX = [objc_getAssociatedObject(self, _cmd) floatValue];
    if (!OffsetX) {
        OffsetX = JobsWidth(19.1);
        [self setOffsetX:OffsetX];
    }return OffsetX;
}

-(void)setOffsetX:(CGFloat)offsetX{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithFloat:offsetX],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)CGFloat offsetY;
@dynamic offsetY;
-(CGFloat)offsetY{
    CGFloat OffsetY = [objc_getAssociatedObject(self, _cmd) floatValue];
    if (!OffsetY) {
        OffsetY = JobsWidth(13.1);
        [self setOffsetY:OffsetY];
    }return OffsetY;
}

-(void)setOffsetY:(CGFloat)offsetY{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithFloat:offsetY],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
