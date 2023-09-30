//
//  ZMJCell+CustomView.m
//  Casino
//
//  Created by Jobs on 2021/12/8.
//

#import "ZMJCell+CustomView.h"

@implementation ZMJCell (CustomView)
#pragma mark —— @property(nonatomic,strong)UIButton *btn;
JobsKey(_btn)
@dynamic btn;
-(UIButton *)btn{
    UIButton *Btn = Jobs_getAssociatedObject(_btn);
    if (!Btn) {
        Btn = UIButton.new;
        Btn.frame = self.bounds;
        Btn.userInteractionEnabled = NO;//❤️cell上加button，要相应cell协议就要关闭button的userInteractionEnabled，如果要相应Button则需要打开
        Btn.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        Btn.titleLabel.font = UIFontWeightBlackSize(10);
        Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        Btn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:Btn];
        Jobs_setAssociatedRETAIN_NONATOMIC(_btn, Btn);
    }return Btn;
}

-(void)setBtn:(UIButton *)btn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_btn, btn);
}
#pragma mark —— @property(nonatomic,strong)UIView *colorBarView;
JobsKey(_colorBarView)
@dynamic colorBarView;
-(UIView *)colorBarView{
    UIView *ColorBarView = Jobs_getAssociatedObject(_colorBarView);
    if (!ColorBarView) {
        ColorBarView = UIView.new;
        ColorBarView.backgroundColor = self.color;
        ColorBarView.frame = CGRectInset(self.bounds, 2, 2);
        [self.contentView addSubview:ColorBarView];
        Jobs_setAssociatedRETAIN_NONATOMIC(_colorBarView, ColorBarView)
    }return ColorBarView;
}

-(void)setColorBarView:(UIView *)colorBarView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_colorBarView, colorBarView)
}
#pragma mark —— @property(nonatomic,strong)UIColor *color;
JobsKey(_color)
@dynamic color;
-(UIColor *)color{
    UIColor *Color = Jobs_getAssociatedObject(_color);
    if (!Color) {
        Color = UIColor.blueColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_color, Color)
    }return Color;
}

-(void)setColor:(UIColor *)color{
    Jobs_setAssociatedRETAIN_NONATOMIC(_color, color)
}

@end
