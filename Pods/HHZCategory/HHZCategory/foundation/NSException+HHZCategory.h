//
//  NSException+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSException (HHZUtils_Trace)

/**
 *  异常Exception调用，用于打印当前异常堆栈信息
 *
 *  @return
 */
-(NSArray *)backtrace_hhz;

@end

NS_ASSUME_NONNULL_END

