//
//  AddressBottomView.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "AddressBottomView.h"


@implementation AddressBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.addButton];
        [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 15, 0, 15));
        }];
    }
    return self;
}

- (UIButton *)addButton {
    if (!_addButton) {
        UIButtonConfiguration *config = [UIButtonConfiguration filledButtonConfiguration];
        config.title = @"添加新地址";
        config.image = JobsIMG(@"btn_add_address");
        config.imagePlacement = NSDirectionalRectEdgeLeading;
        config.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
        config.imagePadding = 4;
        config.baseBackgroundColor = JobsCor(@"#DD0000");
        config.baseForegroundColor = UIColor.whiteColor;
        config.background.cornerRadius = 8;
        config.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
            return @{NSFontAttributeName : [UIFont systemFontOfSize:16],
            };
        };
        _addButton = [UIButton buttonWithConfiguration:config primaryAction:nil];
    }
    return _addButton;
}


@end
