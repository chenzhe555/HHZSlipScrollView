//
//  NSException+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSException+HHZCategory.h"
#include <execinfo.h>

@implementation NSException (HHZUtils_Trace)

- (NSArray *)backtrace_hhz
{
    NSArray *addresses = self.callStackReturnAddresses;
    unsigned count = (int)addresses.count;
    void **stack = malloc(count * sizeof(void *));
    
    for (unsigned i = 0; i < count; ++i)
    {
        stack[i] = (void *)[addresses[i] longValue];
    }
    
    
    char ** strings = (char **)backtrace_symbols(stack, count);
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i)
    {
        [ret addObject:@(strings[i])];
    }
    
    
    free(stack);
    free(strings);
    
    return ret;
}

@end
