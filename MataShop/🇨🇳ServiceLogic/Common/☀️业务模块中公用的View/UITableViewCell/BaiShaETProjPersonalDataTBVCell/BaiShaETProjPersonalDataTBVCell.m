//
//  BaiShaETProjPersonalDataTBVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "BaiShaETProjPersonalDataTBVCell.h"

@interface BaiShaETProjPersonalDataTBVCell ()
/// UI
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyle_11 *inputView;
/// Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *inputViewModel;

@end

@implementation BaiShaETProjPersonalDataTBVCell

#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
UITableViewCell_UIViewModelProtocolSynthesize
@synthesize viewModel = _viewModel;
#pragma mark —— BaseCellProtocol
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    BaiShaETProjPersonalDataTBVCell *cell = (BaiShaETProjPersonalDataTBVCell *)[tableView tableViewCellClass:BaiShaETProjPersonalDataTBVCell.class];
    if (!cell) {
        cell = [BaiShaETProjPersonalDataTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell setCellBgImage:JobsIMG(@"CasinoAgencyTBVCell4")];
        cell.offsetXForEach = JobsWidth(7);
        cell.offsetYForEach = JobsWidth(3);
    }return cell;
}
#pragma mark —— UITableViewCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.inputView.alpha = 1;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(54);
}
#pragma mark —— lazyLoad
-(JobsAppDoorInputViewBaseStyle_11 *)inputView{
    if (!_inputView) {
        _inputView = JobsAppDoorInputViewBaseStyle_11.new;
        [_inputView richElementsInViewWithModel:self.inputViewModel];
        [self.contentView addSubview:_inputView];
        [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _inputView;
}

-(JobsAppDoorInputViewBaseStyleModel *)inputViewModel{
    if (!_inputViewModel) {
        _inputViewModel = JobsAppDoorInputViewBaseStyleModel.new;
        _inputViewModel.offsetXForEach = JobsWidth(16);
        _inputViewModel.textModel.text = self.viewModel.textModel.text;
//        _inputViewModel.leftViewIMG = JobsIMG(@"安全");
        _inputViewModel.placeHolderStr = [NSString isNullString:self.viewModel.textModel.text] ? Internationalization(@"我是副标题") : self.viewModel.textModel.text;
        _inputViewModel.placeholderFont = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
        _inputViewModel.isShowDelBtn = YES;
        _inputViewModel.isShowSecurityBtn = NO;
        _inputViewModel.returnKeyType = UIReturnKeyDone;
        _inputViewModel.keyboardAppearance = UIKeyboardAppearanceAlert;
        _inputViewModel.leftViewMode = UITextFieldViewModeAlways;
        _inputViewModel.titleStrCor = _inputViewModel.placeholderColor = HEXCOLOR_ALPHA(0xC4C4C4,1.f);
//        _inputViewModel.fieldEditorOffset = JobsWidth(80);
    }return _inputViewModel;
}

@end
