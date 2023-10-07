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
@synthesize prodTitle = _prodTitle;
@synthesize prodSubTitle = _prodSubTitle;
@synthesize prodPrice = _prodPrice;
@synthesize prodSubPrice = _prodSubPrice;
@synthesize prodSales = _prodSales;

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

-(void)setProdTitle:(NSString *)prodTitle{
    _prodTitle = prodTitle;
}

-(NSString *)prodTitle{
    if(!_prodTitle){
        _prodTitle = Internationalization(@"暂无数据");
    }return _prodTitle;
}

-(void)setProdSubTitle:(NSString *)prodSubTitle{
    _prodSubTitle = prodSubTitle;
}

-(NSString *)prodSubTitle{
    if(!_prodSubTitle){
        _prodSubTitle = Internationalization(@"暂无数据");
    }return _prodSubTitle;
}

-(void)setProdPrice:(NSString *)prodPrice{
    _prodPrice = prodPrice;
}

-(NSString *)prodPrice{
    if(!_prodPrice){
        _prodPrice = Internationalization(@"暂无数据");
    }return _prodPrice;
}

-(void)setProdSubPrice:(NSString *)prodSubPrice{
    _prodSubPrice = prodSubPrice;
}

-(NSString *)prodSubPrice{
    if(!_prodSubPrice){
        _prodSubPrice = Internationalization(@"暂无数据");
    }return _prodSubPrice;
}

-(void)setProdSales:(NSString *)prodSales{
    _prodSales = prodSales;
}

-(NSString *)prodSales{
    if(!_prodSales){
        _prodSales = Internationalization(@"暂无数据");
    }return _prodSales;
}

@end
