//
//  NSNumber+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/27.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSNumber+HHZCategory.h"

@implementation NSNumber (HHZUtils_AddMethod)

-(NSInteger)length
{
    return [NSString stringWithFormat:@"%@",self].length;
}

@end
