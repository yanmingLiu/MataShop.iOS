//
//  MSMineSectionHeader.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "MSMineSectionHeader.h"

@interface MSMineSectionHeader ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MSMineSectionHeader

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.leading.equalTo(self).offset(20);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = JobsCor(@"#333333");
    }
    return _titleLabel;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

@end
