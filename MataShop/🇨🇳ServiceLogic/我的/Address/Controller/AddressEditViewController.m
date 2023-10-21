//
//  AddressEdotViewController.m
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "AddressEditViewController.h"

@interface AddressEditViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextView *addressTV;

@property (weak, nonatomic) IBOutlet UIView *addressContainer;
@property (weak, nonatomic) IBOutlet UIButton *defaultButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewLayoutTop;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (nonatomic, assign) BOOL isDefault;

@end

@implementation AddressEditViewController

- (instancetype)init
{
    return [[UIStoryboard storyboardWithName:@"AddressStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"AddressEditViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.isEdit) {
        self.viewModel.textModel.text = @"修改收货地址";
        [self setupEditData];

    } else {
        self.viewModel.textModel.text = @"收货地址";
    }

    [self setupUI];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollViewLayoutTop.constant = GK_STATUSBAR_NAVBAR_HEIGHT;
}

#pragma mark - setupUI

- (void)setupUI {
    self.view.backgroundColor = JobsCor(@"#F7F7F7");

    self.viewModel.bgCor = UIColor.whiteColor;
    [self setGKNav];
    [self setGKNavBackBtn];

    self.contentView.layer.cornerRadius = 8;
    self.addressContainer.layer.cornerRadius = 8;
}

- (void)refreshDefaultButton {
    NSString *image = self.isDefault ? @"btn_selected_s" : @"btn_selected_n";
    self.defaultButton.configurationUpdateHandler = ^(__kindof UIButton * _Nonnull button) {
        UIButtonConfiguration *config = button.configuration;
        config.image = [UIImage imageNamed:image];
        button.configuration = config;
    };
}

#pragma mark - EditData

- (void)setupEditData {

}


#pragma mark - Actions

- (IBAction)setDefaultAddress:(id)sender {
    self.isDefault = !self.isDefault;
    [self refreshDefaultButton];
}

- (IBAction)save:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(saveAddressSuccess)]) {
        [self.delegate saveAddressSuccess];
    }
    [self.navigationController popViewControllerAnimated:YES];
}



@end
