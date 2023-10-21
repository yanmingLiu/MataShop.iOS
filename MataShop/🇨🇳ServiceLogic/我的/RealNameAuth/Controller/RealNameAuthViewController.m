//
//  RealNameAuthViewController.m
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "RealNameAuthViewController.h"

typedef NS_ENUM(NSUInteger, ChoosePicType) {
    ChoosePicTypeFront,
    ChoosePicTypeBack,
};

@interface RealNameAuthViewController ()<HXPhotoViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewLayoutTop;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (weak, nonatomic) IBOutlet UIImageView *frontImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UITextField *numberTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *bankNumberTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *bankTF;
@property (weak, nonatomic) IBOutlet UITextField *branchTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UITextField *sizeTF;

@property(nonatomic,strong)HXPhotoView *postPhotoView;
@property(nonatomic,strong)HXPhotoManager *photoManager;
@property(nonatomic,assign)ChoosePicType choosePicType;

@end

@implementation RealNameAuthViewController

- (instancetype)init
{
    return [[UIStoryboard storyboardWithName:@"RealNameAuthStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"RealNameAuthViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.isEdit) {
        self.viewModel.textModel.text = @"修改实名认证";
        [self setupEditData];

    } else {
        self.viewModel.textModel.text = @"实名认证";
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

    for (UIView *view in self.stackView.arrangedSubviews) {
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 8;
    }

    self.numberTF.delegate = self;
    self.phoneTF.delegate = self;
    self.bankNumberTF.delegate = self;
    self.nameTF.delegate = self;
    self.bankTF.delegate = self;
    self.branchTF.delegate = self;
    self.cityTF.delegate = self;
    self.addressTF.delegate = self;
    self.sizeTF.delegate = self;

    [self.frontImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseFrontPic)]];
    [self.backImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseBackPic)]];

    self.postPhotoView.alpha = 0;
}


#pragma mark - EditData

- (void)setupEditData {

}

#pragma mark - Actions

- (void)chooseFrontPic {
    [self choosePic:ChoosePicTypeFront];
}

- (void)chooseBackPic {
    [self choosePic:ChoosePicTypeBack];
}

- (void)choosePic:(ChoosePicType)choosePicType {
    self.choosePicType = choosePicType;
    [self.postPhotoView goPhotoViewController];
}

- (void)refreshPicture:(UIImage *)image {
    switch (self.choosePicType) {
        case ChoosePicTypeFront:
            self.frontImageView.image = image;
            break;
        case ChoosePicTypeBack:
            self.backImageView.image = image;
            break;
        default:
            break;
    }
}

#pragma mark —— HXPhotoViewDelegate
/// 在这里获取到点选的资料
- (void)photoView:(HXPhotoView *)photoView
   changeComplete:(NSArray<HXPhotoModel *> *)allList
           photos:(NSArray<HXPhotoModel *> *)photos
           videos:(NSArray<HXPhotoModel *> *)videos
         original:(BOOL)isOriginal{
   
    __weak typeof(self) ws = self;
    [photos hx_requestImageWithOriginal:NO completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                      NSArray<HXPhotoModel *> * _Nullable errorArray) {

        if (imageArray.count) {
            [ws refreshPicture:imageArray.firstObject];
        }
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    // 将字符串首尾空格去掉
    textField.text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *toString = textField.text;
    if (toString.length) {
        NSString *stringRegex;
        if (textField == self.numberTF) {
            stringRegex = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
        }
        else if (textField == self.phoneTF) {
            stringRegex = @"^(1[3-9])\\d{9}$";
        }
        else if (textField == self.bankTF) {
            stringRegex = @"/^(62|88|99|19\\d{2}|4\\d{3}|5[1-5]\\d{2}|6\\d{3}|81\\d{2})\\d{10,17}$/";
        }
        [self checkInput:textField regex:stringRegex];
    }
}

- (void)checkInput:(UITextField *)textField regex:(NSString *)regex {
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL flag = [phoneTest evaluateWithObject:textField.text];
    textField.textColor = flag ? JobsCor(@"#333333") : JobsCor(@"#DD0000");
}

#pragma mark - lazy

-(HXPhotoView *)postPhotoView{
    if (!_postPhotoView) {
        _postPhotoView = [HXPhotoView photoManager:self.photoManager];
        _postPhotoView.spacing = 20.f;
        _postPhotoView.delegate = self;
        _postPhotoView.deleteCellShowAlert = NO;
        _postPhotoView.outerCamera = YES;
        _postPhotoView.previewShowDeleteButton = YES;
        [self.view addSubview:_postPhotoView];
    }
    return _postPhotoView;
}

-(HXPhotoManager *)photoManager {
    if (!_photoManager) {
        _photoManager = [HXPhotoManager.alloc initWithType:HXPhotoManagerSelectedTypePhoto];
        _photoManager.configuration.localFileName = @"realnamepicture";
        _photoManager.configuration.type = HXConfigurationTypeWXChat;
        _photoManager.configuration.showOriginalBytes = YES;
        _photoManager.configuration.showOriginalBytesLoading = YES;
        _photoManager.configuration.specialModeNeedHideVideoSelectBtn = NO;
        _photoManager.configuration.maxNum = 1;
        _photoManager.configuration.photoMaxNum = 1;
        _photoManager.configuration.singleSelected = YES;
    }
    return _photoManager;
}

@end
