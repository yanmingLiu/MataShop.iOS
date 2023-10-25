//
//  MSWalletContentView.m
//  MataShop
//
//  Created by Mac on 2023/10/24.
//

#import "MSWalletContentView.h"


@interface MSWalletContentView ()
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *balanceLabel;
@property(nonatomic,strong)UILabel *mataLabel;
@end

@implementation MSWalletContentView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo (0);
        }];
        self.balanceLabel.hidden = NO;
        self.mataLabel.hidden = NO;
        self.leftBtn.hidden = NO;
        self.rightBtn.hidden = NO;

    }
    return self;
}
- (UILabel *)balanceLabel{
    if (!_balanceLabel) {
        _balanceLabel = [UILabel new];
        _balanceLabel.text = Internationalization(@"10");
        _balanceLabel.font = [UIFont systemFontOfSize:26];
        _balanceLabel.textColor = JobsBlackColor;
        [self addSubview:_balanceLabel];
        [_balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(40);
            make.left.mas_equalTo(80);
        }];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"钱包余额(元)");
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = JobsBlackColor;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.balanceLabel.mas_bottom).offset(5);
            make.centerX.mas_equalTo(self.balanceLabel.mas_centerX);
        }];
        
    }
    return _balanceLabel;
}
- (UILabel *)mataLabel{
    if (!_mataLabel) {
        _mataLabel = [UILabel new];
        _mataLabel.text = Internationalization(@"50");
        _mataLabel.font = [UIFont systemFontOfSize:26];
        _mataLabel.textColor = JobsBlackColor;
        [self addSubview:_mataLabel];
        [_mataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(40);
            make.right.mas_equalTo(-80);
        }];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"Mata值");
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = JobsBlackColor;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mataLabel.mas_bottom).offset(5);
            make.centerX.mas_equalTo(self.mataLabel.mas_centerX);
        }];
    }
    return _mataLabel;
}
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        _imageView.backgroundColor = JobsWhiteColor;
        _imageView.layer.cornerRadius = 8;
        _imageView.layer.masksToBounds = YES;
        [self addSubview:_imageView];
        
    }return _imageView;
}
-(UIButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.layer.cornerRadius = 8;
        _rightBtn.layer.masksToBounds = YES;
        _rightBtn.layer.borderColor = JobsCor(@"#dd0000").CGColor;
        _rightBtn.layer.borderWidth = 1;
        _rightBtn.backgroundColor = JobsWhiteColor;
        UIImageView *imageV = [[UIImageView alloc] initWithImage:JobsIMG(@"充值")];
        [_rightBtn addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(50);
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.rightBtn);
        }];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"提现");
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = JobsCor(@"#dd0000");
        [_rightBtn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageV.mas_right).offset(5);
            make.centerY.mas_equalTo(imageV.mas_centerY);
        }];
        [self addSubview:_rightBtn];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(150 ,44));
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.balanceLabel.mas_bottom).offset(50);
        }];
    }return _rightBtn;
}
-(UIButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.layer.cornerRadius = 8;
        _leftBtn.layer.masksToBounds = YES;
        _leftBtn.layer.borderColor = JobsCor(@"#dd0000").CGColor;
        _leftBtn.layer.borderWidth = 1;
        _leftBtn.backgroundColor = JobsWhiteColor;
        UIImageView *imageV = [[UIImageView alloc] initWithImage:JobsIMG(@"充值")];
        [_leftBtn addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(50);
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.leftBtn);
        }];
        UILabel *label = [UILabel new];
        label.text = Internationalization(@"充值");
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = JobsCor(@"#dd0000");
        [_leftBtn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageV.mas_right).offset(5);
            make.centerY.mas_equalTo(imageV.mas_centerY);
        }];
        [self addSubview:_leftBtn];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(150 ,44));
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(self.balanceLabel.mas_bottom).offset(50);
        }];
    }return _leftBtn;
}

@end
