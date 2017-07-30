//
//  HHZLabel.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HHZLabel : UILabel
/**
 *  Label的尺寸
 */
@property (nonatomic, assign) CGSize labelSize;
/**
 *  限制的文本宽度(实现自定义类型的时候必须传入的值，默认为屏幕宽)
 */
@property (nonatomic, assign) CGFloat limitWidth;

/**
 *  限制的文本行数(实现自定义类型的时候必须传入的值，默认为0)
 */
@property (nonatomic, assign) NSInteger limitNumbers;

/**
 *  是否自动改变Label的Frame(默认改变)
 */
@property (nonatomic, assign) BOOL isChangeFrame;
@end
