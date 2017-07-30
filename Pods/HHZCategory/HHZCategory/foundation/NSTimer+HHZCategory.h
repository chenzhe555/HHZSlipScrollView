//
//  NSTimer+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

#pragma mark 改变计时器状态
@interface NSTimer (HHZUtils_State)

/**
 *  调用NSTime实例暂停定时器
 */
-(void)pauseTimer;

/**
 *  调用NSTime实例恢复定时器
 */
-(void)resumeTimer;

/**
 *  调用NSTime实例在特定时间后恢复定时器
 *
 *  @param interval 多少时间后恢复定时器
 */
-(void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

/**
 *  启动一个定时器
 *
 *  @param ti      调用间隔时间
 *  @param yesOrNo 是否重复
 *  @param block   回调
 *
 *  @return 时间对象
 */
+(NSTimer *)scheduledTimerWithTimeInterval_hhz:(NSTimeInterval)ti repeats:(BOOL)yesOrNo Block:(void (^)(NSTimer * timer))block;

@end


NS_ASSUME_NONNULL_END
