//
//  MSProdShowModel.m
//  MataShop
//
//  Created by Jobs Hi on 9/15/23.
//

#import "MSProdShowModel.h"

@implementation MSProdShowModel
@synthesize prodIMG = _prodIMG;
@synthesize prodIMGURL = _prodIMGURL;
@synthesize prodName = _prodName;
@synthesize prodPrice = _prodPrice;

-(void)setProdIMG:(UIImage *)prodIMG{
    _prodIMG = prodIMG;
}

-(UIImage *)prodIMG{
    if(!_prodIMG){
        _prodIMG = JobsIMG(@"");
    }return _prodIMG;
}

-(void)setProdIMGURL:(NSString *)prodIMGURL{
    _prodIMGURL = prodIMGURL;
}

-(NSString *)prodIMGURL{
    if(!_prodIMGURL){
        
    }return _prodIMGURL;
}

-(void)setProdName:(NSString *)prodName{
    _prodName = prodName;
}

-(NSString *)prodName{
    if(!_prodName){
        _prodName = Internationalization(@"暂无数据");
    }return _prodName;
}

-(void)setProdPrice:(NSString *)prodPrice{
    _prodPrice = prodPrice;
}

-(NSString *)prodPrice{
    if(!_prodPrice){
        _prodPrice = @"￥ 0.00";
    }return _prodPrice;
}

@end
