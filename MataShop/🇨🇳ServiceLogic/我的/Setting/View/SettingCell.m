//
//  SettingCell.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "SettingCell.h"

@interface SettingCell ()

@property (nonatomic, strong) UIView *line;
@property(nonatomic,strong)UIImageView *arrowImageView;

@end

@implementation SettingCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}
//
//- (void)setupUI {
//    self.backgroundColor = UIColor.clearColor;
//    self.contentView.backgroundColor = UIColor.clearColor;
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    self.container = [[UIView alloc] init];
//    self.container.backgroundColor = UIColor.whiteColor;
//    self.container.clipsToBounds = YES;
//    self.container.layer.cornerRadius = 4;
//    [self.contentView addSubview:self.container];
//    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 0, 10));
//    }];
//
//    self.nameLabel = [[UILabel alloc] init];
//    self.nameLabel.font = [UIFont systemFontOfSize:16];
//    self.nameLabel.textColor = JobsCor(@"#333333");
//    [self.container addSubview:self.nameLabel];
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.container).offset(15);
//        make.top.equalTo(self.container).offset(20);
//    }];
//
//    self.phoneLabel = [[UILabel alloc] init];
//    self.phoneLabel.font = [UIFont systemFontOfSize:16];
//    self.phoneLabel.textColor = JobsCor(@"#333333");
//    [self.container addSubview:self.phoneLabel];
//    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.nameLabel.mas_trailing).offset(10);
//        make.centerY.equalTo(self.nameLabel);
//        make.trailing.lessThanOrEqualTo(self.container).offset(-15);
//    }];
//
//    self.buttonsView = [[UIView alloc] init];
//    [self.container addSubview:self.buttonsView];
//    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.bottom.equalTo(self.container);
//        make.height.mas_equalTo(49);
//    }];
//
//    self.line = [[UIView alloc] init];
//    self.line.backgroundColor = JobsCor(@"#FAFBFA");
//    [self.buttonsView addSubview:self.line];
//    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.top.equalTo(self.buttonsView);
//        make.height.mas_equalTo(1);
//    }];
//
//    [self.buttonsView addSubview:self.defaultButton];
//    [self.defaultButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.buttonsView).offset(11);
//        make.bottom.equalTo(self.buttonsView);
//        make.top.equalTo(self.buttonsView).offset(1);
//    }];
//
//    [self.buttonsView addSubview:self.editButton];
//    [self.editButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(self.buttonsView).offset(-15);
//        make.bottom.equalTo(self.buttonsView);
//        make.top.equalTo(self.buttonsView).offset(1);
//    }];
//
//
//    [self.buttonsView addSubview:self.deleteButton];
//    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(self.editButton.mas_leading).offset(-20);
//        make.bottom.equalTo(self.buttonsView);
//        make.top.equalTo(self.buttonsView).offset(1);
//    }];
//
//    self.addressLabel = [[UILabel alloc] init];
//    self.addressLabel.numberOfLines = 0;
//    self.addressLabel.font = [UIFont systemFontOfSize:16];
//    self.addressLabel.textColor = JobsCor(@"#333333");
//    [self.container addSubview:self.addressLabel];
//    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.container).offset(15);
//        make.trailing.equalTo(self.container).offset(-15);
//        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
//        make.bottom.equalTo(self.buttonsView.mas_top).offset(-20);
//    }];
//}


@end
