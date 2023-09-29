//
//  UIViewController+JPImageresizerView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+JPImageresizerView.h"

@implementation UIViewController (JPImageresizerView)

#pragma mark —— @property(nonatomic,strong)JPImageresizerConfigure *configure;
@dynamic configure;
-(JPImageresizerConfigure *)configure{
    JPImageresizerConfigure *Configure = objc_getAssociatedObject(self, _cmd);
    if (!Configure) {
        @jobs_weakify(self)
        switch (self.configureType) {
            case JPImageresizerConfigureType_1:{//默认配置裁剪图片/GIF（UIImage）
                Configure = [JPImageresizerConfigure defaultConfigureWithImage:self.JPImageresizerView_img
                                                                          make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_2:{//默认配置裁剪图片/GIF（NSData）
                Configure = [JPImageresizerConfigure defaultConfigureWithImageData:self.JPImageresizerView_data
                                                                              make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_3:{//默认配置裁剪视频（NSURL）
                Configure = [JPImageresizerConfigure defaultConfigureWithVideoURL:self.JPImageresizerView_url
                                                                             make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                    fixErrorBlock:^(NSURL *cacheURL, 
                                                                                    JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                    fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                 fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                 fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_4:{//默认配置裁剪视频（AVURLAsset）
                Configure = [JPImageresizerConfigure defaultConfigureWithVideoAsset:self.JPImageresizerView_avURLAsset
                                                                               make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                      fixErrorBlock:^(NSURL *cacheURL, 
                                                                                      JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                      fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                   fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                   fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_5:{//浅色毛玻璃配置裁剪图片/GIF（UIImage）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithImage:self.JPImageresizerView_img
                                                                                    make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_6:{//浅色毛玻璃配置裁剪图片/GIF（NSData）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithImageData:self.JPImageresizerView_data
                                                                                        make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_7:{//浅色毛玻璃配置裁剪视频（NSURL）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithVideoURL:self.JPImageresizerView_url
                                                                                       make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                              fixErrorBlock:^(NSURL *cacheURL, 
                                                                                              JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                              fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                           fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                           fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_8:{//浅色毛玻璃配置裁剪视频（AVURLAsset）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithVideoAsset:self.JPImageresizerView_avURLAsset
                                                                                         make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                                fixErrorBlock:^(NSURL *cacheURL,
                                                                                                JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                                fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                             fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                             fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_9:{//深色毛玻璃配置裁剪图片/GIF（UIImage）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithImage:self.JPImageresizerView_img
                                                                                   make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_10:{//深色毛玻璃配置裁剪图片/GIF（NSData）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithImageData:self.JPImageresizerView_data
                                                                                       make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_11:{//深色毛玻璃配置裁剪视频（NSURL）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithVideoURL:self.JPImageresizerView_url
                                                                                      make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                             fixErrorBlock:^(NSURL *cacheURL, 
                                                                                             JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                             fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                          fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                          fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_12:{//深色毛玻璃配置裁剪视频（AVURLAsset）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithVideoAsset:self.JPImageresizerView_avURLAsset
                                                                                        make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                               fixErrorBlock:^(NSURL *cacheURL, 
                                                                                               JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                               fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                            fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                            fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            default:
                NSAssert(Configure,@"alertController 创建出现错误");
                break;
        }
    }return Configure;
}

-(void)setConfigure:(JPImageresizerConfigure *)configure{
    objc_setAssociatedObject(self,
                             _cmd,
                             configure,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)JPImageresizerView *imageresizerView;
@dynamic imageresizerView;
-(JPImageresizerView *)imageresizerView{
    JPImageresizerView *ImageresizerView = objc_getAssociatedObject(self, _cmd);
    if (!ImageresizerView) {
//        @jobs_weakify(self)
        ImageresizerView = [JPImageresizerView imageresizerViewWithConfigure:self.configure
                                                   imageresizerIsCanRecovery:^(BOOL isCanRecovery) {
//            @jobs_strongify(self)
        } imageresizerIsPrepareToScale:^(BOOL isPrepareToScale) {
//            @jobs_strongify(self)
        }];
    }return ImageresizerView;
}

-(void)setImageresizerView:(JPImageresizerView *)imageresizerView{
    objc_setAssociatedObject(self,
                             _cmd,
                             imageresizerView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JPImageresizerConfigureType *configureType;
@dynamic configureType;
-(JPImageresizerConfigureType)configureType{
    JPImageresizerConfigureType configureType = [objc_getAssociatedObject(self, _cmd) integerValue];
    return configureType;
}

-(void)setConfigureType:(JPImageresizerConfigureType)configureType{
    objc_setAssociatedObject(self,
                             _cmd,
                             [NSNumber numberWithInteger:configureType],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSData *JPImageresizerView_data;
@dynamic JPImageresizerView_data;
-(NSData *)JPImageresizerView_data{
    NSData *data = objc_getAssociatedObject(self, _cmd);
    return data;
}

-(void)setJPImageresizerView_data:(NSData *)JPImageresizerView_data{
    objc_setAssociatedObject(self,
                             _cmd,
                             JPImageresizerView_data,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark ——@property(nonatomic,strong)UIImage *JPImageresizerView_img; BaseVC_JPImageresizerView_JPImageresizerView_img
@dynamic JPImageresizerView_img;
-(UIImage *)JPImageresizerView_img{
    UIImage *img = objc_getAssociatedObject(self, _cmd);
    return img;
}

-(void)setJPImageresizerView_img:(UIImage *)JPImageresizerView_img{
    objc_setAssociatedObject(self,
                             _cmd,
                             JPImageresizerView_img,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSURL *JPImageresizerView_url; BaseVC_JPImageresizerView_JPImageresizerView_url
@dynamic JPImageresizerView_url;
-(NSURL *)JPImageresizerView_url{
    NSURL *url = objc_getAssociatedObject(self, _cmd);
    return url;
}

-(void)setJPImageresizerView_url:(NSURL *)JPImageresizerView_url{
    objc_setAssociatedObject(self,
                             _cmd,
                             JPImageresizerView_url,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)AVURLAsset *JPImageresizerView_avURLAsset; BaseVC_JPImageresizerView_JPImageresizerView_avURLAsset
@dynamic JPImageresizerView_avURLAsset;
-(AVURLAsset *)JPImageresizerView_avURLAsset{
    AVURLAsset *urlAsset = objc_getAssociatedObject(self, _cmd);
    return urlAsset;
}

-(void)setJPImageresizerView_avURLAsset:(AVURLAsset *)JPImageresizerView_avURLAsset{
    objc_setAssociatedObject(self,
                             _cmd,
                             JPImageresizerView_avURLAsset,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock makeBlock;
@dynamic makeBlock;
-(jobsByIDBlock)makeBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setMakeBlock:(jobsByIDBlock)makeBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             makeBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixErrorBlock;
@dynamic fixErrorBlock;
-(jobsByIDBlock)fixErrorBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setFixErrorBlock:(jobsByIDBlock)fixErrorBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             fixErrorBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixStartBlock;
@dynamic fixStartBlock;
-(jobsByIDBlock)fixStartBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setFixStartBlock:(jobsByIDBlock)fixStartBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             fixStartBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixProgressBlock;
@dynamic fixProgressBlock;
-(jobsByIDBlock)fixProgressBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setFixProgressBlock:(jobsByIDBlock)fixProgressBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             fixProgressBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixCompleteBlock;
@dynamic fixCompleteBlock;
-(jobsByIDBlock)fixCompleteBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setFixCompleteBlock:(jobsByIDBlock)fixCompleteBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             fixCompleteBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
