//
//  HHZSlipScrollManager.h
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/31.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZSlipScrollManager : NSObject
//顶部视图的滚动视图颜色
@property (nonatomic, strong) UIColor * bottomScrollViewColor;
//顶部文字的正常颜色状态
@property (nonatomic, strong) UIColor * titleNormalColor;
//顶部文字的选中颜色状态
@property (nonatomic, strong) UIColor * titleSelectedColor;
//顶部文字的字体
@property (nonatomic, strong) UIFont * titleFont;
//文字左右的间隙
@property (nonatomic, assign) CGFloat cellItemSpace;

/**
 *  获取配置信息的单例
 */
+(HHZSlipScrollManager *)shareManager;

@end

NS_ASSUME_NONNULL_END
