//
//  MSMyTeamHeadView.m
//  MataShop
//
//  Created by Mac on 2023/10/25.
//

#import "MSMyTeamHeadView.h"

@interface MSMyTeamHeadView ()
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UILabel *dayAddLabel;
@property(nonatomic,strong)UILabel *monthAddLabel;
@property(nonatomic,strong)UILabel *totalLabel;
@end

@implementation MSMyTeamHeadView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo (0);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(25+JobsNavigationHeight(nil));
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(30);
        }];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.top.mas_equalTo(30+JobsNavigationHeight(nil));
            make.left.mas_equalTo(10);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(36);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(25);
            make.left.mas_equalTo(25);
            make.right.mas_equalTo(-25);
        }];
        self.dayAddLabel.hidden = NO;
        self.monthAddLabel.hidden = NO;
        self.totalLabel.hidden = NO;
    }
    return self;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = Internationalization(@"我的团队");
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = JobsWhiteColor;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        _imageView.image = JobsIMG(@"活动圈子背景图");
        [self addSubview:_imageView];
        
    }return _imageView;
}
-(UIView *)contentView{
    if(!_contentView){
        _contentView = UIImageView.new;
        _contentView.backgroundColor = UIColor.whiteColor;
        _contentView.layer.cornerRadius = 4;
        _contentView.layer.masksToBounds = YES;
        [self addSubview:_contentView];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"团队数据");
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = JobsCor(@"#ee4c2a");
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView);
        }];
        self.timeLabel = [UILabel new];
        self.timeLabel.text = Internationalization(@"截至2023.04.06 10:14");
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = JobsCor(@"#ee4c2a");
        [_contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self.contentView);
        }];
    }return _contentView;
}
-(UILabel *)dayAddLabel{
    if (!_dayAddLabel) {
        _dayAddLabel = [UILabel new];
        _dayAddLabel.text = Internationalization(@"4123");
        _dayAddLabel.font = [UIFont systemFontOfSize:28];
        _dayAddLabel.textColor = JobsCor(@"#ffffff");
//        _dayAddLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_dayAddLabel];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"今日新增");
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = JobsCor(@"#ffffff");
//        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(25);
            make.top.mas_equalTo(self.contentView.mas_bottom).offset(25);
        }];
        [self.dayAddLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(25);
            make.top.mas_equalTo(label.mas_bottom).offset(10);
        }];
    }
    return _dayAddLabel;
}
-(UILabel *)monthAddLabel{
    if (!_monthAddLabel) {
        _monthAddLabel = [UILabel new];
        _monthAddLabel.text = Internationalization(@"45667");
        _monthAddLabel.font = [UIFont systemFontOfSize:28];
        _monthAddLabel.textColor = JobsCor(@"#ffffff");
//        _dayAddLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_monthAddLabel];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"本月新增");
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = JobsCor(@"#ffffff");
//        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(140);
            make.top.mas_equalTo(self.contentView.mas_bottom).offset(25);
        }];
        [self.monthAddLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(140);
            make.top.mas_equalTo(label.mas_bottom).offset(10);
        }];
    }
    return _monthAddLabel;
}
-(UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [UILabel new];
        _totalLabel.text = Internationalization(@"7880798");
        _totalLabel.font = [UIFont systemFontOfSize:28];
        _totalLabel.textColor = JobsCor(@"#ffffff");
//        _dayAddLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_totalLabel];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"当前总人数");
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = JobsCor(@"#ffffff");
//        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(250);
            make.top.mas_equalTo(self.contentView.mas_bottom).offset(25);
        }];
        [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(250);
            make.top.mas_equalTo(label.mas_bottom).offset(10);
        }];
    }
    return _totalLabel;
}
-(UIButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                                  titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:JobsIMG(@"全局返回箭头")
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:@""
                                                        subTitle:nil
                                                       titleFont:UIFontWeightMediumSize(14)
                                                    subTitleFont:nil
                                                        titleCor:JobsCor(@"#FFFFFF")
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:JobsClearColor
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
                                                  imagePlacement:NSDirectionalRectEdgeNone
                                      contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                        contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                   contentInsets:jobsSameDirectionalEdgeInsets(0)
                                               cornerRadiusValue:JobsWidth(0)
                                                 roundingCorners:UIRectCornerAllCorners
                                            roundingCornersRadii:CGSizeZero
                                                  layerBorderCor:nil
                                                     borderWidth:JobsWidth(0)
                                                   primaryAction:nil
                                                 clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_leftBtn];
    }return _leftBtn;
}
@end
