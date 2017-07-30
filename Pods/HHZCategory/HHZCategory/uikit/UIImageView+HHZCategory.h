//
//  UIImageView+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark 添加点击事件
@interface UIImageView (HHZUtils_AddTarget)
/**
 *  给图片添加点击事件
 *
 *  @param target
 *  @param selector
 */
-(void)addTarget_hhz:(id)target andSelector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
