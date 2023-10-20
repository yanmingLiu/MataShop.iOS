//
//  AddressCell.m
//  MataShop
//
//  Created by lym on 2023/10/20.
//

#import "AddressCell.h"

@interface AddressCell ()

@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *buttonsView;
@property (nonatomic, strong) UIButton *defaultButton;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, strong) AddressItemViewModel *viewModel;

@end

@implementation AddressCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

- (void)fill:(AddressItemViewModel *)viewModel {
    _viewModel = viewModel;

    self.nameLabel.text = viewModel.name;
    self.phoneLabel.text = viewModel.phone;
    self.addressLabel.text = viewModel.address;
    self.defaultButton.configurationUpdateHandler = ^(__kindof UIButton * _Nonnull button) {
        UIButtonConfiguration *config = button.configuration;
        config.image = [UIImage imageNamed:viewModel.defaultImage];
        button.configuration = config;
    };
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
    self.container.layer.cornerRadius = 4;
    [self.contentView addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 0, 10));
    }];

    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.textColor = JobsCor(@"#333333");
    [self.container addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.container).offset(15);
        make.top.equalTo(self.container).offset(20);
    }];

    self.phoneLabel = [[UILabel alloc] init];
    self.phoneLabel.font = [UIFont systemFontOfSize:16];
    self.phoneLabel.textColor = JobsCor(@"#333333");
    [self.container addSubview:self.phoneLabel];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.nameLabel.mas_trailing).offset(10);
        make.centerY.equalTo(self.nameLabel);
        make.trailing.lessThanOrEqualTo(self.container).offset(-15);
    }];

    self.buttonsView = [[UIView alloc] init];
    [self.container addSubview:self.buttonsView];
    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.container);
        make.height.mas_equalTo(49);
    }];

    self.line = [[UIView alloc] init];
    self.line.backgroundColor = JobsCor(@"#FAFBFA");
    [self.buttonsView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self.buttonsView);
        make.height.mas_equalTo(1);
    }];

    [self.buttonsView addSubview:self.defaultButton];
    [self.defaultButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.buttonsView).offset(11);
        make.bottom.equalTo(self.buttonsView);
        make.top.equalTo(self.buttonsView).offset(1);
    }];

    [self.buttonsView addSubview:self.editButton];
    [self.editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.buttonsView).offset(-15);
        make.bottom.equalTo(self.buttonsView);
        make.top.equalTo(self.buttonsView).offset(1);
    }];


    [self.buttonsView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.editButton.mas_leading).offset(-20);
        make.bottom.equalTo(self.buttonsView);
        make.top.equalTo(self.buttonsView).offset(1);
    }];

    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.numberOfLines = 0;
    self.addressLabel.font = [UIFont systemFontOfSize:16];
    self.addressLabel.textColor = JobsCor(@"#333333");
    [self.container addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.container).offset(15);
        make.trailing.equalTo(self.container).offset(-15);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
        make.bottom.equalTo(self.buttonsView.mas_top).offset(-20);
    }];
}

- (UIButton *)defaultButton {
    if (!_defaultButton) {
        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
        config.title = @"设为默认地址";
        config.image = JobsIMG(@"btn_selected_n");
        config.imagePlacement = NSDirectionalRectEdgeLeading;
        config.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
        config.imagePadding = 4;
        config.background.backgroundColor = UIColor.clearColor;
        config.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
            return @{NSFontAttributeName : [UIFont systemFontOfSize:12],
                     NSForegroundColorAttributeName: JobsCor(@"#666666")
            };
        };
        _defaultButton = [UIButton buttonWithConfiguration:config primaryAction:[self defaultAction]];
    }
    return _defaultButton;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
        config.title = @"删除";
        config.image = JobsIMG(@"btn_delete");
        config.imagePlacement = NSDirectionalRectEdgeLeading;
        config.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
        config.imagePadding = 4;
        config.background.backgroundColor = UIColor.clearColor;
        config.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
            return @{NSFontAttributeName : [UIFont systemFontOfSize:12],
                     NSForegroundColorAttributeName: JobsCor(@"#666666")
            };
        };
        _deleteButton = [UIButton buttonWithConfiguration:config primaryAction:[self deleteAction]];
    }
    return _deleteButton;
}

- (UIButton *)editButton {
    if (!_editButton) {
        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
        config.title = @"编辑";
        config.image = JobsIMG(@"btn_edit");
        config.imagePlacement = NSDirectionalRectEdgeLeading;
        config.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
        config.imagePadding = 4;
        config.background.backgroundColor = UIColor.clearColor;
        config.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
            return @{NSFontAttributeName : [UIFont systemFontOfSize:12],
                     NSForegroundColorAttributeName: JobsCor(@"#666666")
            };
        };
        _editButton = [UIButton buttonWithConfiguration:config primaryAction:[self editAdressAction]];
    }
    return _editButton;
}

- (UIAction *)defaultAction {
    __weak typeof(self) wSelf = self;
    return [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        [wSelf.delegate onTapDefault:wSelf.viewModel];
    }];
}

- (UIAction *)deleteAction {
    __weak typeof(self) wSelf = self;
    return [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        [wSelf.delegate onTapDelete:wSelf.viewModel];
    }];
}

- (UIAction *)editAdressAction {
    __weak typeof(self) wSelf = self;
    return [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        [wSelf.delegate onTapEdit:wSelf.viewModel];
    }];
}

@end
