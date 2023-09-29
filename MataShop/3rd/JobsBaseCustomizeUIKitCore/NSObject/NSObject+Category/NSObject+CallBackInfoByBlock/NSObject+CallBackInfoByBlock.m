//
//  NSObject+CallBackInfoByBlock.m
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import "NSObject+CallBackInfoByBlock.h"

@implementation NSObject (CallBackInfoByBlock)
#pragma mark —— 没有返回值的Block | Set
/// 1、没有入参、没有返回值的回调
-(void)actionVoidBlock:(jobsByVoidBlock)voidBlock{
    self.voidBlock = voidBlock;
}
/// 2、有（单一）入参、没有返回值的回调
-(void)actionObjectBlock:(jobsByIDBlock)objectBlock{
    self.objectBlock = objectBlock;
}

-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock)gestureRecognizerBlock{
    self.gestureRecognizerBlock = gestureRecognizerBlock;
}

-(void)actionSELBlock:(jobsBySELBlock)selBlock{
    self.selBlock = selBlock;
}

-(void)actionStringBlock:(jobsByStringBlock)stringBlock{
    self.stringBlock = stringBlock;
}
/// 3、入参为基本数据类型、 且没有返回值的Block定义
-(void)actionNSIntegerBlock:(jobsByNSIntegerBlock)NSIntegerBlock{
    self.NSIntegerBlock = NSIntegerBlock;
}

-(void)actionNSUIntegerBlock:(jobsByNSUIntegerBlock)NSUIntegerBlock{
    self.NSUIntegerBlock = NSUIntegerBlock;
}

-(void)actionCGFloatBlock:(jobsByCGFloatBlock)CGFloatBlock{
    self.CGFloatBlock = CGFloatBlock;
}

-(void)actionBOOLBlock:(jobsByBOOLBlock)BOOLBlock{
    self.BOOLBlock = BOOLBlock;
}

-(void)actionIntBlock:(jobsByIntBlock)IntBlock{
    self.IntBlock = IntBlock;
}

-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock)UnsignedIntBlock{
    self.UnsignedIntBlock = UnsignedIntBlock;
}

-(void)actionFloatBlock:(jobsByFloatBlock)FloatBlock{
    self.FloatBlock = FloatBlock;
}

-(void)actionDoubleBlock:(jobsByDoubleBlock)DoubleBlock{
    self.DoubleBlock = DoubleBlock;
}

-(void)actionCharBlock:(jobsByCharBlock)CharBlock{
    self.CharBlock = CharBlock;
}

-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock)UnsignedCharBlock{
    self.UnsignedCharBlock = UnsignedCharBlock;
}

-(void)actionShortBlock:(jobsByShortBlock)ShortBlock{
    self.ShortBlock = ShortBlock;
}

-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock)UnsignedShortBlock{
    self.UnsignedShortBlock = UnsignedShortBlock;
}

-(void)actionLongBlock:(jobsByLongBlock)LongBlock{
    self.LongBlock = LongBlock;
}

-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock)UnsignedLongBlock{
    self.UnsignedLongBlock = UnsignedLongBlock;
}

-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock{
    self.UnsignedLongLongBlock = UnsignedLongLongBlock;
}
#pragma mark —— 有返回值的Block | Set
/// 4、无入参、有返回值的回调
-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock)returnObjectByVoidBlock{
    self.returnObjectByVoidBlock = returnObjectByVoidBlock;
}
/// 5、有（单一）入参、有返回值的回调【返回其他类型】
-(void)actionReturnIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock{
    self.returnObjectByGestureRecognizerBlock = returnObjectByGestureRecognizerBlock;
}

-(void)actionReturnIDBySELBlock:(JobsReturnIDBySELBlock)returnObjectBySELBlock{
    self.returnObjectBySELBlock = returnObjectBySELBlock;
}

-(void)actionReturnIDByStringBlock:(JobsReturnIDByStringBlock)returnObjectByStringBlock{
    self.returnObjectByStringBlock = returnObjectByStringBlock;
}
/// 6、有（单一）入参、有返回值的回调【返回入参类型】
-(void)actionReturnObjectBlock:(JobsReturnIDByIDBlock)returnObjectBlock{
    self.returnObjectBlock = returnObjectBlock;
}

-(void)actionReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock)returnNSIntegerBlock{
    self.returnNSIntegerBlock = returnNSIntegerBlock;
}

