//
//  HHZSlipTopScrollView.h
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

//顶部按钮分布规则
typedef NS_ENUM(NSInteger,HHZSlipTopScrollViewItemAreaType) {
    HHZSlipTopScrollViewItemAreaTypeRegulation = 111,    //根据文字宽度最大均等分配
    HHZSlipTopScrollViewItemAreaTypeNotRegulation,       //根据文字宽度不均等分配
    HHZSlipTopScrollViewItemAreaTypeByScreenWidth,       //根据屏幕大小平均分配
};

NS_ASSUME_NONNULL_BEGIN

@interface HHZSlipTopScrollView : UITableView
/**
 *  显示文字的数据源
 */
@property (nonatomic, strong) NSMutableArray * titleArray;
/**
 *  缓存的高度数组
 */
@property (nonatomic, strong) NSMutableArray * heightArray;
/**
 *  当前文本最大宽
 */
@property (nonatomic, assign) CGFloat maxHeight;

/**
 *  label宽度分布类型(默认 HHZSlipTopScrollViewItemAreaTypeRegulation)
 */
@property (nonatomic, assign) HHZSlipTopScrollViewItemAreaType areaType;

#pragma mark Required

#pragma mark Optional

@end

NS_ASSUME_NONNULL_END
