//
//  NSDictionary+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSDictionary+HHZCategory.h"

#pragma mark ----------->NSDictionary

@implementation NSDictionary (HHZUtils_NSDictionary)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [mutaStr appendString:@"}\n"];
    
    return mutaStr;
}

-(NSArray *)allSortedKeys_hhz
{
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

-(NSString *)getStringValueForKey_hhz:(NSString *)key DefaultString:(NSString *)defString
{
    if (!key) return defString;
    id value = self[key];
    
    if (!value || value == [NSNull null]) return defString;
    if ([value isKindOfClass:[NSNumber class]]) return ((NSNumber *)value).description;
    if ([value isKindOfClass:[NSString class]]) return value;
    
    return defString;
}
@end





#pragma mark ----------->NSMutableDictionary
@implementation NSMutableDictionary (HHZUtils_NSMutableDictionary)

-(void)setObject_hhz:(id)aObject Key:(id<NSCopying>)aKey
{
    if (!aKey) return;
    //nil时塞入Null对象
    if (!aObject) [self setObject:[NSNull null] forKey:aKey];
    
    [self setObject:aObject forKey:aKey];
}


@end
