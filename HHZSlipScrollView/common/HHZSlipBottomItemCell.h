//
//  HHZSlipBottomItemCell.h
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/8/2.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZSlipBottomItemCell : UITableViewCell
@property (nonatomic, strong) UIView * pasteView;
/**
 *  配置Cell基本信息
 */
+(instancetype)configCellWithTableView:(UITableView *)tableView contentView:(UIView *)contentView;
@end

NS_ASSUME_NONNULL_END
