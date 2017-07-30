//
//  NSArray+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSArray+HHZCategory.h"
#import <objc/runtime.h>

#pragma mark NSArray

@implementation NSArray (HHZUtils_NSArray)

-(nullable NSString *)descriptionWithLocale:(id)locale
{
    if (!locale) return nil;
    
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@,\n", obj];
    }];
    
    [mutaStr appendString:@")"];
    
    return mutaStr;
}

-(id)objectMaybeNilAtIndex_hhz:(NSInteger)index
{
    return (index >= 0 && index < self.count) ? self[index] : nil;
}

@end







#pragma mark NSMutableArray

@implementation NSMutableArray (HHZUtils_NSMutableArray)

-(void)removeFirstObject_hhz
{
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

-(void)removeLastObject_hhz
{
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}

-(void)insertArray_hhz:(NSArray *)arr atIndex:(NSUInteger)index
{
    for (id obj in arr)
    {
        [self insertObject:obj atIndex:index++];
    }
}

-(void)reverseArray_hhz
{
    NSUInteger arrCount = self.count;
    NSUInteger arrMiddle = floor(arrCount / 2.0);
    //二分
    for (NSUInteger i = 0;i < arrMiddle;++i)
    {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(arrCount - (i + 1))];
    }
}

@end
