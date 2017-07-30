//
//  HHZNavigationController.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZNavigationController : UINavigationController

/**
 *  设置Navi的文本颜色，字体大小以及是否加粗
 *  textColor 字体颜色
 *  fontSize  字体大小（不能为空）
 *  isBold    是否加粗
 */
-(void)configNaviSchemeTextColor:(UIColor *)textColor textfontSize:(CGFloat)fontSize isBlod:(BOOL)isBold;

/**
 *  设置Navi的背景颜色
 *  tintColor Navi背景颜色
 */
-(void)configNaviSchemeBarTintColor:(UIColor *)tintColor;
@end

NS_ASSUME_NONNULL_END
