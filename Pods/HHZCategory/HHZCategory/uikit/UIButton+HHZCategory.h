//
//  UIButton+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#pragma mark 便利设置器

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HHZUtils_SetAttribution)
/**
 *  设置button文字(正常、选中)
 *
 *  @param normalTitle   正常情况下
 *  @param selectedTitle 选中情况下
 */
-(void)setNormalTitle_hhz:(nullable NSString *)normalTitle andSelectedTitle:(nullable NSString *)selectedTitle;

/**
 *  设置button的图片(正常、高亮、选中)
 *
 *  @param normalImage   正常情况下
 *  @param highImage     高亮情况下
 *  @param selectedImage 选中情况下
 */
-(void)setNormalImage_hhz:(nullable UIImage *)normalImage andHighlightImage:(nullable UIImage *)highImage andSelectedImage:(nullable UIImage *)selectedImage;

/**
 *  设置button背景图片(正常、高亮、选中)
 *
 *  @param normalImage   正常情况下
 *  @param highImage     高亮情况下
 *  @param selectedImage 选中情况下
 */
-(void)setNormalBackgroundImage_hhz:(nullable UIImage *)normalImage andHighlightBackgroundImage:(nullable UIImage *)highImage andSelectedBackgroundImage:(nullable UIImage *)selectedImage;

/**
 *  改变button的圆角度数
 填0则是6.0f
 *
 *  @param radius
 */
-(void)changeCornerRadius_hhz:(CGFloat)radius;
@end


NS_ASSUME_NONNULL_END
