//
//  UIScreen+Category.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UIScreen+Category.h"

@implementation UIScreen (HHZUtils_UIScreen)

+(CGFloat)screenScale_hhz
{
    static CGFloat scale;
    static dispatch_once_t once_Token;
    dispatch_once(&once_Token, ^{
        if ([NSThread mainThread]) scale = [[UIScreen mainScreen] scale];
        
        //同步在主线程中获取
        dispatch_sync(dispatch_get_main_queue(), ^{
            scale = [[UIScreen mainScreen] scale];
        });
    });
    return scale;
}

-(CGRect)screenBoundsWithOrientation_hhz:(UIInterfaceOrientation)orientation
{
    CGRect screenBound = [self bounds];
    
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        CGFloat height = screenBound.size.width;
        screenBound.size.width = screenBound.size.height;
        screenBound.size.height = height;
    }
    return screenBound;
}

@end
