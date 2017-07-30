//
//  HHZTableViewCell.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HHZTableViewCell : UITableViewCell
/**
 *  Cell下方的分割线
 */
@property (nonatomic, strong) UIView * spliteLine;

/**
 *  Cell用于存储Index
 */
@property (nonatomic, strong) NSIndexPath * cellIndexPath;

/**
 *  增加一些基本参数配置
 */
-(void)addBasicInfoConfig;

/**
 *  添加默认的分割线
 *
 *  @param color 分割线颜色，nil为默认颜色
 */
-(void)addDefaultSeparateLine:(UIColor *)color;

/**
 *  配置Cell(切换不要调用[super configCellWithTableView])
 *
 *  @param tableView 当前tableview
 *  @param indexPath 索引值
 *
 *  @return
 */
+(instancetype)configCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;
@end
