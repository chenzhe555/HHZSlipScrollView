//
//  UILabel+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark 添加点击事件
@interface UILabel (HHZUtils_AddTarget)
/**
 *  对UILabel添加事件
 *
 *  @param vc
 *  @param selector
 */
-(void)addTarget_hhz:(id)labelTarget andSelector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
