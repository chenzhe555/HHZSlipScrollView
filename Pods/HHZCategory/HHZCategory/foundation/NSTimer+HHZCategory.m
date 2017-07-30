//
//  NSTimer+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSTimer+HHZCategory.h"

@implementation NSTimer (HHZUtils_State)

-(void)pauseTimer
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

+(void)hhz_callbackBlock:(NSTimer *)timer
{
    if ([timer userInfo])
    {
        void (^block)(NSTimer * timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+(NSTimer *)scheduledTimerWithTimeInterval_hhz:(NSTimeInterval)ti repeats:(BOOL)yesOrNo Block:(void (^)(NSTimer * _Nonnull))block
{
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(hhz_callbackBlock:) userInfo:[block copy] repeats:yesOrNo];
}

@end
