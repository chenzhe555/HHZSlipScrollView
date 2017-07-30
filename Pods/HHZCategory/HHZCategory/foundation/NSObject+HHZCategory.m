//
//  NSObject+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSObject+HHZCategory.h"

#import <objc/runtime.h>

@implementation NSObject (HHZUtils_CheckObj)

-(NSArray *)checkArray_hhz
{
    if (![self isKindOfClass:[NSArray class]])
    {
        return [NSArray array];
    }
    return (NSArray *)self;
}

-(NSDictionary *)checkDictionary_hhz
{
    if (![self isKindOfClass:[NSDictionary class]])
    {
        return [NSDictionary dictionary];
    }
    return (NSDictionary *)self;
}

@end

@implementation NSObject (HHZUtils_RunTime)

-(NSArray *)getPrivateApiMethod_hhz
{
    //获取当前类名
    NSString * className = NSStringFromClass([self class]);
    const char * cClassName = [className UTF8String];
    //实例化对象
    id theClass = objc_getClass(cClassName);
    unsigned int methodCount;
    //获取方法列表
    Method * methods = class_copyMethodList(theClass, &methodCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < methodCount; i++)
    {
        //获取方法SEL并转换成字符串
        SEL aSEL = method_getName(*(methods + i));
        NSString * apiStr = NSStringFromSelector(aSEL);
        [arr addObject:apiStr];
    }
    //记得释放
    free(methods);
    return arr;
}

-(NSArray *)getPrivateApiProperty_hhz
{
    unsigned int propertyCount;
    //获取对象属性列表
    objc_property_t * properties = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < propertyCount; i++)
    {
        //获取属性名称
        objc_property_t property = properties[i];
        NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [arr addObject:propertyStr];
    }
    //记得释放
    free(properties);
    return arr;
}

-(NSArray *)getPrivateApiPropertyAndPropertyType_hhz
{
    unsigned int propertyCount;
    objc_property_t * properties = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray * totalArr = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray * arr1 = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray * arr2 = [NSMutableArray arrayWithCapacity:1];
    NSUInteger loc = 3;
    NSUInteger len = 0;
    NSString * propertyStr = nil;
    NSString * att = nil;
    for (int i = 0; i < propertyCount; i++)
    {
        objc_property_t property = properties[i];
        propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [arr1 addObject:propertyStr];
        
        len = [att rangeOfString:@","].location - loc - 1;
        att = [[NSString alloc] initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        [arr2 addObject:[NSString stringWithString:[att substringWithRange:NSMakeRange(loc, len)]]];
    }
    [totalArr addObject:arr1];
    [totalArr addObject:arr2];
    return totalArr;
    
}

@end

@implementation NSObject (HHZUtils_Model)

-(instancetype)convertModelWithDictionary_hhz:(NSDictionary *)dict
{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    
    for (int i = 0; i < count; i ++) {
        
        objc_property_t property = properties[i];
        //        属性名
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        //        属性类型
        char * propertyTypeC = property_copyAttributeValue(property, "T");
        NSString *propertyType = [NSString stringWithCString:propertyTypeC encoding:NSUTF8StringEncoding];
        free(propertyTypeC);
        
        if (!(propertyName.length > 0 && propertyType.length > 0))
        {
            continue;
        }
        
        NSRange range = NSMakeRange(2, [propertyType length]-3);
        if ([propertyType isEqualToString:@"B"])
        {
            propertyType = @"BOOL";
        }
        else if ([propertyType isEqualToString:@"d"])
        {
            propertyType = @"CGFloat";
        }
        else if ([propertyType isEqualToString:@"q"])
        {
            propertyType = @"NSInteger";
        }
        else if ([propertyType isEqualToString:@"Q"])
        {
            propertyType = @"NSUInteger";
        }
        else
        {
            propertyType = [propertyType substringWithRange:range];
        }
        
        id object = [dict objectForKey:propertyName];
        
        if (object != nil)
        {
            
            if ([object isKindOfClass:[NSArray class]])
            {//如果取出的object是数组，做特殊处理
                
                NSMutableArray *modelArray = [NSMutableArray array];
                for (id obj in object)
                {
                    
                    if ([obj isKindOfClass:[NSDictionary class]])
                    {//如果数组里面是字典，构造另一个类的对象放入数组
                        /**
                         *  通过属性名获取类的对象
                         */
                        id arrayObject = [[NSClassFromString([propertyName capitalizedString])alloc]init];
                        arrayObject = [arrayObject convertModelWithDictionary_hhz:obj];
                        [modelArray addObject:arrayObject];
                        
                    }
                    else
                    {//如果数组里面不是字典，直接加入
                        [modelArray addObject:obj];
                    }
                    
                    
                }
                [self setValue:modelArray forKey:propertyName];
                
            }
            else if([object isKindOfClass:[NSDictionary class]])
            {//如果取出的object是字典，使用另一个类的对象作为属性
                
                /**
                 *  通过属性名获取类的对象
                 */
                id dicObject = [[NSClassFromString([propertyName capitalizedString])alloc]init];
                dicObject = [dicObject convertModelWithDictionary_hhz:object];
                [self setValue:dicObject forKey:propertyName];
                
            }
            else
            {
                //                if ([object isKindOfClass:NSClassFromString(propertyType)]){//object和属性类型相同直接赋值
                //                    [self setValue:object forKey:propertyName];
                //                }
                [self setValue:object forKey:propertyName];
            }
            
        }
        else
        {
            //            [self setNilValueForKey:propertyName];
        }
        
    }
    
    free(properties);
    
    return self;
}

@end


@implementation NSObject (HHZUtils_Archive)

-(void)encode_hhz:(NSCoder *)encoder
{
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int memberCount = 0;
        Ivar *ivars = class_copyIvarList(c, &memberCount);
        for (int i = 0; i<memberCount; i++)
        {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            if ([self respondsToSelector:@selector(ignoredMemberNames_hhz)]) {
                if ([[self ignoredMemberNames_hhz] containsObject:key]) continue;
            }
            id value = [self valueForKeyPath:key];
            if(value)
            {
                [encoder encodeObject:value forKey:key];
            }
            
        }
        
        free(ivars);
        c = [c superclass];
    }
}

