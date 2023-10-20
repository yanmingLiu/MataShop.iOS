//
//  MSMineCollectionReusableView.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMineCollectionReusableView.h"

@interface MSMineCollectionReusableView ()

@property(nonatomic,strong)UIImageView *avatar;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *accountLabel;
@property(nonatomic,strong)UIImageView *arrowImageView;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIButton *mataButton;
@property(nonatomic,strong)UIButton *joinMataButton;
@property(nonatomic,strong)CAGradientLayer *gradientLayer;

@end

@implementation MSMineCollectionReusableView

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self setupData];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-60);
}


- (void)setupData {
    self.nameLabel.text = @"赵露思";
    self.accountLabel.text = @"138****8888";
    self.avatar.image = JobsIMG(@"用户默认头像");
    self.arrowImageView.image = JobsIMG(@"向右箭头");
}

- (void)setupUI {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.colors = @[(__bridge id)JobsCor(@"#E81A11").CGColor, (__bridge id)JobsCor(@"#F26A38").CGColor];
    layer.startPoint = CGPointMake(0.5, 0);
    layer.endPoint = CGPointMake(0.5, 1);
    layer.locations = @[@0, @1];
    [self.layer addSublayer:layer];
    self.gradientLayer = layer;

    [self addSubview:self.avatar];
    [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(13);
        make.bottom.equalTo(self).offset(-72);
        make.size.mas_equalTo(CGSizeMake(56, 56));
    }];

    UIStackView *nameStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.nameLabel, self.accountLabel]];
    nameStack.alignment = UIStackViewAlignmentLeading;
    nameStack.axis = UILayoutConstraintAxisVertical;
    nameStack.spacing = 8;
    [self addSubview:nameStack];
    [nameStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.avatar.mas_trailing).offset(16);
        make.centerY.equalTo(self.avatar);
        make.trailing.equalTo(self).offset(-52);
    }];

    [self addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-16);
        make.centerY.equalTo(self.avatar);
    }];

    UIButton *userInfoButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [userInfoButton addAction:[self tapUserInfo] forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:userInfoButton];
    [userInfoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self);
        make.top.bottom.equalTo(self.avatar);
    }];

    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(10);
        make.trailing.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-12);
        make.height.mas_equalTo(36);
    }];

    [self.bottomView addSubview:self.mataButton];
    [self.mataButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.leading.equalTo(self.bottomView).offset(16);
    }];

    [self.bottomView addSubview:self.joinMataButton];
    [self.joinMataButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.trailing.equalTo(self.bottomView).offset(-4);
    }];

}

#pragma mark —— lazyLoad

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nameLabel.textColor = UIColor.whiteColor;
    }
    return _nameLabel;
}

- (UIImageView *)avatar {
    if(!_avatar){
        _avatar = UIImageView.new;
        _avatar.contentMode = UIViewContentModeScaleAspectFill;
        _avatar.layer.masksToBounds = YES;
        _avatar.layer.cornerRadius = 28;
    }
    return _avatar;
}

- (UILabel *)accountLabel {
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc] init];
        _accountLabel.font = [UIFont systemFontOfSize:14];
        _accountLabel.textColor = UIColor.whiteColor;
    }
    return _accountLabel;
}

- (UIImageView *)arrowImageView {
    if(!_arrowImageView){
        _arrowImageView = UIImageView.new;
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _arrowImageView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = JobsCor(@"#F0F0EF");
        _bottomView.layer.masksToBounds = YES;
        _bottomView.layer.cornerRadius = 18;
    }
    return _bottomView;
}

- (UIButton *)mataButton {
    if (!_mataButton) {
        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
        config.image = JobsIMG(@"入职Mata");
        config.title = @"入职Mata";
        config.imagePlacement = NSDirectionalRectEdgeLeading;
        config.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
        config.imagePadding = 8;
        config.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
            return @{NSFontAttributeName : [UIFont systemFontOfSize:14],
                     NSForegroundColorAttributeName: JobsCor(@"#333333")
            };
        };
        _mataButton = [UIButton buttonWithConfiguration:config primaryAction:nil];
    }
    return _mataButton;
}

- (UIButton *)joinMataButton {
    if (!_joinMataButton) {
        UIButtonConfiguration *config = [UIButtonConfiguration filledButtonConfiguration];
        config.title = @"立即进入";
        config.baseBackgroundColor = JobsCor(@"#EA2918");
        config.baseForegroundColor = UIColor.whiteColor;
        config.cornerStyle = UIButtonConfigurationCornerStyleCapsule;
        config.contentInsets = NSDirectionalEdgeInsetsMake(6, 16, 6, 16);
        config.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
            return @{NSFontAttributeName : [UIFont boldSystemFontOfSize:14],
            };
        };
        _joinMataButton = [UIButton buttonWithConfiguration:config primaryAction:[self joinAction]];
    }
    return _joinMataButton;

}

- (UIAction *)joinAction {
    __weak typeof(self) wSelf = self;
    return [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        [wSelf.delegate onTapJoinMata];
    }];
}

- (UIAction *)tapUserInfo {
    __weak typeof(self) wSelf = self;
    return [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        [wSelf.delegate onTapUserInfo];
    }];
}


@end
