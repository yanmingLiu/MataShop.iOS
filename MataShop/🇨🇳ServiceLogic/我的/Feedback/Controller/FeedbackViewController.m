//
//  FeedbackViewController.m
//  MataShop
//
//  Created by lym on 2023/10/21.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewLayoutTop;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (assign, nonatomic) NSInteger maxCount;
@end

@implementation FeedbackViewController

- (instancetype)init
{
    return [[UIStoryboard storyboardWithName:@"FeedbackStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"FeedbackViewController"];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.textViewLayoutTop.constant = GK_STATUSBAR_NAVBAR_HEIGHT + 10;
}

#pragma mark - setupUI

- (void)setupUI {
    self.view.backgroundColor = JobsCor(@"#F7F7F7");

    self.viewModel.textModel.text = @"意见反馈";
    self.viewModel.bgCor = UIColor.whiteColor;
    [self setGKNav];
    [self setGKNavBackBtn];

    self.textView.delegate = self;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChangedExt:) name:UITextViewTextDidChangeNotification object:nil];

    self.saveButton.enabled = NO;
}

#pragma mark - 监听输入 计算文字

- (void)textChangedExt:(NSNotification *)notification {
    [self textChanged];
}

- (void)textChanged {
    _maxCount = 50;
    NSString *toString = self.textView.text;
    // 获取高亮部分
    UITextRange *selectedRange = [self.textView markedTextRange];
    UITextPosition *position = [self.textView positionFromPosition:selectedRange.start offset:0];

    // 判断是否存在高亮字符，如果有，则不进行字数统计和字符串截断
    if (!position) {
        if (toString.length > _maxCount)  {
            self.textView.text = [toString substringToIndex:_maxCount];
        }
        self.countLabel.text = [NSString stringWithFormat:@"%zd/%zd字", self.textView.text.length, _maxCount];
    }
}

#pragma mark - textView delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]){
        [self.view endEditing:YES];
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    textView.text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.saveButton.enabled = textView.hasText;
    return YES;
}

#pragma mark - Actions

- (IBAction)save:(id)sender {

}

@end
