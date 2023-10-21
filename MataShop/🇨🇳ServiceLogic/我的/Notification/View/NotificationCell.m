//
//  NotificationCell.m
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "NotificationCell.h"

@interface NotificationCell ()

@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) NotificationItemViewModel *viewModel;

@end

@implementation NotificationCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

- (void)fill:(NotificationItemViewModel *)viewModel {
    _viewModel = viewModel;

    self.titleLabel.text = viewModel.title;
    self.contentLabel.text = viewModel.content;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.clearColor;
    self.contentView.backgroundColor = UIColor.clearColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.container = [[UIView alloc] init];
    self.container.backgroundColor = UIColor.whiteColor;
    self.container.clipsToBounds = YES;
    self.container.layer.cornerRadius = 8;
    [self.contentView addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 15, 0, 15));
    }];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = JobsCor(@"#333333");
    self.titleLabel.numberOfLines = 0;
    [self.container addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.container).offset(15);
        make.trailing.equalTo(self.container).offset(-15);
        make.top.equalTo(self.container).offset(20);
    }];

    self.line = [[UIView alloc] init];
    self.line.backgroundColor = JobsCor(@"#F3F4F6");
    [self.container addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(18);
        make.height.mas_equalTo(1);
    }];

    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:14 weight:(UIFontWeightMedium)];
    self.contentLabel.textColor = JobsCor(@"#333333");
    self.contentLabel.numberOfLines = 0;
    [self.container addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.titleLabel);
        make.top.equalTo(self.line.mas_bottom).offset(15);
        make.bottom.equalTo(self.container).offset(-15);
    }];
}

@end
