//
//  UIView+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark 视图Rect
@interface UIView (setFrame)

/**
 *  设置 获取Origin
 *
 *  @return
 */
-(CGPoint)origin;
-(void)setOrigin:(CGPoint) point;

/**
 *  设置 获取size
 *
 *  @return
 */
-(CGSize)size;
-(void)setSize:(CGSize) size;

/**
 *  设置 获取x
 *
 *  @return
 */
-(CGFloat)x;
-(void)setX:(CGFloat)x;

/**
 *  设置 获取y
 *
 *  @return
 */
-(CGFloat)y;
-(void)setY:(CGFloat)y;

/**
 *  设置 获取height
 *
 *  @return
 */
-(CGFloat)height;
-(void)setHeight:(CGFloat)height;

/**
 *  设置 获取width
 *
 *  @return
 */
-(CGFloat)width;
-(void)setWidth:(CGFloat)width;

/**
 *  设置 获取xPlusWidth(x + width)
 *
 *  @return
 */
-(CGFloat)xPlusWidth;
-(void)setXPlusWidth:(CGFloat)xPlusWidth;

/**
 *  设置 获取yPlushHeight(y + height)
 *
 *  @return
 */
-(CGFloat)yPlushHeight;
-(void)setYPlushHeight:(CGFloat)yPlushHeight;

@end

#pragma mark 修复Xcode显示视图树的Bug
@interface UIView (FixViewDebugging)

@end

#pragma mark 截当前屏幕图
@interface UIView(Screenshot)

- (UIImage *)generateScreenShot;

@end

#pragma mark 波纹动画
@interface UIView(rippleEffect)

- (void)showRippleEffect;

@end

NS_ASSUME_NONNULL_END
