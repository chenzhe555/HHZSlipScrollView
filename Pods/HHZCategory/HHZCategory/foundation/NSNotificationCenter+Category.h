//
//  NSNotificationCenter+Category.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (HHZUtils_OnMainThread)
/**
 *  在主线程上发送通知
 *
 *  @param name     通知名
 *  @param object   传值
 *  @param userInfo 带的信息
 *  @param wait     是否等待
 */
-(void)postNotificationOnMainThreadWithName_hhz:(NSString *)name Object:(nullable id)object UserInfo:(nullable NSDictionary *)userInfo WaitUntilDone:(BOOL)wait;

@end


NS_ASSUME_NONNULL_END
