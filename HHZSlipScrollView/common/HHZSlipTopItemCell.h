//
//  HHZSlipTopItemCell.h
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HHZBaseClass/HHZLabel.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZSlipTopItemCell : UITableViewCell

+(instancetype)configCellWithTableView:(UITableView *)tableView;
#pragma mark 对外可选实现
/**
 *  显示的文字
 */
@property (nonatomic, strong) HHZLabel * titleLabel;

/**
 *  当前是否被选中
 */
@property (nonatomic, assign) BOOL isSelected;

/**
 *  选中后文字的动画效果
 */
-(void)titleShowAnimate;

@end

NS_ASSUME_NONNULL_END