-(void)actionReturnNSUIntegerBlock:(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock{
    self.returnNSUIntegerBlock = returnNSUIntegerBlock;
}

-(void)actionReturnCGFloatBlock:(JobsReturnByCGFloatBlock)returnCGFloatBlock{
    self.returnCGFloatBlock = returnCGFloatBlock;
}

-(void)actionReturnBOOLBlock:(JobsReturnByBOOLBlock)returnBOOLBlock{
    self.returnBOOLBlock = returnBOOLBlock;
}

-(void)actionReturnIntBlock:(JobsReturnByIntBlock)returnIntBlock{
    self.returnIntBlock = returnIntBlock;
}

-(void)actionReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock{
    self.returnUnsignedIntBlock = returnUnsignedIntBlock;
}

-(void)actionReturnFloatBlock:(JobsReturnByFloatBlock)returnFloatBlock{
    self.returnFloatBlock = returnFloatBlock;
}

-(void)actionReturnDoubleBlock:(JobsReturnByDoubleBlock)returnDoubleBlock{
    self.returnDoubleBlock = returnDoubleBlock;
}

-(void)actionReturnCharBlock:(JobsReturnByCharBlock)returnCharBlock{
    self.returnCharBlock = returnCharBlock;
}

-(void)actionReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock{
    self.returnUnsignedCharBlock = returnUnsignedCharBlock;
}

-(void)actionReturnShortBlock:(JobsReturnByShortBlock)returnShortBlock{
    self.returnShortBlock = returnShortBlock;
}

-(void)actionReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock{
    self.returnUnsignedShortBlock = returnUnsignedShortBlock;
}

-(void)actionReturnLongBlock:(JobsReturnByLongBlock)returnLongBlock{
    self.returnLongBlock = returnLongBlock;
}

-(void)actionReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock{
    self.returnUnsignedLongBlock = returnUnsignedLongBlock;
}

-(void)actionReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock{
    self.returnUnsignedLongLongBlock = returnUnsignedLongLongBlock;
}
/// 1、没有入参、没有返回值的回调
#pragma mark —— @property(nonatomic,assign)jobsByVoidBlock voidBlock;/// 无入参，无返回值的回调
@dynamic voidBlock;
-(jobsByVoidBlock)voidBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setVoidBlock:(jobsByVoidBlock)voidBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             voidBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/// 2、有（单一）入参、没有返回值的回调
#pragma mark —— @property(nonatomic,assign)jobsByIDBlock objectBlock;/// 入参为ID类型，无返回值的回调
@dynamic objectBlock;
-(jobsByIDBlock)objectBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setObjectBlock:(jobsByIDBlock)objectBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             objectBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsBySELBlock selBlock;///入参为SEL，无返回值的回调
@dynamic selBlock;
-(jobsBySELBlock)selBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setSelBlock:(jobsBySELBlock)selBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             selBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByStringBlock stringBlock;///入参为NSString，无返回值的回调
@dynamic stringBlock;
-(jobsByStringBlock)stringBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setStringBlock:(jobsByStringBlock)stringBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             stringBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByGestureRecognizerBlock gestureRecognizerBlock;/// 入参为UIGestureRecognizer，无返回值的回调
@dynamic gestureRecognizerBlock;
-(jobsByGestureRecognizerBlock)gestureRecognizerBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setGestureRecognizerBlock:(jobsByGestureRecognizerBlock)gestureRecognizerBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             gestureRecognizerBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/// 3、入参为基本数据类型、 且没有返回值的Block定义
#pragma mark —— @property(nonatomic,assign)jobsByNSIntegerBlock NSIntegerBlock;/// 入参为NSInteger，无返回值的回调
@dynamic NSIntegerBlock;
-(jobsByNSIntegerBlock)NSIntegerBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setNSIntegerBlock:(jobsByNSIntegerBlock)NSIntegerBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             NSIntegerBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByNSUIntegerBlock NSUIntegerBlock;/// 入参为NSUInteger，无返回值的回调
@dynamic NSUIntegerBlock;
-(jobsByNSUIntegerBlock)NSUIntegerBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setNSUIntegerBlock:(jobsByNSUIntegerBlock)NSUIntegerBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             NSUIntegerBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByCGFloatBlock CGFloatBlock;/// 入参CGFloat，无返回值的回调
@dynamic CGFloatBlock;
-(jobsByCGFloatBlock)CGFloatBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCGFloatBlock:(jobsByCGFloatBlock)CGFloatBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             CGFloatBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByBOOLBlock BOOLBlock;/// 入参为BOOL，无返回值的回调
@dynamic BOOLBlock;
-(jobsByBOOLBlock)BOOLBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setBOOLBlock:(jobsByBOOLBlock)BOOLBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             BOOLBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByIntBlock IntBlock;/// 入参为Int，无返回值的回调
@dynamic IntBlock;
-(jobsByIntBlock)IntBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setIntBlock:(jobsByIntBlock)IntBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             IntBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByUnsignedIntBlock UnsignedIntBlock;/// 入参为UnsignedInt，无返回值的回调
@dynamic UnsignedIntBlock;
-(jobsByUnsignedIntBlock)UnsignedIntBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnsignedIntBlock:(jobsByUnsignedIntBlock)UnsignedIntBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             UnsignedIntBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByFloatBlock FloatBlock;/// 入参为Float，无返回值的回调
@dynamic FloatBlock;
-(jobsByFloatBlock)FloatBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setFloatBlock:(jobsByFloatBlock)FloatBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             FloatBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByDoubleBlock DoubleBlock;/// 入参为Double，无返回值的回调
@dynamic DoubleBlock;
-(jobsByDoubleBlock)DoubleBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setDoubleBlock:(jobsByDoubleBlock)DoubleBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             DoubleBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByCharBlock CharBlock;/// 入参为Char，无返回值的回调
@dynamic CharBlock;
-(jobsByCharBlock)CharBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCharBlock:(jobsByCharBlock)CharBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             CharBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByUnsignedCharBlock UnsignedCharBlock;/// 入参为IUnsignedChar，无返回值的回调
@dynamic UnsignedCharBlock;
-(jobsByUnsignedCharBlock)UnsignedCharBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnsignedCharBlock:(jobsByUnsignedCharBlock)UnsignedCharBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             UnsignedCharBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByShortBlock ShortBlock;/// 入参为Short，无返回值的回调
@dynamic ShortBlock;
-(jobsByShortBlock)ShortBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setShortBlock:(jobsByShortBlock)ShortBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             ShortBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByUnsignedShortBlock UnsignedShortBlock;/// 入参为UnsignedShort，无返回值的回调
@dynamic UnsignedShortBlock;
-(jobsByUnsignedShortBlock)UnsignedShortBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnsignedShortBlock:(jobsByUnsignedShortBlock)UnsignedShortBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             UnsignedShortBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByLongBlock LongBlock;/// 入参为Long，无返回值的回调
@dynamic LongBlock;
-(jobsByLongBlock)LongBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setLongBlock:(jobsByLongBlock)LongBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             LongBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByUnsignedLongBlock UnsignedLongBlock;/// 入参为UnsignedLong，无返回值的回调
@dynamic UnsignedLongBlock;
-(jobsByUnsignedLongBlock)UnsignedLongBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnsignedLongBlock:(jobsByUnsignedLongBlock)UnsignedLongBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             UnsignedLongBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)jobsByUnsignedLongLongBlock UnsignedLongLongBlock;/// 入参为IUnsignedLongLong，无返回值的回调
@dynamic UnsignedLongLongBlock;
-(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             UnsignedLongLongBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/// 4、无入参、有返回值的回调
#pragma mark —— @property(nonatomic,assign)JobsReturnIDByVoidBlock returnObjectByVoidBlock;/// 无入参，返回值为ID的回调
@dynamic returnObjectByVoidBlock;
-(JobsReturnIDByVoidBlock)returnObjectByVoidBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnObjectByVoidBlock:(JobsReturnIDByVoidBlock)returnObjectByVoidBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnObjectByVoidBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnIDByGestureRecognizerBlock returnObjectByGestureRecognizerBlock;/// 入参为UIGestureRecognizer，返回值为ID的回调
@dynamic returnObjectByGestureRecognizerBlock;
-(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnObjectByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnObjectByGestureRecognizerBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark —— @property(nonatomic,assign)JobsReturnIDBySELBlock returnObjectBySELBlock;/// 入参为SEL，返回值为ID的回调
@dynamic returnObjectBySELBlock;
-(JobsReturnIDBySELBlock)returnObjectBySELBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnObjectBySELBlock:(JobsReturnIDBySELBlock)returnObjectBySELBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnObjectBySELBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnIDByStringBlock returnObjectByStringBlock;/// 入参为NSString，返回值为ID的回调
@dynamic returnObjectByStringBlock;
-(JobsReturnIDByStringBlock)returnObjectByStringBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnObjectByStringBlock:(JobsReturnIDByStringBlock)returnObjectByStringBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnObjectByStringBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/// 6、有（单一）入参、有返回值的回调【返回入参类型】
#pragma mark —— @property(nonatomic,assign)JobsReturnIDByIDBlock returnObjectBlock;
@dynamic returnObjectBlock;
-(JobsReturnIDByIDBlock)returnObjectBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnObjectBlock:(JobsReturnIDByIDBlock)returnObjectBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnObjectBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByNSIntegerBlock returnNSIntegerBlock;/// 返回值为NSInteger的回调
@dynamic returnNSIntegerBlock;
-(JobsReturnByNSIntegerBlock)returnNSIntegerBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock)returnNSIntegerBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnNSIntegerBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByUIntegerBlock returnNSUIntegerBlock;/// 返回值为UInteger的回调
@dynamic returnNSUIntegerBlock;
-(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnUIntegerBlock:(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnNSUIntegerBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByCGFloatBlock returnCGFloatBlock;/// 返回值为CGFloat的回调
@dynamic returnCGFloatBlock;
-(JobsReturnByCGFloatBlock)returnCGFloatBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnCGFloatBlock:(JobsReturnByCGFloatBlock)returnCGFloatBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnCGFloatBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByBOOLBlock returnBOOLBlock;/// 返回值为BOOL的回调
@dynamic returnBOOLBlock;
-(JobsReturnByBOOLBlock)returnBOOLBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnBOOLBlock:(JobsReturnByBOOLBlock)returnBOOLBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnBOOLBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByIntBlock returnIntBlock;/// 返回值为Int的回调
@dynamic returnIntBlock;
-(JobsReturnByIntBlock)returnIntBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnIntBlock:(JobsReturnByIntBlock)returnIntBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnIntBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByUnsignedIntBlock returnUnsignedIntBlock;/// 返回值为UnsignedInt的回调
@dynamic returnUnsignedIntBlock;
-(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnUnsignedIntBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByFloatBlock returnFloatBlock;/// 返回值为Float的回调
@dynamic returnFloatBlock;
-(JobsReturnByFloatBlock)returnFloatBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnFloatBlock:(JobsReturnByFloatBlock)returnFloatBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnFloatBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByDoubleBlock returnDoubleBlock;/// 返回值为Double的回调
@dynamic returnDoubleBlock;
-(JobsReturnByDoubleBlock)returnDoubleBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnDoubleBlock:(JobsReturnByDoubleBlock)returnDoubleBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnDoubleBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByCharBlock returnCharBlock;/// 返回值为Char的回调
@dynamic returnCharBlock;
-(JobsReturnByCharBlock)returnCharBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnCharBlock:(JobsReturnByCharBlock)returnCharBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnCharBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByUnsignedCharBlock returnUnsignedCharBlock;/// 返回值为UnsignedChar的回调
@dynamic returnUnsignedCharBlock;
-(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnUnsignedCharBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByShortBlock returnShortBlock;/// 返回值为Short的回调
@dynamic returnShortBlock;
-(JobsReturnByShortBlock)returnShortBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnShortBlock:(JobsReturnByShortBlock)returnShortBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnShortBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByUnsignedShortBlock returnUnsignedShortBlock;/// 返回值为UnsignedShort的回调
@dynamic returnUnsignedShortBlock;
-(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnUnsignedShortBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByLongBlock returnLongBlock;/// 返回值为Long的回调
@dynamic returnLongBlock;
-(JobsReturnByNSIntegerBlock)returnLongBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnLongBlock:(JobsReturnByNSIntegerBlock)returnLongBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnLongBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByUnsignedLongBlock returnUnsignedLongBlock;/// 返回值为UnsignedLong的回调
@dynamic returnUnsignedLongBlock;
-(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnUnsignedLongBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)JobsReturnByUnsignedLongLongBlock returnUnsignedLongLongBlock;/// 返回值为UnsignedLongLong的回调
@dynamic returnUnsignedLongLongBlock;
-(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             returnUnsignedLongLongBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