-(void)decode_hhz:(NSCoder *)decoder
{
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int memberCount = 0;
        Ivar *ivars = class_copyIvarList(c, &memberCount);
        for (int i = 0; i<memberCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            if ([self respondsToSelector:@selector(ignoredMemberNames_hhz)]) {
                if ([[self ignoredMemberNames_hhz] containsObject:key]) continue;
            }
            id value = [decoder decodeObjectForKey:key];
            if (value)
            {
                [self setValue:value forKeyPath:key];
            }
            
        }
        
        free(ivars);
        c = [c superclass];
    }
}

-(NSArray *)ignoredMemberNames_hhz
{
    return nil;
}

@end

#pragma mark HHZUtils_KVO

@interface HHZObjectKVOTarget : NSObject
@property (nonatomic, copy) void (^block)(__weak id obj,id oldValue,id newValue,void * context);
/**
 *  初始化Block
 *
 *  @param block Block代码块
 *
 *  @return Target对象
 */
-(id)initWithBlock:(void (^)(__weak id obj,id oldValue,id newValue,void * context))block;
@end

@implementation HHZObjectKVOTarget

-(id)initWithBlock:(void (^)(__weak id, id, id, void *))block
{
    if (self == [super init])
    {
        self.block = block;
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (!self.block) return;
    
    //只接受改变时候的消息
    BOOL isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (isPrior) return;
    NSKeyValueChange valueChange = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (valueChange != NSKeyValueChangeSetting) return;
    
    //监听新旧值
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldValue == [NSNull null]) oldValue = nil;
    
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    if (newValue == [NSNull null]) newValue = nil;
    
    //回调
    self.block(object,oldValue,newValue,context);
}

@end


static const int Block_Key;

@implementation NSObject (HHZUtils_KVO)

-(void)addObserverBlockForKeyPath_hhz:(NSString *)keyPath Block:(void (^)(__weak id _Nonnull, id _Nonnull, id _Nonnull, void * _Nonnull))block
{
    if (!keyPath || !block) return;
    
    HHZObjectKVOTarget * target = [[HHZObjectKVOTarget alloc] initWithBlock:block];
    //根据时间戳生成Context
    NSString * observerContext = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]*1000];
    
    //将观察对象存入字典对象中
    NSMutableDictionary * dic = [self getAssocoatedDictionary];
    NSMutableArray * arr = dic[keyPath];
    if(!arr) arr = [NSMutableArray array];
    
    [arr addObject:target];
    dic[keyPath] = arr;
    
    [self addObserver:target forKeyPath:keyPath options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:(__bridge void * _Nullable)(observerContext)];
}

//获取关联字典对象
-(NSMutableDictionary *)getAssocoatedDictionary
{
    NSMutableDictionary * dic = objc_getAssociatedObject(self, &Block_Key);
    if (!dic)
    {
        dic = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &Block_Key, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

-(void)removeObserverKeyPath_hhz:(NSString *)keyPath
{
    NSMutableDictionary * dic = [self getAssocoatedDictionary];
    NSMutableArray * arr = dic[keyPath];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObserver:obj forKeyPath:keyPath];
    }];
    
    [dic removeObjectForKey:keyPath];
}

-(void)removeObserverKeyPath_hhz:(NSString *)keyPath Context:(void *)context
{
    NSMutableDictionary * dic = [self getAssocoatedDictionary];
    NSMutableArray * arr = dic[keyPath];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObserver:obj forKeyPath:keyPath context:context];
    }];
    
    [dic removeObjectForKey:keyPath];
}


-(void)removeAllObserverStore_hhz
{
    NSMutableDictionary * dic = [self getAssocoatedDictionary];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [((NSArray *)obj) enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self removeObserver:obj forKeyPath:key];
        }];
    }];
    
    [dic removeAllObjects];
}
@end
