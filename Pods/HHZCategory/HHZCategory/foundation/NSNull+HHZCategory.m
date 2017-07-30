//
//  NSNull+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSNull+HHZCategory.h"
#import <objc/runtime.h>

//返回默认值0
NSUInteger getDefaultLength(id self,SEL _cmd)
{
    return 0;
}

@implementation NSNull (HHZUtils_Forward)
/**
 *  如果调用length和count， 默认返回0(这个只是为了测试消息转发，实际项目没必要做这么麻烦,参照NSNumber即可)
 *
 *  @param sel 方法
 *
 *  @return 是否接收消息
 */
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(length) || sel == @selector(count))
    {
        class_addMethod([self class], sel, (IMP) getDefaultLength, "I@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
