//
//  SubCell.m
//  shadow
//
//  Created by wang on 2019/6/19.
//  Copyright © 2019 wang. All rights reserved.
//

#import "SubCell.h"
@implementation SubCellShadowView

@end
@implementation SubCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.clipsToBounds = NO;
        
        SubCellShadowView *bgView = [[SubCellShadowView alloc] init];
        
        [self insertSubview:bgView atIndex:0];
        
        self.bgView= bgView;
        
        
        
        CAShapeLayer *shadow = [CAShapeLayer layer];
        
        shadow.shadowColor = [UIColor blackColor].CGColor;
        
        shadow.shadowOffset=CGSizeMake(0,0);
        
        shadow.shadowOpacity=0.20;
        
        [bgView.layer addSublayer:shadow];
        
        bgView.shadowLayer= shadow;
        
        
        
        CALayer*line = [CALayer layer];
        
        line.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
        
        [bgView.layer addSublayer:line];
        
        bgView.separatorLine= line;
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    UIBezierPath*bgBezierPath =nil;
    
    CGFloat cornerRaduis =10.0;//觉得阴影大的可以把半径调小,半径大的话阴影面积会变大
    
    
    
    if(self.indexPath.row==0 && self.rowInSection==1) {//单组单行
        
        self.bgView.clipsToBounds=NO;
        
        self.bgView.frame=self.bounds;
        
        CGRect rect = UIEdgeInsetsInsetRect(self.bgView.bounds, UIEdgeInsetsMake(0, 20, 0, 20));
        
        bgBezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRaduis, cornerRaduis)];
        
        
        
    }else if(self.indexPath.row==0) {// 第一行
        
        self.bgView.clipsToBounds=YES;
        
        self.bgView.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(-5, 0, 0, 0));
        
        CGRect rect = UIEdgeInsetsInsetRect(self.bgView.bounds, UIEdgeInsetsMake(5, 20, 0, 20));
        
        bgBezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRaduis, cornerRaduis)];
        
        
        
    }else if(self.indexPath.row==self.rowInSection-1) {// 最后一行
        
        self.bgView.clipsToBounds=YES;
        
        self.bgView.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, 0, -5, 0));
        
        CGRect rect = UIEdgeInsetsInsetRect(self.bgView.bounds, UIEdgeInsetsMake(0, 20, 5, 20));
        
        bgBezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)  cornerRadii:CGSizeMake(cornerRaduis, cornerRaduis)];
        
        
        
    }else{// 中间行
        
        self.bgView.clipsToBounds=YES;
        
        self.bgView.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, 0, 0, 0));
        
        CGRect rect = UIEdgeInsetsInsetRect(self.bgView.bounds, UIEdgeInsetsMake(0, 20, 0, 20));
        
        bgBezierPath = [UIBezierPath bezierPathWithRect:rect];
        
        
        
    }
    
    
    
    self.bgView.shadowLayer.path= bgBezierPath.CGPath;
    
    self.bgView.shadowLayer.shadowPath= bgBezierPath.CGPath;
    
    self.bgView.shadowLayer.fillColor = [UIColor whiteColor].CGColor;
    
    
    
    
    
    //分割线 非单组单行 非最后一行
    
    if(!(self.indexPath.row==0&&self.rowInSection==1) && !(self.indexPath.row==self.rowInSection-1)) {
        
        self.bgView.separatorLine.frame = CGRectMake(self.bgView.frame.origin.x+30, self.bgView.frame.size.height-1, self.bgView.frame.size.width-30*2, 1.0);
        
    }
    
}

@end
