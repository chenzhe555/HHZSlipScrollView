//
//  HHZSlipTopItemCell.h
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZSlipTopItemCell : UITableViewCell
/**
 *  当前是否被选中
 */
@property (nonatomic, assign) BOOL isSelected;
/**
 *  显示的文字
 */
@property (nonatomic, strong) UILabel * titleLabel;


#pragma mark Required
/**
 *  配置Cell基本信息
 */
+(instancetype)configCellWithTableView:(UITableView *)tableView title:(NSString *)title;

#pragma mark Optional
/**
 *  选中文字后的动画效果
 */
-(void)titleShowAnimate;
@end

NS_ASSUME_NONNULL_END
