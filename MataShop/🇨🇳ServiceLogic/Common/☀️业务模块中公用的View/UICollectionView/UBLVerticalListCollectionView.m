//
//  VerticalListCollectionView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/10/10.
//  Copyright © 2018 jiaxin. All rights reserved.
//

#import "UBLVerticalListCollectionView.h"

@implementation UBLVerticalListCollectionView

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.layoutSubviewsCallback) {
        self.layoutSubviewsCallback();
    }
}

@end
