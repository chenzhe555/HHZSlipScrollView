//
//  HHZSlipScrollView.h
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/31.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZSlipTopScrollView.h"
@class HHZSlipBottomScrollView;

NS_ASSUME_NONNULL_BEGIN

@protocol HHZSlipScrollViewDelegate <NSObject>

//获取顶部滚动视图文字数组
-(NSArray *)hhz_SlipScrollViewTopTitleArray:(UITableView *)topScrollView;

//底部视图滚动回调
-(void)hhz_SlipViewBottomViewScroll:(UIView *)vc index:(NSInteger)index;

//获取底部滚动视图数组
-(NSArray *)hhz_SlipScrollViewBottomViewArray:(UITableView *)bottomScrollView;

@end


//顶部滚动View的类型
typedef NS_ENUM(NSInteger,HHZSlipTopScrollViewItemFillType) {
    HHZSlipTopScrollViewItemFillTypeNone = 222,      //没有任何效果
    HHZSlipTopScrollViewItemFillTypeLine,            //底部有一根线
    HHZSlipTopScrollViewItemFillTypeFill,            //文字被包住
    HHZSlipTopScrollViewItemFillTypeTotalFill,       //每个Item全部被包住
};

@interface HHZSlipScrollView : UIView
#pragma mark Required
@property (nonatomic, assign) id<HHZSlipScrollViewDelegate> delegate;
/**
 *  配置完所有基本信息后创建视图
 */
-(void)createHHZSlipScrollView;

#pragma mark Optional
-(void)modifySlipTopScrollViewItemAreaType:(HHZSlipTopScrollViewItemAreaType)areaType;
/**
 *  修改顶部Scroll到Item填充样式(默认HHZSlipTopScrollViewItemFillTypeNone)
 */
-(void)modifySlipTopScrollViewItemFillType:(HHZSlipTopScrollViewItemFillType)fillType;
/**
 *  修改顶部Scroll的高度(默认44)
 */
-(void)modifySlipTopScrollViewHeight:(CGFloat)height;
/**
 *  scroll两边是否能继续拉动(默认不能)
 */
-(void)modifyScrollBounces:(BOOL)isBounces;
/**
 *  生成滚动视图后第一个显示的Item(默认第一个)
    showIndex 索引值
 */
-(void)configFirstShowItemIndex:(NSInteger)showIndex;

/**
 *  顶部滚动到某个Index处(默认第一个)
 *
 *  @param scrollIndex 以0为开始
 */
-(void)switchTopScrollToIndex:(NSInteger)scrollIndex;
/**
 *  底部滚动到某个Index处(默认第一个)
 *
 *  @param scrollIndex 以0为开始
 */
-(void)switchBottomScrollToIndex:(NSInteger)scrollIndex;

@end

NS_ASSUME_NONNULL_END
