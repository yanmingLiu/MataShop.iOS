//
//  UIViewController+GifImageView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+GifImageView.h"

@implementation UIViewController (GifImageView)
#pragma mark —— @property(nonatomic,strong)UIImageView *gifImageView;
@dynamic gifImageView;
-(UIImageView *)gifImageView{
    UIImageView *GifImageView = objc_getAssociatedObject(self, _cmd);
    if (!GifImageView) {
        GifImageView = UIImageView.new;
        GifImageView.image = self.image;
        [self.view addSubview:GifImageView];
        [GifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        [self setGifImageView:GifImageView];
    }return GifImageView;
}

-(void)setGifImageView:(UIImageView *)gifImageView{
    objc_setAssociatedObject(self,
                             _cmd,
                             gifImageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark —— @property(nonatomic,strong)NSString *path;
@dynamic path;
-(NSString *)path{
    NSString *Path = objc_getAssociatedObject(self, _cmd);
    if (![NSString isNullString:Path]) {
        Path = [NSBundle.mainBundle pathForResource:@"GIF大图" ofType:@"gif"];
        [self setPath:Path];
    }return Path;
}

-(void)setPath:(NSString *)path{
    objc_setAssociatedObject(self,
                             _cmd,
                             path,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSData *data;
@dynamic data;
-(NSData *)data{
    NSData *Data = objc_getAssociatedObject(self, _cmd);
    if (!Data) {
        Data = [NSData dataWithContentsOfFile:self.path];
        [self setData:Data];
    }return Data;
}

-(void)setData:(NSData *)data{
    objc_setAssociatedObject(self,
                             _cmd,
                             data,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIImage *image;
@dynamic image;
-(UIImage *)image{
    UIImage *img = objc_getAssociatedObject(self, _cmd);
    if (!img) {
        img = [UIImage sd_imageWithGIFData:self.data];
        [self setImage:img];
    }return img;
}

-(void)setImage:(UIImage *)image{
    objc_setAssociatedObject(self,
                             _cmd,
                             image,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
